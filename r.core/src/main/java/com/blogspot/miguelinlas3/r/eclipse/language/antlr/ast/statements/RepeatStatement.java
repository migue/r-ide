/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.ast.statements.StatementConstants;

/**
 * 
 * Nodo del AST que representa a las sentencias <code>repeat</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class RepeatStatement extends Statement {

	/**
	 * Cuerpo del <code>repeat</code>
	 */
	protected Statement repeatAction;

	/**
	 * Construye un nuevo nodo del AST que representa la sentencia
	 * <code>REPEAT</code>
	 * 
	 * @param repeatAction
	 *            Cuerpo de la sentencia
	 */
	public RepeatStatement(Statement repeatAction) {
		this.repeatAction = repeatAction;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			this.repeatAction.traverse(visitor);

			visitor.endvisit(this);
		}
	}

	@Override
	public int getKind() {
		return StatementConstants.S_WHILE;
	}
}
