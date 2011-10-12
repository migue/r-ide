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
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RBlock;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodCallExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodDeclaration;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RepeatStatement;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.WhileStatement;

/**
 * Interfaz para aquellos visitor que deseen realizar operaciones de reescritura
 * del AST, como por ejemplo, las operaciones de formateo del código fuente
 * 
 * @author migue
 * 
 */
public interface IASTRewriter {
	/**
	 * Visita las expressiones binarias
	 * 
	 * @param be
	 *            Expresión binaria
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(BinaryExpression be);

	/**
	 * Visita las expressiones de acceso indexado
	 * 
	 * @param ie
	 *            Expresión de acceso mediante índice
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(IndexAccessBinaryExpression ie);

	/**
	 * Visita las expressiones binarias
	 * 
	 * @param ue
	 *            Expresión unaria
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(UnaryExpression ue);

	/**
	 * Visita una sentencia de asignación
	 * 
	 * @param statement
	 *            Sentencia de asignación
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(AssignementStatement statement);

	/**
	 * Visita una sentencia de <code>break</code>
	 * 
	 * @param breakStatement
	 *            Sentencia de <code>break</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(BreakStatement breakStatement);

	/**
	 * Visita una sentencia de <code>continue</code>
	 * 
	 * @param continueStatement
	 *            Sentencia de <code>continue</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(ContinueStatement continueStatement);

	/**
	 * Vista la condición de un bucle <code>for</code>
	 * 
	 * @param forCondition
	 *            Condición de un bucle <code>for</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(ForCondition forCondition);

	/**
	 * Visita una sentencia <code>for</code>
	 * 
	 * @param forStatement
	 *            Visita una sentencia <code>for</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(ForStatement forStatement);

	/**
	 * Visita una sentencia <code>if</code>
	 * 
	 * @param forStatement
	 *            Visita una sentencia <code>if</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(IfStatement ifStatement);

	/**
	 * Visita un argumento a una función
	 * 
	 * @param rArgument
	 *            Argumento a una función
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(RArgument rArgument);

	/**
	 * Visita una sentencia de <code>repeat</code>
	 * 
	 * @param repeatStatement
	 *            Sentencia de repeat
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(RepeatStatement repeatStatement);

	/**
	 * Visita una sentencia de <code>while</code>
	 * 
	 * @param whileStatement
	 *            Sentencia de <code>while</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(WhileStatement whileStatement);

	/**
	 * Visita una declaración de módulo <code>R</code>
	 * 
	 * @param module
	 *            Declaration de un módulo <code>R</code>
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(RModuleDeclaration moduleDeclaration);

	/**
	 * Visita la definición de una función
	 * 
	 * @param methodDeclaration
	 *            Definición de un método
	 * @return <code>true</code> si todo fue correctamente.<code>false</code> en
	 *         caso contrario
	 */
	boolean visit(MethodDeclaration methodDeclaration);

	/**
	 * Visita la definición de una función
	 * 
	 * @param methodDeclaration
	 * @return
	 */
	boolean visit(RMethodDeclaration methodDeclaration);

	/**
	 * 
	 * @param node
	 * @return
	 */
	boolean visit(ASTListNode node);

	/**
	 * 
	 * @param node
	 * @return
	 */
	boolean visit(ASTNode node);

	/**
	 * 
	 * @param callArgumentList
	 * @return
	 */
	boolean visit(CallArgumentsList callArgumentList);

	/**
	 * 
	 * @param methodCall
	 * @return
	 */
	public boolean visit(RMethodCallExpression methodCall);

	/**
	 * 
	 * @param libraryLoad
	 * @return
	 */
	public boolean visit(LoadLibraryExpression libraryLoad);

	/**
	 * 
	 * @param numeric
	 * @return
	 */
	boolean visit(FloatNumericLiteral numeric);

	/**
	 * 
	 * @param methodCall
	 * @return
	 */
	boolean visit(MethodCallExpression methodCall);

	/**
	 * 
	 * @param nullLiteral
	 * @return
	 */
	boolean visit(NilLiteral nullLiteral);

	/**
	 * 
	 * @param string
	 * @return
	 */
	boolean visit(StringLiteral string);

	/**
	 * 
	 * @param reference
	 * @return
	 */
	boolean visit(SimpleReference reference);

	/**
	 * 
	 * @param reference
	 * @return
	 */
	boolean visit(VariableReference reference);

	/**
	 * 
	 * @param block
	 * @return
	 */
	boolean visit(Block block);

	/**
	 * 
	 * @param block
	 * @return
	 */
	boolean visit(RBlock block);

	/**
	 * 
	 * @param statement
	 * @return
	 */
	boolean visit(Statement statement);

	/**
	 * 
	 * @param condition
	 * @return
	 */
	boolean visit(ParenthesisCondition condition);
}
