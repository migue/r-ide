/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.Argument;
import org.eclipse.dltk.ast.references.SimpleReference;

/**
 * 
 * Nodo del AST que representa los argumentos de definici�n de una funci�n
 * 
 * @see Argument
 * @author Administrador
 * 
 */
public class RArgument extends Argument {

	public RArgument(SimpleReference name, int start) {
		super(name, start, null, 0);
	}

	public RArgument(SimpleReference name, int start, ASTNode init) {
		super(name, start, init, 0);
	}

	public RArgument(SimpleReference name, int start, int end, ASTNode init) {
		super(name, start, end, init, 0);
	}

	/**
	 * Establece el valor de este argumento
	 * 
	 * @param initialization
	 *            Valor por defecto del argumento
	 */
	public void assign(ASTNode initialization) {
		this.setInitializationExpression(initialization);
	}

	public String getStringFormat() {
		StringBuffer result = new StringBuffer();
		result.append(this.getName());
		if (super.initialization != null) {
			result.append("=");
			result.append(super.initialization.toString());
		}
		return result.toString();
	}
}
