/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

/**
 * @author migue
 * 
 */
public abstract class CommentNode extends ASTNode {

	private String text;

	public CommentNode() {
	}

	public CommentNode(String text) {
		this.text = text;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public abstract boolean isMultiLine();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.ast.ASTNode#traverse(org.eclipse.dltk.ast.ASTVisitor)
	 */
	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			visitor.endvisit(this);
		}

	}

}
