/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;

/**
 * @author migue
 * 
 */
public class ErrorNode extends ASTNode {

	public ErrorNode() {
		super();
	}

	public ErrorNode(int start, int end) {
		super(start, end);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.ast.ASTNode#traverse(org.eclipse.dltk.ast.ASTVisitor)
	 */
	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		RCorePlugin.getDefault().getLog().log(
				new Status(IStatus.INFO, RCorePlugin.PLUGIN_ID,
						"Error node in ast is not traversed"));

	}

}
