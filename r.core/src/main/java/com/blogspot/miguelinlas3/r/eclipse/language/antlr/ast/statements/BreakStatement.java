/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;


/**
 * Representa la sentencia <code>BREAK</code>
 * 
 * @author Administrador
 * 
 */
public class BreakStatement extends SimpleStatement {

	/**
	 * Contructor de la sentencia
	 * 
	 * @param start
	 *            Posición de inicio
	 * @param end
	 *            Posición de fin
	 * 
	 */
	public BreakStatement(int start, int end) {
		super(start, end, null);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.ast.statements.Statement#getKind()
	 */
	@Override
	public int getKind() {
		return S_BREAK;
	}

}
