/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.codeassist.completion;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.expressions.Expression;
import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.ast.statements.Block;
import org.eclipse.dltk.codeassist.IAssistParser;
import org.eclipse.dltk.codeassist.ScriptCompletionEngine;
import org.eclipse.dltk.compiler.env.ISourceModule;
import org.eclipse.dltk.core.CompletionProposal;
import org.eclipse.dltk.core.IField;
import org.eclipse.dltk.core.IMethod;
import org.eclipse.dltk.core.IType;
import org.eclipse.dltk.core.RuntimePerformanceMonitor;
import org.eclipse.dltk.core.SourceParserUtil;
import org.eclipse.dltk.core.RuntimePerformanceMonitor.PerformanceNode;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;
import com.blogspot.miguelinlas3.eclipse.r.completion.RCompletionActivator;
import com.blogspot.miguelinlas3.eclipse.r.completion.internal.ContextualCollectionReferences;
import com.blogspot.miguelinlas3.eclipse.r.completion.navigation.exception.ElementNotFoundInContext;
import com.blogspot.miguelinlas3.eclipse.r.launching.integration.RFunctionSignature;
import com.blogspot.miguelinlas3.eclipse.r.launching.integration.RIntegrationHandlerCached;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RExpressionConstansExtension;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.LoadLibraryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodCallExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RReference;

/**
 * @author migue
 * 
 */
public class RCompletionEngine extends ScriptCompletionEngine {

	// protected final RIntegrationHandler completionHandler = new
	// RIntegrationHandler();
	protected final RIntegrationHandlerCached completionHandler = RIntegrationHandlerCached
			.getInstance();

	public RCompletionEngine() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ScriptCompletionEngine#getEndOfEmptyToken()
	 */
	@Override
	protected int getEndOfEmptyToken() {
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ScriptCompletionEngine#processFieldName(org
	 * .eclipse.dltk.core.IField, java.lang.String)
	 */
	@Override
	protected String processFieldName(IField field, String token) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ScriptCompletionEngine#processMethodName(
	 * org.eclipse.dltk.core.IMethod, java.lang.String)
	 */
	@Override
	protected String processMethodName(IMethod method, String token) {
		return method.getElementName();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ScriptCompletionEngine#processTypeName(org
	 * .eclipse.dltk.core.IType, java.lang.String)
	 */
	@Override
	protected String processTypeName(IType method, String token) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.internal.codeassist.impl.Engine#getParser()
	 */
	@Override
	public IAssistParser getParser() {
		return null;
	}

	public void complete(final ISourceModule module, final int position,
			final int i) {

		final ModuleDeclaration root = SourceParserUtil.getModuleDeclaration(
				(org.eclipse.dltk.core.ISourceModule) module.getModelElement(),
				null);

		PerformanceNode p = RuntimePerformanceMonitor.begin();
		this.requestor.beginReporting();

		try {
			root.traverse(new ASTVisitor() {

				protected ContextualCollectionReferences<VariableReference> references = new ContextualCollectionReferences<VariableReference>();

				protected Map<String, LoadLibraryExpression> loadedLibraries = new HashMap<String, LoadLibraryExpression>();

				/**
				 * Search in system libraries a function starting with
				 * <code>pattern</code>
				 * 
				 * @param pattern
				 *            Start of searched function
				 * @return
				 */
				List<RFunctionSignature> completeOnFunctionLibraries(
						String pattern) {
					return completionHandler.matchingFunction(module, pattern);
				}

				@Override
				public boolean visit(final Expression s) throws Exception {
					if (s.sourceStart() <= position
							&& position <= s.sourceEnd()) {
						if (s instanceof VariableReference) {

							String referenceName = (s instanceof VariableReference) ? ((VariableReference) s)
									.getName()
									: ((RMethodCallExpression) s).getName();
							try {
								List<VariableReference> itemsFound = this.references
										.searchInContextStartWith(referenceName);

								startPosition = s.sourceStart();
								endPosition = s.sourceEnd();
								this.createProposals(itemsFound);
							} catch (ElementNotFoundInContext e) {
								RCorePlugin.getDefault().getLog().log(
										new Status(IStatus.INFO,
												RCorePlugin.PLUGIN_ID, e
														.getMessage()));
							}

							startPosition = s.sourceStart();
							endPosition = s.sourceEnd();
							List<RFunctionSignature> completeOnFunctionLibraries = completeOnFunctionLibraries(referenceName);
							this
									.createProposalsToSystemLibs(completeOnFunctionLibraries);
						}
					}
					if (s instanceof Block) {
						this.references.newContext();
					}

					if (s instanceof LoadLibraryExpression) {
						LoadLibraryExpression loadLib = (LoadLibraryExpression) s;
						this.loadedLibraries.put(loadLib.getLoadLibrary(),
								loadLib);
					}

					return super.visit(s);
				}

				private void createProposals(List<VariableReference> itemsFound) {

					for (VariableReference ref : itemsFound) {
						RReference reference = (RReference) ref;
						CompletionProposal proposal = createProposal(
								CompletionProposal.METHOD_REF, position);
						proposal.extraInfo = ((RReference) ref)
								.getFunctionArguments();
						proposal.setName(ref.getName().toCharArray());
						proposal.setCompletion(reference.getSignature()
								.toCharArray());
						proposal.setReplaceRange(startPosition - offset,
								endPosition + i - offset);
						proposal.setRelevance(1);
						requestor.accept(proposal);
					}

				}

				private void createProposalsToSystemLibs(
						List<RFunctionSignature> itemsFound) {
					for (RFunctionSignature func : itemsFound) {
						CompletionProposal proposal = createProposal(
								CompletionProposal.METHOD_REF, position);

						if (!loadedLibraries.containsKey(func.getLibrary())) {
							proposal.extraInfo = func.getLibrary();
						}
						proposal.setName(func.getName().toCharArray());
						proposal.setCompletion(func.toString().toCharArray());
						proposal.setReplaceRange(startPosition - offset,
								endPosition + i - offset);
						requestor.accept(proposal);
					}
				}

				@Override
				public boolean endvisit(Expression s) throws Exception {
					if (s instanceof BinaryExpression) {
						BinaryExpression be = (BinaryExpression) s;
						if (be.getKind() == RExpressionConstansExtension.E_LEFT_ASSIGN
								|| be.getKind() == RExpressionConstansExtension.E_RIGHT_ASSIGN
								|| be.getKind() == RExpressionConstansExtension.E_ASSIGN) {

							ASTNode varReference = ((RExpressionConstansExtension.E_LEFT_ASSIGN == be
									.getKind())
									|| (RExpressionConstansExtension.E_ASSIGN == be
											.getKind()) ? be.getLeft() : be
									.getRight());

							ASTNode holdedValue = ((RExpressionConstansExtension.E_LEFT_ASSIGN == be
									.getKind())
									|| (RExpressionConstansExtension.E_ASSIGN == be
											.getKind()) ? be.getRight() : be
									.getLeft());

							RReference reference = null;
							if (varReference instanceof VariableReference)
								reference = new RReference(
										(VariableReference) varReference, null);

							if (holdedValue instanceof MethodDeclaration) {
								reference
										.setMethodDeclaration((MethodDeclaration) holdedValue);
							}
							// add reference to current context
							if (reference != null)
								this.references.addElement(reference);

						}
					}

					if (s instanceof Block) {
						this.references.dropCurrentContext();
					}

					return super.endvisit(s);
				}
			});
		} catch (Exception e) {
			RCompletionActivator.getDefault().getLog().log(
					new Status(IStatus.ERROR, RCompletionActivator.PLUGIN_ID,
							"Error while do completion on source module "
									+ module.getFileName()));
		}

		this.requestor.endReporting();
	}
}
