package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.references.VariableReference;

public class RReference extends VariableReference {

	/**
	 * Reference to the method holded by this variable
	 */
	protected MethodDeclaration methodReference;

	public RReference(int start, int end, String name, MethodDeclaration method) {
		super(start, end, name);
		this.methodReference = method;
	}

	public RReference(VariableReference reference, MethodDeclaration method) {
		super(reference.sourceStart(), reference.sourceEnd(), reference
				.getName());
		this.methodReference = method;
	}

	public boolean isFunctionReference() {
		return this.methodReference != null;
	}

	public List<ASTNode> getFunctionArguments() {
		if (this.isFunctionReference())
			return this.methodReference.getArguments();
		return null;
	}

	public void setMethodDeclaration(MethodDeclaration method) {
		this.methodReference = method;
	}

	public String getSignature() {
		StringBuffer buffer = new StringBuffer();
		buffer.append(this.fName);
		if (this.isFunctionReference()) {
			buffer.append("(");
			List arguments = this.methodReference.getArguments();
			for (int i = 0; i < arguments.size() - 1; ++i) {
				buffer.append(((RArgument) arguments.get(i)).getStringFormat());
				buffer.append(",");
			}
			if (!arguments.isEmpty()) {
				buffer.append(((RArgument) arguments.get(arguments.size() - 1))
						.getName());
			}
			
			buffer.append(")");
		}

		return buffer.toString();
	}

}
