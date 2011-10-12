/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.ast.statements.StatementConstants;

/**
 * 
 * Nodo del AST que representa a las sentencias <code>while</code>
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public class WhileStatement extends Statement {

	/**
	 * Condición del while
	 */
	protected ParenthesisCondition conditionStatement;

	/**
	 * Cuerpo del while
	 */
	protected Statement whileStatement;

	/**
	 * Construye un nuevo nodo del AST que representa al WHILE
	 * 
	 * @param conditionStatement
	 *            Condici�n de parada del while
	 * @param whileStatement
	 *            Cuerpo del while
	 * 
	 */
	public WhileStatement(ParenthesisCondition conditionStatement,
			Statement whileStatement) {
		this.conditionStatement = conditionStatement;
		this.whileStatement = whileStatement;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {

			if (this.conditionStatement != null) {
				this.conditionStatement.traverse(visitor);
			}

			if (this.whileStatement != null) {
				this.whileStatement.traverse(visitor);
			}

			visitor.endvisit(this);
		}
	}

	@Override
	public int getKind() {
		return StatementConstants.S_WHILE;
	}

	public String whileKeyword() {
		return "while";
	}

	public Statement getWhileStatement() {
		return whileStatement;
	}

	public ParenthesisCondition getConditionStatement() {
		return conditionStatement;
	}
	
	
	
	
}
