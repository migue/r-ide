/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.ast.statements.StatementConstants;

/**
 * 
 * Nodo del AST que representa a las sentencias <code>for</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class ForStatement extends Statement {

	/**
	 * condicion del for
	 */
	protected ForCondition condition;

	/**
	 * Conjunto de accciones de la sentencia <code>for</code>
	 */
	protected Statement actions;

	/**
	 * Instancia una nueva sentencia <code>for</code>
	 * 
	 * @param condition
	 *            Condicion del for
	 * @param actions
	 *            Conjunto de acciones a ejecutar para cada uno de los elementos
	 *            de la colecci�n
	 */
	public ForStatement(ForCondition condition, Statement actions) {
		this.condition = condition;
		this.actions = actions;
	}

	public ForCondition getCondition() {
		return condition;
	}

	public Statement getActions() {
		return actions;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.condition != null) {
				this.condition.traverse(visitor);
			}

			if (this.actions != null) {
				this.actions.traverse(visitor);
			}
		}
	}

	@Override
	public int getKind() {
		return StatementConstants.S_FOR;
	}
}
