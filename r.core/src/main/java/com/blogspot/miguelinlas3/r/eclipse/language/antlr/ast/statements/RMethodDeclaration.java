/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import java.util.List;

import org.eclipse.dltk.ast.declarations.MethodDeclaration;

/**
 * @author migue
 * 
 */
public class RMethodDeclaration extends MethodDeclaration {

	public RMethodDeclaration(String name, int nameStart, int nameEnd,
			int declStart, int declEnd) {
		super(name, nameStart, nameEnd, declStart, declEnd);
	}

	protected RArgumentList argumentsList;

	public RArgumentList getArgumentsList() {
		return argumentsList;
	}

	public void setArgumentsList(RArgumentList argumentsList) {
		this.argumentsList = argumentsList;
	}

	protected int leftParentPos, rightParentPos;

	public int getLeftParentPos() {
		return leftParentPos;
	}

	public void setLeftParentPos(int leftParentPos) {
		this.leftParentPos = leftParentPos;
	}

	public int getRightParentPos() {
		return rightParentPos;
	}

	public void setRightParentPos(int rightParentPos) {
		this.rightParentPos = rightParentPos;
	}

	/**
	 * XXX Refactorizar esto
	 * 
	 * Artefacto para evitar un pequeño problema de tipos con el AST de DLTK
	 * 
	 * @return
	 */
	public RBlock getRBody() {
		List statements = this.getBody().getStatements();
		if (statements.size() == 1) {
			return (RBlock) statements.get(0);
		}

		throw new NoSuchFieldError();
	}
}
