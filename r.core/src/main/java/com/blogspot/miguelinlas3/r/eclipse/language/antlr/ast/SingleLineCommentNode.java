/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

/**
 * @author migue
 * 
 */
public class SingleLineCommentNode extends CommentNode {

	public SingleLineCommentNode(String text) {
		super(text);
	}

	public boolean isMultiLine() {
		return false;
	}
}
