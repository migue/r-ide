/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

/**
 * 
 * 
 * @author migue
 * 
 */
public class IndexAccessBinaryExpression extends AbstractRExpressions implements
		RExpressionConstansExtension {

	ASTNode invoke;

	ASTNode arguments;

	int leftIndexPosition;

	int rightIndexPosition;

	public ASTNode getInvoke() {
		return invoke;
	}

	public void setInvoke(ASTNode invoke) {
		this.invoke = invoke;
	}

	public ASTNode getArguments() {
		return arguments;
	}

	public void setArguments(ASTNode arguments) {
		this.arguments = arguments;
	}

	public int getLeftIndexPosition() {
		return leftIndexPosition;
	}

	public void setLeftIndexPosition(int leftIndexPosition) {
		this.leftIndexPosition = leftIndexPosition;
	}

	public int getRightIndexPosition() {
		return rightIndexPosition;
	}

	public void setRightIndexPosition(int rightIndexPosition) {
		this.rightIndexPosition = rightIndexPosition;
	}

	public IndexAccessBinaryExpression(int kind, ASTNode object,
			ASTNode arguments) {
		this(kind, object, arguments, 0, 0);
	}

	public IndexAccessBinaryExpression(int kind, ASTNode object,
			ASTNode arguments, int leftIndexPos, int rightIndexPos) {
		if (object != null) {
			this.setStart(object.sourceStart());
		}
		if (arguments != null) {
			this.setEnd(arguments.sourceEnd());
		}

		this.invoke = object;
		this.arguments = arguments;
		this.kind = kind;
		this.leftIndexPosition = leftIndexPos;
		this.rightIndexPosition = rightIndexPos;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		if (visitor.visit(this)) {
			if (this.invoke != null) {
				this.invoke.traverse(visitor);
			}

			if (this.arguments != null) {
				this.arguments.traverse(visitor);
			}
			visitor.endvisit(this);
		}

	}

}
