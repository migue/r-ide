/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.expressions.Expression;
import org.eclipse.dltk.ast.statements.Statement;

/**
 * 
 * Clase base para todas las sentencias simples
 * 
 * @see Statement
 * @author Administrador
 * 
 */
public abstract class SimpleStatement extends Statement {

	/**
	 * Expression a la que hacen referencia todos los statements que heredar�n
	 * de esta clase.<br>
	 * Podr� ser nulo en algunos casos, como las sentencias de <code>NEXT</code>
	 * o <code>BREAK</code>
	 */
	Expression fExpression;

	/**
	 * Construye un nuevo <code>statement</code>
	 * 
	 * @param start
	 *            Posici�n de inicio
	 * @param end
	 *            Posici�n de fin
	 * @param expression
	 *            Expressi�n a la que hace referencia. Puede ser nulo
	 */
	public SimpleStatement(int start, int end, Expression expression) {
		super(start, end);
		this.fExpression = expression;

	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.fExpression != null) {
				this.fExpression.traverse(visitor);
			}
			visitor.endvisit(this);
		}
	}
}
