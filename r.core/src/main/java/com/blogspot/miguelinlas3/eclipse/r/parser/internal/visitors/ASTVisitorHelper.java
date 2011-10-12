/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors;

import org.eclipse.dltk.ast.ASTListNode;
import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.expressions.CallArgumentsList;
import org.eclipse.dltk.ast.expressions.FloatNumericLiteral;
import org.eclipse.dltk.ast.expressions.MethodCallExpression;
import org.eclipse.dltk.ast.expressions.NilLiteral;
import org.eclipse.dltk.ast.expressions.StringLiteral;
import org.eclipse.dltk.ast.references.SimpleReference;
import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.ast.statements.Block;
import org.eclipse.dltk.ast.statements.Statement;

import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.IndexAccessBinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RModuleDeclaration;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.UnaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.AssignementStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.BreakStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.ContinueStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.ForCondition;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.ForStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.IfStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.LoadLibraryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.ParenthesisCondition;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RArgument;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RArgumentList;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RBlock;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodCallExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodDeclaration;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RepeatStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.WhileStatement;

/**
 * <code>Dispatcher</code> para realizar llamadas a métodos de visitor en
 * función del tipo de los argumentos
 * 
 * @author migue
 * 
 */
public final class ASTVisitorHelper {

	public static boolean visit(ASTNode node, IASTRewriter visitor) {
		Class<? extends ASTNode> clazz = node.getClass();

		if (clazz.equals(ASTNode.class))
			return visitor.visit((ASTNode) node);
		else if (clazz.equals(ASTListNode.class))
			return visitor.visit((ASTListNode) node);
		else if (clazz.equals(CallArgumentsList.class))
			return visitor.visit((CallArgumentsList) node);
		else if (clazz.equals(RArgumentList.class))
			return visitor.visit((RArgumentList) node);
		else if (clazz.equals(FloatNumericLiteral.class))
			return visitor.visit((FloatNumericLiteral) node);
		else if (clazz.equals(MethodCallExpression.class))
			return visitor.visit((MethodCallExpression) node);
		else if (clazz.equals(RMethodCallExpression.class))
			return visitor.visit((RMethodCallExpression) node);
		else if (clazz.equals(LoadLibraryExpression.class))
			return visitor.visit((LoadLibraryExpression) node);
		else if (clazz.equals(NilLiteral.class))
			return visitor.visit((NilLiteral) node);
		else if (clazz.equals(StringLiteral.class))
			return visitor.visit((StringLiteral) node);
		else if (clazz.equals(SimpleReference.class))
			return visitor.visit((SimpleReference) node);
		else if (clazz.equals(VariableReference.class))
			return visitor.visit((VariableReference) node);
		else if (clazz.equals(Block.class))
			return visitor.visit((Block) node);
		else if (clazz.equals(RBlock.class))
			return visitor.visit((RBlock) node);
		else if (clazz.equals(Statement.class))
			return visitor.visit((Statement) node);
		else if (clazz.equals(BinaryExpression.class))
			return visitor.visit((BinaryExpression) node);
		else if (clazz.equals(IndexAccessBinaryExpression.class))
			return visitor.visit((IndexAccessBinaryExpression) node);
		else if (clazz.equals(UnaryExpression.class))
			return visitor.visit((UnaryExpression) node);
		else if (clazz.equals(AssignementStatement.class))
			return visitor.visit((AssignementStatement) node);
		else if (clazz.equals(BreakStatement.class))
			return visitor.visit((BreakStatement) node);
		else if (clazz.equals(ContinueStatement.class))
			return visitor.visit((ContinueStatement) node);
		else if (clazz.equals(ForCondition.class))
			return visitor.visit((ForCondition) node);
		else if (clazz.equals(ForStatement.class))
			return visitor.visit((ForStatement) node);
		else if (clazz.equals(IfStatement.class))
			return visitor.visit((IfStatement) node);
		else if (clazz.equals(RArgument.class))
			return visitor.visit((RArgument) node);
		else if (clazz.equals(ParenthesisCondition.class))
			return visitor.visit((ParenthesisCondition) node);
		else if (clazz.equals(RepeatStatement.class))
			return visitor.visit((RepeatStatement) node);
		else if (clazz.equals(WhileStatement.class))
			return visitor.visit((WhileStatement) node);
		else if (clazz.equals(MethodDeclaration.class))
			return visitor.visit((MethodDeclaration) node);
		else if (clazz.equals(RMethodDeclaration.class))
			return visitor.visit((RMethodDeclaration) node);
		else if (clazz.equals(RModuleDeclaration.class))
			return visitor.visit((RModuleDeclaration) node);
		else {
			return true;
		}
	}
}
