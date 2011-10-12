/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.ast.statements.StatementConstants;

/**
 * 
 * Nodo del AST que representa a las sentencias <code>if</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class IfStatement extends Statement {

	protected int elseKeywordStartPosition;

	public int getElseKeywordStartPosition() {
		return elseKeywordStartPosition;
	}

	public int getElseKeywordEndPosition() {
		return this.getElseKeywordStartPosition()
				+ this.getElseKeyword().length();
	}

	public void setElseKeywordStartPosition(int elseKeywordStartPosition) {
		this.elseKeywordStartPosition = elseKeywordStartPosition;
	}

	/**
	 * Condición del if
	 */
	protected ParenthesisCondition ifCondition;

	public ParenthesisCondition getIfCondition() {
		return ifCondition;
	}

	public Statement getThenStatement() {
		return thenStatement;
	}

	public Statement getElseStatement() {
		return elseStatement;
	}

	/**
	 * Parte <code>then</code> del <code>if</code>
	 */
	protected Statement thenStatement;

	/**
	 * Parte <code>else</code>(podr�a ser nula)
	 */
	protected Statement elseStatement;

	/**
	 * Construye una nueva sentencia if
	 * 
	 * @param ifStatement
	 *            Condici�n del if
	 * @param thenStatement
	 *            Cuerpo del if
	 * @param elseStatement
	 *            Parte else (tener cuidado puesto que puede ser nula)
	 */
	public IfStatement(ParenthesisCondition ifStatement,
			Statement thenStatement, Statement elseStatement) {
		this.ifCondition = ifStatement;
		this.thenStatement = thenStatement;
		this.elseStatement = elseStatement;

	}

	/**
	 * Establece la parte <code>else</code> de la sentencia if
	 * 
	 * @param elseStatement
	 *            Nueva parte else de la sentencia if
	 */
	public void setElseStatement(Statement elseStatement) {
		this.elseStatement = elseStatement;
	}

	@Override
	public int getKind() {
		return StatementConstants.S_IF;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.ifCondition != null) {
				this.ifCondition.traverse(visitor);
			}

			if (this.thenStatement != null) {
				this.thenStatement.traverse(visitor);
			}

			if (this.elseStatement != null) {
				this.elseStatement.traverse(visitor);
			}
			visitor.endvisit(this);
		}
	}

	public String getIfKeyword() {
		return "if";
	}

	public String getElseKeyword() {
		return "else";
	}
}
