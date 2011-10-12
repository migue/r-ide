/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.statements.Statement;

/**
 * 
 * Nodo del AST que representa la condicion en una sentencia <code>for</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class ParenthesisCondition extends Statement {

	/**
	 * Conjunto de elementos (expression) que recorrer� la sentencia
	 * <code>for</code>
	 */
	protected Statement expression;

	protected int leftParenthesisPos;

	protected int rightParenthesisPos;
	
	public int getLeftParenthesisPos() {
		return leftParenthesisPos;
	}

	public int getRightParentPos() {
		return rightParenthesisPos;
	}

	public void setLeftParenthesisPos(int leftParenthesisPos) {
		this.leftParenthesisPos = leftParenthesisPos;
	}

	public void setRightParenthesisPos(int rightParentPos) {
		this.rightParenthesisPos = rightParentPos;
	}

	public Statement getExpression() {
		return expression;
	}

	public void setExpression(Statement expression) {
		this.expression = expression;
	}

	/**
	 * Instancia una nueva condición entre paréntesis
	 * 
	 * @param expression
	 */
	public ParenthesisCondition(Statement expression) {
		this.expression = expression;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.expression != null) {
				this.expression.traverse(visitor);
			}
			visitor.endvisit(this);
		}

	}

	@Override
	public int getKind() {
		return 0;
	}
}
