/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.expressions.ExpressionConstants;

/**
 * Extensiones del lenguaje R a las constantes proporcionadas por
 * <code>DLTK</code>
 * 
 * @author Administrador
 * 
 */
public interface RExpressionConstansExtension extends ExpressionConstants {

	static public final int E_SEMI_COLON = 1080;

	static public final int E_QUESTION = 1081;

	static public final int E_LEFT_ASSIGN = 1082;

	static public final int E_RIGHT_ASSIGN = 1083;

	static public final int E_AND_SINGLE = 1084;

	static public final int E_OR_SINGLE = 1085;

	static public final int E_PACKAGE_OPERATOR = 1086;

	static public final int E_PACKAGE_OPERATOR_HIDDEN = 1087;

	static public final int E_SCRIPT_SINGLE_OPERATOR = 1088;
	
	static public final int E_SCRIPT_DOUBLE_OPERATOR = 1089;
}
