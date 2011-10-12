/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.dltk.ast.statements.Block;

/**
 * @author migue
 * 
 */
public class RBlock extends Block {

	protected int leftBracePos;

	protected int rightBracePos;

	public RBlock(int sourceStart, int sourceEnd) {
		super(sourceStart, sourceEnd);
	}

	public int getLeftBracePos() {
		return leftBracePos;
	}

	public void setLeftBracePos(int leftBracePos) {
		this.leftBracePos = leftBracePos;
	}

	public int getRightBracePos() {
		return rightBracePos;
	}

	public void setRightBracePos(int rightBracePos) {
		this.rightBracePos = rightBracePos;
	}

	public int getCount() {
		return getStatements().size();
	}

}
