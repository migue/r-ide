/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import org.eclipse.core.runtime.Assert;
import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.expressions.CallArgumentsList;
import org.eclipse.dltk.ast.expressions.StringLiteral;

/**
 * Clase de marcado para representar en el AST los imports
 * 
 * @author migue
 * 
 */
public class LoadLibraryExpression extends RMethodCallExpression {

	public LoadLibraryExpression(ASTNode receiver, String name,
			CallArgumentsList args) {
		super(receiver, name, args);
	}

	public LoadLibraryExpression(CallArgumentsList args) {
		super(null, "library", args);
	}

	public LoadLibraryExpression(int start, int end, RArgumentList args) {
		super(start, end, null, "library", args);
	}

	public String getLoadLibrary() {
		Assert.isTrue(getArguments().size() == 1);
		StringLiteral arg = (StringLiteral) getArguments().get(0);
		return arg.getValue();
	}

	public int librarySourceEnd() {
		return this.sourceStart() + "library".length() -1;
	}

}
