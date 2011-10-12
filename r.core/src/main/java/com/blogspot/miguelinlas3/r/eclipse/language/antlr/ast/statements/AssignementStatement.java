/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.expressions.Expression;
import org.eclipse.dltk.ast.expressions.ExpressionConstants;
import org.eclipse.dltk.ast.references.VariableReference;

/**
 * Las asignaciones tienen un nodo propio en el AST, aunque realmente sean casi
 * identicas a las expresiones binarias
 * 
 * @author Administrador
 * 
 */
public class AssignementStatement extends Expression {

	/**
	 * Parte izquierda de la asignacion (tendra que ser un simbolo)
	 */
	VariableReference symbol;

	/**
	 * Valor de la expression
	 */
	ASTNode value;

	/**
	 * Clase del operador
	 */
	protected int kind;

	@Override
	public int getKind() {
		return this.kind;
	}

	/**
	 * Construye un nuevo nodo expresión con las ramas y operación indicadas
	 * 
	 * @param left
	 *            Parte izquierda de la asignacion
	 * @param right
	 *            Parte derecha de la asignacion
	 */
	public AssignementStatement(VariableReference symbol, ASTNode value) {
		if (symbol != null) {
			this.setStart(symbol.sourceStart());
		}
		if (value != null) {
			this.setEnd(value.sourceEnd());
		}

		this.symbol = symbol;
		this.value = value;
		this.kind = ExpressionConstants.E_ASSIGN;
	}

	/**
	 * Recupera parte izquierda de la asignacion
	 * 
	 * @return la rama izquierda de la expresión
	 */
	public VariableReference getLeftSide() {
		return this.symbol;
	}

	/**
	 * Recupera el valor de la asignacion
	 * 
	 * @return la rama derecha de la expresión
	 */
	public ASTNode getAssignValue() {
		return this.value;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.symbol != null) {
				this.symbol.traverse(visitor);
			}

			if (this.value != null) {
				this.value.traverse(visitor);
			}
			visitor.endvisit(this);
		}

	}

}
