/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.expressions.Expression;

/**
 * Clase base para las expressiones R
 * 
 * @author Administrador
 * 
 */
public abstract class AbstractRExpressions extends Expression {
	/**
	 * Operador
	 */
	protected int kind;

	@Override
	public int getKind() {
		return this.kind;
	}

	@Override
	public String getOperator() {
		switch (this.kind) {
		case RExpressionConstansExtension.E_SEMI_COLON:
			return ":"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_QUESTION:
			return "?"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_LEFT_ASSIGN:
			return "<-"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_RIGHT_ASSIGN:
			return "->"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_AND_SINGLE:
			return "&"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_OR_SINGLE:
			return "|"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_PACKAGE_OPERATOR:
			return "::"; //$NON-NLS-1$

		case RExpressionConstansExtension.E_PACKAGE_OPERATOR_HIDDEN:
			return ":::"; //$NON-NLS-1$			

		case RExpressionConstansExtension.E_SCRIPT_DOUBLE_OPERATOR:
			return "[[";

		case RExpressionConstansExtension.E_SCRIPT_SINGLE_OPERATOR:
			return "[[";
		}

		return super.getOperator();
	}
}
