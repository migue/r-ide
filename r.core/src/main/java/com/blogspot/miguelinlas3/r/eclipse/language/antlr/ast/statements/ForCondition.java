/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.ast.statements.StatementConstants;

/**
 * 
 * Nodo del AST que representa la condicion en una sentencia <code>for</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class ForCondition extends Statement {

	/**
	 * Variable para recorrer todos los elementos de la colecci�n
	 */
	protected VariableReference symbol;

	/**
	 * Conjunto de elementos (expression) que recorrer� la sentencia
	 * <code>for</code>
	 */
	protected Statement collection;

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

	public VariableReference getSymbol() {
		return symbol;
	}

	public Statement getCollection() {
		return collection;
	}

	/**
	 * Instancia la nueva condicion<code>for</code>
	 * 
	 * @param symbol
	 *            Variable que recorre la colecci�n
	 * @param collection
	 *            Conjunto de elementos a recorrer
	 * @param actions
	 *            Conjunto de acciones a ejecutar para cada uno de los elementos
	 *            de la colecci�n
	 */
	public ForCondition(VariableReference symbol, Statement collection) {
		this.symbol = symbol;
		this.collection = collection;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.symbol != null) {
				this.symbol.traverse(visitor);
			}

			if (this.collection != null) {
				this.collection.traverse(visitor);
			}
			visitor.endvisit(this);
		}

	}

	@Override
	public int getKind() {
		return StatementConstants.S_FOREACH;
	}
}
