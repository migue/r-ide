/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.expressions.CallArgumentsList;
import org.eclipse.dltk.ast.expressions.CallExpression;

/**
 * @author migue
 * 
 */
public class RMethodCallExpression extends CallExpression {

	public RMethodCallExpression(ASTNode receiver, String name,
			CallArgumentsList args) {
		super(receiver, name, args);
	}

	public RMethodCallExpression(int start, int end, ASTNode receiver,
			String name, RArgumentList args) {
		super(start, end, receiver, name, args);
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

	public List<Integer> getCommas() {
		RArgumentList arguments = (RArgumentList) this.getArgs();
		return arguments.getCommaPositions();
	}

	public List<ASTNode> getArguments() {
		return this.getArgs().getChilds();
	}

}
