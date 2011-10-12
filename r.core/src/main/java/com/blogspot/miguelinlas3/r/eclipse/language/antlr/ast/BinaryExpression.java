/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

/**
 * Nodo que representa las expresiones binarias en nuestro AST.
 * 
 * @author Administrador
 * 
 */
public class BinaryExpression extends AbstractRExpressions implements
		RExpressionConstansExtension {

	/**
	 * Rama izquierda de la expresi�n
	 */
	ASTNode left;

	/**
	 * Rama derecha de la expresi�n
	 */
	ASTNode right;

	/**
	 * Posición del operador
	 */
	protected int operatorPosition;

	/**
	 * Construye un nuevo nodo expresi�n con las ramas y operaci�n indicadas
	 * 
	 * @param kind
	 *            Tipo de operaci�n que estamos representando
	 * @param left
	 *            Rama izquiera de la expresi�n
	 * @param right
	 *            Rama derecha de la expresi�n
	 */
	public BinaryExpression(int kind, ASTNode left, ASTNode right) {
		if (left != null) {
			this.setStart(left.sourceStart());
		}
		if (right != null) {
			this.setEnd(right.sourceEnd());
		}

		this.left = left;
		this.right = right;
		this.kind = kind;
	}

	/**
	 * Construye un nuevo nodo expresión con las ramas y operación indicadas
	 * 
	 * @param kind
	 *            Tipo de operación que estamos representando
	 * @param operatorPosition
	 *            Posición del operador
	 * @param left
	 *            Rama izquiera de la expresión
	 * @param right
	 *            Rama derecha de la expresión
	 */
	public BinaryExpression(int kind, int operatorPosition, ASTNode left,
			ASTNode right) {

		this.operatorPosition = operatorPosition;

		if (left != null) {
			this.setStart(left.sourceStart());
		}
		if (right != null) {
			this.setEnd(right.sourceEnd());
		}

		this.left = left;
		this.right = right;
		this.kind = kind;
	}

	/**
	 * Recupera la rama izquierda de la expresi�n
	 * 
	 * @return la rama izquierda de la expresi�n
	 */
	public ASTNode getLeft() {
		return this.left;
	}

	/**
	 * Recupera la rama derecha de la expresi�n
	 * 
	 * @return la rama derecha de la expresi�n
	 */
	public ASTNode getRight() {
		return this.right;
	}

	/**
	 * Recupera la posición del operador
	 * 
	 * @return Posición del operador
	 */
	public int getOperatorPosition() {
		return this.operatorPosition;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.left != null) {
				this.left.traverse(visitor);
			}

			if (this.right != null) {
				this.right.traverse(visitor);
			}
			visitor.endvisit(this);
		}

	}

	@Override
	public String toString() {
		StringBuffer result = new StringBuffer();
		if (this.left != null) {
			result.append(this.left.toString());
		}

		result.append(getOperator());

		if (this.right != null) {
			result.append(this.right.toString());
		}
		return result.toString();
	}

}
