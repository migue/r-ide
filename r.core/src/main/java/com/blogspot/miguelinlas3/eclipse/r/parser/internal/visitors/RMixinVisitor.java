/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.expressions.Expression;
import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.core.ISourceModule;
import org.eclipse.dltk.core.mixin.IMixinRequestor;
import org.eclipse.dltk.internal.core.ModelElement;
import org.eclipse.dltk.internal.core.SourceMethod;

import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RExpressionConstansExtension;

/**
 * @author migue
 * 
 */
public class RMixinVisitor extends ASTVisitor {
	protected ISourceModule sourceModule;
	protected ModuleDeclaration moduleDeclaration;
	protected IMixinRequestor requestor;

	protected List<VariableReference> functionDeclarations = new ArrayList<VariableReference>();

	public RMixinVisitor(ISourceModule sourceModule,
			ModuleDeclaration moduleDeclaration, IMixinRequestor requestor) {
		super();
		this.sourceModule = sourceModule;
		this.moduleDeclaration = moduleDeclaration;
		this.requestor = requestor;
	}

	@Override
	public boolean visit(Expression s) throws Exception {

		if (s instanceof BinaryExpression
				&& (((BinaryExpression) s).getKind() == RExpressionConstansExtension.E_LEFT_ASSIGN || ((BinaryExpression) s)
						.getKind() == RExpressionConstansExtension.E_RIGHT_ASSIGN)) {
			BinaryExpression be = ((BinaryExpression) s);
			ASTNode method = (RExpressionConstansExtension.E_LEFT_ASSIGN == be
					.getKind() ? be.getRight() : be.getLeft());
			ASTNode varReference = (RExpressionConstansExtension.E_LEFT_ASSIGN == be
					.getKind() ? be.getLeft() : be.getRight());
			if (method instanceof MethodDeclaration
					&& varReference instanceof VariableReference) {

				this.functionDeclarations.add((VariableReference) varReference);
				IMixinRequestor.ElementInfo info = new IMixinRequestor.ElementInfo();

				String key = this.sourceModule.getElementName()
						+ IMixinRequestor.MIXIN_NAME_SEPARATOR;
				for (int i = 0; i < this.functionDeclarations.size() - 1; ++i) {
					key += this.functionDeclarations.get(i).getName()
							+ IMixinRequestor.MIXIN_NAME_SEPARATOR;
				}
				key += this.functionDeclarations.get(
						this.functionDeclarations.size() - 1).getName();
				info.key = key;
				SourceMethod mixinMethod = new SourceMethod(
						(ModelElement) this.sourceModule,
						((VariableReference) varReference).getName());
				info.object = mixinMethod;

				this.requestor.reportElement(info);
			}
		}
		return super.visit(s);
	}
}
