%{	
	
		// lang imports
	import java.lang.Integer;
	import java.lang.Double;
	
	// Collections imports
	import java.util.ArrayList;
	import java.util.Iterator;
	import java.util.List;
	
	// AST NODES imports
	import org.eclipse.dltk.ast.ASTNode;
	import org.eclipse.dltk.ast.ASTListNode;
	import org.eclipse.dltk.ast.expressions.CallArgumentsList;
	import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
	import org.eclipse.dltk.ast.statements.Statement;
	import org.eclipse.dltk.ast.declarations.Declaration;
	import org.eclipse.dltk.ast.declarations.Argument;
	import org.eclipse.dltk.ast.declarations.Decorator;
	import org.eclipse.dltk.ast.declarations.FieldDeclaration;
	import org.eclipse.dltk.ast.declarations.MethodDeclaration;
	import org.eclipse.dltk.ast.declarations.TypeDeclaration;
	import org.eclipse.dltk.ast.expressions.Expression;
	import org.eclipse.dltk.ast.statements.Block;
	import org.eclipse.dltk.ast.expressions.CallExpression;
	import org.eclipse.dltk.ast.expressions.MethodCallExpression;
	import org.eclipse.dltk.ast.expressions.Literal;
	import org.eclipse.dltk.ast.expressions.BigNumericLiteral;
	import org.eclipse.dltk.ast.expressions.BooleanLiteral;
	import org.eclipse.dltk.ast.expressions.FloatNumericLiteral;
	import org.eclipse.dltk.ast.expressions.NilLiteral;
	import org.eclipse.dltk.ast.expressions.NumericLiteral;
	import org.eclipse.dltk.ast.expressions.StringLiteral;
	import org.eclipse.dltk.ast.references.Reference;
	import org.eclipse.dltk.ast.references.SimpleReference;
	import org.eclipse.dltk.codeassist.complete.CompletionOnKeyword;
	import org.eclipse.dltk.ast.references.ConstantReference;
	import org.eclipse.dltk.ast.references.TypeReference;
	import org.eclipse.dltk.ast.references.VariableReference;
  
  	// own AST nodes import  	
	import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.*;
	import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.*;
	
	// tokens type
	import com.blogspot.miguelinlas3.bison.ScannerToken;

%}
%define public
%define parser_class_name "RBisonParser"
%define package "com.blogspot.miguelinlas3.bison"
%define stype "org.eclipse.dltk.ast.ASTNode"
%debug

%code{
	/* Variables de estado en el lexer y el parser*/
	public static int	EatLines = 0;
	public static int	GenerateCode = 0;
	public static int	EndOfFile = 0;
	public static int	xxcharcount, xxcharsave;
	public static int	xxlineno, xxbyteno, xxcolno,  xxlinesave, xxbytesave, xxcolsave;
	
	public static final char LBRACE	= '{';
	public static final char RBRACE	= '}';
	
	public static final int CONTEXTSTACK_SIZE = 50;
	public static int savedToken, contextpIndex = 0, contextStackIndex = 0;
	//public static SEXP	savedLval;
	public static char	contextstack[]= new char[CONTEXTSTACK_SIZE], contextp[];
	public static final int PUSHBACK_BUFSIZE = 16;
	public static int[] pushback = new int[PUSHBACK_BUFSIZE];
	public static int npush = 0;
	public static int prevpos = 0;
	public static int[] prevlines = new int[PUSHBACK_BUFSIZE];
	public static int[] prevcols = new int[PUSHBACK_BUFSIZE];
	public static int[] prevbytes = new int[PUSHBACK_BUFSIZE];
	
	public static final int MAXFUNSIZE = 131072;
	public static final int MAXNEST = 265;	
	static char [] functionSource = new char[MAXFUNSIZE];
	static char[] FunctionStart = new char[MAXNEST];
	static char[] sourcePtr;
	static int sourcePtrIndex;
	static int functionLevel = 0;
	static int keepSource;
}

%code{

	/**
	* Nodo raiz del AST construida durante el reconocimiento sintactico
	*/
	protected RModuleDeclaration root = new RModuleDeclaration(0);
	
	public RModuleDeclaration getASTRoot(){
		return this.root;
	}
	
	/**
	* Determina si el analizador lexico debe ignorar los saltos de linea
	*/
	public static boolean SKIP_NEW_LINE = false;
	
}

%token		END_OF_INPUT ERROR
%token		STR_CONST NUM_CONST NULL_CONST SYMBOL FUNCTION COMMENT 
%token		LEFT_ASSIGN EQ_ASSIGN RIGHT_ASSIGN LBB
%token		FOR IN IF ELSE WHILE NEXT BREAK REPEAT
%token		GT GE LT LE EQ NE AND OR AND2 OR2
%token		NS_GET NS_GET_INT
%token		LIBRARY_IMPORT

/* Tabla de precendencias, de mas baja a mas alta */
%left		'?'
%left		LOW WHILE FOR REPEAT
%right		IF
%left		ELSE
%right		LEFT_ASSIGN
%right		EQ_ASSIGN
%left		RIGHT_ASSIGN
%left		'~' TILDE
%left		OR OR2
%left		AND AND2
%left		UNOT NOT
%nonassoc   	GT GE LT LE EQ NE
%left		'+' '-'
%left		'*' '/'
%left		SPECIAL
%left		':'
%left		UMINUS UPLUS
%right		'^'
%left		'$' '@'
%left		NS_GET NS_GET_INT
%nonassoc	'(' '[' LBB

%%

script:
		END_OF_INPUT				{}
	
	|	'\n'						{}
	
	|	'\n' script					{}	
	
	| 	prog 						{ root.addStatement($1);	}
	
	
	| 	script ';' prog 
									{
										this.root.addStatement($3);
									}
	| 	script ';'					
									{
										$$ = $1;
									}
	| 	script '\n' prog 
									{
										this.root.addStatement($3);
									}
	| 	script '\n'
									{
										$$ = $1;
									}	
	|	error	 					 
									{
										System.out.println("ERROR");
									}		 
		

prog	:	
		expr_or_assign				 {$$ = $1;}		   				
	;

expr_or_assign  :    expr                         {$$ = $1;}	
                |    equal_assign                 {$$ = $1;}                
                ;        

equal_assign    :    expr EQ_ASSIGN expr_or_assign              {$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),$1,$3);}
                ;

expr	: 
	
		expr error '\n'			  {$$ = $1;}	
			
	|	NUM_CONST		
						{
							ScannerToken token = (ScannerToken)$1;
							Double value;
							String tokenText = token.getText();
							value = tokenText != null? Double.parseDouble(tokenText):0;
							$$ = new FloatNumericLiteral(token.getOffset(),token.getOffset() + token.getLength(),value);
						}
	|	STR_CONST		
						{
							ScannerToken token = (ScannerToken)$1;
							$$ = new StringLiteral(token.getOffset(),token.getOffset() + token.getLength(),token.getText());
						}
	|	NULL_CONST		{
							ScannerToken token = (ScannerToken)$1;
							$$ = new NilLiteral(token.getOffset(),token.getOffset() +token.getLength());
						}
	|	SYMBOL			{										
							ScannerToken token = (ScannerToken)$1;
							$$ = new VariableReference(token.getOffset(),token.getOffset() + token.getLength() ,token.getText());
						}
		
	|	'{' exprlist '}'		
						{							
							RBisonParser.SKIP_NEW_LINE = false;													
							((RBlock)$2).setLeftBracePos(@1.begin.getFirstColumn());
							((RBlock)$2).setRightBracePos(@3.begin.getLastColumn());
							$2.setStart($2.sourceStart());
							$2.setEnd($2.sourceEnd());
							$$ = $2;
						}
	|	'(' expr_or_assign ')'	
						{
							$2.setStart(@1.begin.getFirstColumn());
							$2.setEnd(@3.begin.getLastColumn());
							$$ = $2;
						}						
	|	'-' expr %prec UMINUS	
							{								
								$$ = new UnaryExpression(RExpressionConstansExtension.E_MINUS,@1.begin.getFirstColumn(),$2);
							}
	|	'+' expr %prec UMINUS	
							{								
								$$ = new UnaryExpression(RExpressionConstansExtension.E_PLUS,@1.begin.getFirstColumn(),$2);
							}
	|	'!' expr %prec UNOT		
							{								
								$$ = new UnaryExpression(RExpressionConstansExtension.E_LNOT,@1.begin.getFirstColumn(),$2);
							}
	|	'~' expr %prec TILDE	
							{								
								$$ = new UnaryExpression(RExpressionConstansExtension.E_TILDE,@1.begin.getFirstColumn(),$2);							
							}
	|	'?' expr				
							{
								ScannerToken token = (ScannerToken)$2;
								$$ = new UnaryExpression(RExpressionConstansExtension.E_QUESTION,@1.begin.getFirstColumn(),$2);
							}
							
	|	expr ':'  expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_SEMI_COLON,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr '+'  expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PLUS,@2.begin.getFirstColumn(),$1,$3);
						}	
	|	expr '-' expr	
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_MINUS,@2.begin.getFirstColumn(),$1,$3);
						}	
	|	expr '*' expr
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_MULT,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr '/' expr		
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_DIV,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr '^' expr 	
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_POWER,@2.begin.getFirstColumn(),$1,$3);
						}		
	//|	expr SPECIAL expr	{}
	
	|	expr '%' expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_MOD,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr '~' expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_TILDE,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr '?' expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_QUESTION,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr LT expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_LT,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr LE expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_LE,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr EQ expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_EQUAL,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr NE expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_NOT_EQUAL,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr GE expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_GE,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr GT expr	
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_GT,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr AND expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_AND_SINGLE,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr OR expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_OR_SINGLE,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr AND2 expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_LAND,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr OR2 expr			
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_LOR,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr LEFT_ASSIGN expr 	
						{
							// meter un nodo AST para asignaciones o dejar este mismo??
							$$ = new BinaryExpression(RExpressionConstansExtension.E_LEFT_ASSIGN,@2.begin.getFirstColumn(),$1,$3);
						}
	|	expr RIGHT_ASSIGN expr 	
						{ 
							$$ = new BinaryExpression(RExpressionConstansExtension.E_RIGHT_ASSIGN,@2.begin.getFirstColumn(),$1,$3);
						}	
	|	FUNCTION '(' formlist ')' cr expr_or_assign %prec LOW 
						{
							
							RMethodDeclaration method = new RMethodDeclaration("", @1.begin.getFirstColumn(), @1.begin.getLastColumn(),$6.sourceStart(),$6.sourceEnd());
							RArgumentList argumentList = (RArgumentList)$3;
							List args = argumentList.getChilds();
							for(int i=0;i<args.size();++i){
								method.addArgument((RArgument)(args.get(i)));
							}
							method.getStatements().add($6);							
							method.setArgumentsList(argumentList);
							method.setLeftParentPos(@2.begin.getFirstColumn());
							method.setRightParentPos(@4.begin.getFirstColumn());
							$$ = method;							
						}					

	|	LIBRARY_IMPORT '(' STR_CONST ')' 
						{				
							RArgumentList args = new RArgumentList();
							ScannerToken token = (ScannerToken)$3;
							StringLiteral literal = new StringLiteral(token.getOffset(),token.getOffset() +token.getLength(),token.getText());							
							literal.setStart(@3.begin.getFirstColumn());
							literal.setEnd(@3.begin.getLastColumn());
							args.addNode(literal);
							LoadLibraryExpression call = new LoadLibraryExpression(@1.begin.getFirstColumn(),@4.begin.getLastColumn(), args);							
							call.setLeftParentPos(@2.begin.getFirstColumn());
							call.setRightParentPos(@4.begin.getFirstColumn());							
							$$ = call;
							
						}

	|	expr '(' sublist ')'
						{
							// inicialmente el nombre de la funcion estara vacio
							String funcName = "";
							if($1 instanceof VariableReference){
								funcName = ((VariableReference)$1).getName();
							}							
							RMethodCallExpression call = new RMethodCallExpression($1.sourceStart(),@4.begin.getLastColumn(), null,funcName, (RArgumentList)$3);							
							call.setLeftParentPos(@2.begin.getFirstColumn());
							call.setRightParentPos(@4.begin.getFirstColumn());
							$$ = call;
						}												
	|	IF ifcond expr_or_assign
						{
							$$ = new IfStatement((ParenthesisCondition)$2, (Statement)$3,null);
							$$.setStart(@1.begin.getFirstColumn());
							$$.setEnd(@3.begin.getLastColumn());
						}
	|	IF ifcond expr_or_assign ELSE expr_or_assign	
						{
							IfStatement ifStatement = new IfStatement((ParenthesisCondition)$2, (Statement)$3,(Statement)$5);
							ifStatement.setStart(@1.begin.getFirstColumn());
							ifStatement.setEnd(@3.begin.getLastColumn());
							ifStatement.setElseKeywordStartPosition(@4.begin.getFirstColumn());
							$$ = ifStatement;
						}
	|	FOR forcond expr_or_assign %prec FOR 			
						{
							$$ = new ForStatement((ForCondition)$2,(Statement)$3);
							$$.setStart(@1.begin.getFirstColumn());
							$$.setEnd(@3.begin.getLastColumn());
						}
	|	WHILE cond expr_or_assign
						{
							WhileStatement whileStatement = new WhileStatement((ParenthesisCondition)$2, (Statement)$3);
							whileStatement.setStart(@1.begin.getFirstColumn());
							whileStatement.setEnd(@3.begin.getLastColumn());
							$$ = whileStatement;
						}
	|	REPEAT expr_or_assign		
						{
							$$ = new RepeatStatement((Statement)$2);
						} 	
	
	|	expr LBB sublist ']' ']'	
						{
							$$ = new BinaryExpression(RExpressionConstansExtension.E_SCRIPT_DOUBLE_OPERATOR,@2.begin.getFirstColumn(),$1,$3);
						}
	
	|	expr '[' sublist ']'		
						{
							// $$ = new BinaryExpression(RExpressionConstansExtension.E_SCRIPT_SINGLE_OPERATOR,@2.begin.getFirstColumn(),$1,$3);
							$$ = new IndexAccessBinaryExpression(RExpressionConstansExtension.E_SCRIPT_SINGLE_OPERATOR,$1,$3,@2.begin.getFirstColumn(),@4.begin.getFirstColumn());
							$$.setStart($1.sourceStart());
							$$.setEnd(@4.begin.getFirstColumn());
						}
							
	|	SYMBOL NS_GET SYMBOL		
						{
							ScannerToken token1 = (ScannerToken)$1;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							VariableReference reference2 = new VariableReference(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR,@2.begin.getFirstColumn(),reference1,reference2);
						}
	|	SYMBOL NS_GET STR_CONST		
						{
							ScannerToken token1 = (ScannerToken)$1;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
													
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR,@2.begin.getFirstColumn(),reference1,reference2);
						}
	|	STR_CONST NS_GET SYMBOL		
						{
							ScannerToken token1 = (ScannerToken)$3;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$1;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
						
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR,@2.begin.getFirstColumn(),reference2,reference1);
						}
	|	STR_CONST NS_GET STR_CONST	
						{
							ScannerToken token1 = (ScannerToken)$1;
							StringLiteral reference1 = new StringLiteral(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
						
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR,@2.begin.getFirstColumn(),reference1,reference2);
						}
	|	SYMBOL NS_GET_INT SYMBOL	
						{
							ScannerToken token1 = (ScannerToken)$1;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							VariableReference reference2 = new VariableReference(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
						
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR_HIDDEN,@2.begin.getFirstColumn(),reference1,reference2);
						}
	|	SYMBOL NS_GET_INT STR_CONST	
						{
							ScannerToken token1 = (ScannerToken)$1;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
													
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR_HIDDEN,@2.begin.getFirstColumn(),reference1,reference2);
						}
	|	STR_CONST NS_GET_INT SYMBOL	
						{
							ScannerToken token1 = (ScannerToken)$3;
							VariableReference reference1 = new VariableReference(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$1;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR_HIDDEN,@2.begin.getFirstColumn(),reference2,reference1);
						}
	|	STR_CONST NS_GET_INT STR_CONST	
						{
							ScannerToken token1 = (ScannerToken)$1;
							StringLiteral reference1 = new StringLiteral(token1.getOffset(),token1.getOffset() + token1.getLength() ,token1.getText());
							
							ScannerToken token2 = (ScannerToken)$3;
							StringLiteral reference2 = new StringLiteral(token2.getOffset(),token2.getOffset() + token2.getLength() ,token2.getText());						
							$$ = new BinaryExpression(RExpressionConstansExtension.E_PACKAGE_OPERATOR_HIDDEN,@2.begin.getFirstColumn(),reference1,reference2);
						}							
	|	expr '$' SYMBOL			
						{
						    ScannerToken token = (ScannerToken)$3;
							VariableReference reference = new VariableReference(token.getOffset(),token.getOffset() + token.getLength() ,token.getText());
							$$ = new BinaryExpression(RExpressionConstansExtension.E_DOLLAR,@2.begin.getFirstColumn(),$1,reference);
						}
	|	expr '$' STR_CONST		
						{
							ScannerToken token = (ScannerToken)$3;
							StringLiteral literal = new StringLiteral(token.getOffset(),token.getOffset() +token.getLength(),token.getText());
							$$ = new BinaryExpression(RExpressionConstansExtension.E_DOLLAR,@2.begin.getFirstColumn(),$1,literal);
						}
	|	expr '@' SYMBOL	
						{
							ScannerToken token = (ScannerToken)$3;
							VariableReference reference = new VariableReference(token.getOffset(),token.getOffset() + token.getLength() ,token.getText());						
							$$ = new BinaryExpression(RExpressionConstansExtension.E_AT,@2.begin.getFirstColumn(),$1,reference);
						}
	|	expr '@' STR_CONST	
						{
							ScannerToken token = (ScannerToken)$3;
							StringLiteral literal = new StringLiteral(token.getOffset(),token.getOffset() +token.getLength(),token.getText());
							$$ = new BinaryExpression(RExpressionConstansExtension.E_AT,@2.begin.getFirstColumn(),$1,literal);
						}
	|	NEXT			
						{
							ScannerToken token = (ScannerToken)$1;
							$$ = new ContinueStatement(token.getOffset(),token.getOffset() +token.getLength());
						}
	|	BREAK			{
							ScannerToken token = (ScannerToken)$1;
							$$ = new BreakStatement(token.getOffset(),token.getOffset() +token.getLength());
						}
	|   COMMENT	
						{
							ScannerToken token = (ScannerToken)$1;
							$$ = new SingleLineCommentNode(token.getText());
							$$.setStart(token.getOffset());
							$$.setEnd(token.getOffset() +token.getLength());
						}
	|   expr COMMENT 
						{
							$$ = $1;
						}
	;
	
cond	:	'(' expr ')'			
						{
							RBisonParser.SKIP_NEW_LINE = true;
							ParenthesisCondition cond = new ParenthesisCondition((Statement)$2);
							cond.setLeftParenthesisPos(@1.begin.getFirstColumn());
							cond.setRightParenthesisPos(@3.begin.getLastColumn()); 
							$$ = cond;
						}
	;

ifcond	:	'(' expr ')'			
						{
							RBisonParser.SKIP_NEW_LINE = true;
							ParenthesisCondition cond = new ParenthesisCondition((Statement)$2);
							cond.setLeftParenthesisPos(@1.begin.getFirstColumn());
							cond.setRightParenthesisPos(@3.begin.getLastColumn()); 
							$$ = cond;
						}
	;

forcond :	'(' SYMBOL IN expr ')' 	
						{
							RBisonParser.SKIP_NEW_LINE = true;
							ScannerToken token = (ScannerToken)$2;
							VariableReference var = new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText());
							ForCondition forCond= new ForCondition(var,(Statement)$4);
							forCond.setLeftParenthesisPos(@1.begin.getFirstColumn());
							forCond.setRightParenthesisPos(@5.begin.getLastColumn());
							$$ = forCond;
						}
	;
	
	
exprlist:							{										
										$$ = new RBlock(@$.begin.getFirstColumn(),@$.begin.getLastColumn());
									}
	|	expr_or_assign				{ 										
										RBlock block = new RBlock($$.sourceStart(),$$.sourceEnd());
										block.addStatement($$);
										$$ = block;
									}
	|	exprlist ';' expr_or_assign	{										
										((RBlock)$$).addStatement($3);
										$$.setEnd($3.sourceEnd());
									}
	|	exprlist ';'				{										
										$$ = $1;
									}
	|	exprlist '\n' expr_or_assign 
									{										
										((RBlock)$$).addStatement($3);
										$$.setEnd($3.sourceEnd());
									}
	|	exprlist '\n'				
									{									
										$$ = $1;
									}
	;

sublist	:	sub						
									{
										RArgumentList argumentList = new RArgumentList();
										if($1 != null){
											argumentList.setStart($1.sourceStart());
											argumentList.setEnd($1.sourceEnd());
											argumentList.addNode($1);
										}else{
											argumentList.setStart(@$.begin.getFirstColumn());
											argumentList.setEnd(@$.begin.getLastColumn());											
										}
										$$ = argumentList;									
										
									}
	|	sublist cr ',' sub			
									{
										if($4 != null){
											$$.setEnd($4.sourceEnd());
											((RArgumentList)$$).addNode($4);
										}
										((RArgumentList)$$).addNewCommaPosition(@3.begin.getFirstColumn());
									}
	;

sub	:								
									{
										$$ = null;
									}
	|	expr						
									{										
										$$ = $1; 
									}
	|	SYMBOL EQ_ASSIGN 			
									{
										ScannerToken token = (ScannerToken)$1;
										$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText()),null);		
									}
	|	SYMBOL EQ_ASSIGN expr		
									{
										ScannerToken token = (ScannerToken)$1;
										$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText()),$3);												 
									}
	|	STR_CONST EQ_ASSIGN 		
									{
										ScannerToken token = (ScannerToken)$1;
										StringLiteral literal = new StringLiteral(token.getOffset(),token.getOffset() +token.getLength(),token.getText());
										$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,literal,null);		
										
									}
	|	STR_CONST EQ_ASSIGN expr	
									{
										ScannerToken token = (ScannerToken)$1;
										StringLiteral literal = new StringLiteral(token.getOffset(),token.getOffset() +token.getLength(),token.getText());
										$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),literal,$3);		
									
									}
	|	NULL_CONST EQ_ASSIGN 		
									{
											ScannerToken token = (ScannerToken)$1;
											NilLiteral literal = new NilLiteral(token.getOffset(),token.getOffset() +token.getLength());
											$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),literal,null);
									}
	|	NULL_CONST EQ_ASSIGN expr	
									{
											ScannerToken token = (ScannerToken)$1;
											NilLiteral literal = new NilLiteral(token.getOffset(),token.getOffset() +token.getLength());
											$$ = new BinaryExpression(RExpressionConstansExtension.E_ASSIGN,@2.begin.getFirstColumn(),literal,$3);
									}
	;


formlist:									{													
												$$ = new RArgumentList(@$.begin.getFirstColumn(),@$.begin.getLastColumn());												
											}
	|	SYMBOL								
											{ 											
												$$ = new RArgumentList(@1.begin.getFirstColumn(),@1.begin.getLastColumn());
												ScannerToken token = (ScannerToken)$1;
												SimpleReference var = new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText());
												ASTNode arg = new RArgument(var,0);
												((RArgumentList)$$).addNode(arg);
											}
	|	SYMBOL EQ_ASSIGN expr				
											{												
												$$ = new RArgumentList(@1.begin.getFirstColumn(),@2.begin.getLastColumn());
												ScannerToken token = (ScannerToken)$1;
												SimpleReference var = new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText());												
												ASTNode arg = new RArgument(var,0,$3);
												((RArgumentList)$$).addNode(arg);												
											}
	|	formlist ',' SYMBOL					
											{
												ScannerToken token = (ScannerToken)$3;
												SimpleReference var = new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText());
												((RArgumentList)$$).addNode(new RArgument(var,0));
												((RArgumentList)$$).addNewCommaPosition(@2.begin.getFirstColumn());
												$$.setEnd(@3.begin.getLastColumn());
											}
	|	formlist ',' SYMBOL EQ_ASSIGN expr	
											{ 
												ScannerToken token = (ScannerToken)$3;
												SimpleReference var = new VariableReference(token.getOffset(),token.getOffset() +token.getLength() ,token.getText());	
												((RArgumentList)$$).addNode(new RArgument(var,0,$5));
												((RArgumentList)$$).addNewCommaPosition(@2.begin.getFirstColumn());
												$$.setEnd(@5.begin.getLastColumn());
											}
	;

		
cr	:					
			{
			RBisonParser.SKIP_NEW_LINE = true;
			}
	;
%%