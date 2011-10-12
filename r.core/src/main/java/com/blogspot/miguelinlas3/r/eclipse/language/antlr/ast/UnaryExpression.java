/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

/**
 * Nodo que representa las expresiones unarias en nuestro AST.
 * 
 * @author Administrador
 * 
 */
public class UnaryExpression extends AbstractRExpressions implements
		RExpressionConstansExtension {

	/**
	 * Expression
	 */
	protected ASTNode expression;

	/**
	 * Posición del operador
	 */
	protected int operatorPosition;

	/**
	 * Recupera la posición del operador
	 * 
	 * @return Posición del operador
	 */
	public int getOperatorPosition() {
		return this.operatorPosition;
	}

	public ASTNode getExpression() {
		return expression;
	}

	/**
	 * Construye un nuevo nodo expresi�n con las ramas y operaci�n indicadas
	 * 
	 * @param kind
	 *            Tipo de operaci�n que estamos representando
	 * @param expression
	 *            Expression
	 * 
	 */
	public UnaryExpression(int kind, ASTNode expression) {

		if (expression != null) {
			this.setStart(expression.sourceStart());
			this.setEnd(expression.sourceEnd());
		}

		this.expression = expression;
		this.kind = kind;
	}

	public UnaryExpression(int kind, int operatorPosition, ASTNode expression) {

		this.operatorPosition = operatorPosition;
		if (expression != null) {
			this.setStart(expression.sourceStart());
			this.setEnd(expression.sourceEnd());
		}

		this.expression = expression;
		this.kind = kind;
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

}
