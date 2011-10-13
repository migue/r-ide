/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.navigation;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.eclipse.core.runtime.Assert;
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
import org.eclipse.dltk.codeassist.ScriptSelectionEngine;
import org.eclipse.dltk.compiler.env.ISourceModule;
import org.eclipse.dltk.core.IModelElement;
import org.eclipse.dltk.core.IModelElementVisitor;
import org.eclipse.dltk.core.ModelException;
import org.eclipse.dltk.core.SourceParserUtil;
import org.eclipse.dltk.core.mixin.IMixinElement;
import org.eclipse.dltk.core.mixin.MixinModel;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;
import com.blogspot.miguelinlas3.eclipse.r.completion.internal.ContextualCollectionReferences;
import com.blogspot.miguelinlas3.eclipse.r.completion.navigation.exception.ElementNotFoundInContext;
import com.blogspot.miguelinlas3.eclipse.r.core.internal.mixin.RMixinModel;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RExpressionConstansExtension;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RMethodCallExpression;

/**
 * @author migue
 * 
 */
public class RSelectionEngine extends ScriptSelectionEngine {

	private org.eclipse.dltk.core.ISourceModule sourceModule;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ISelectionEngine#select(org.eclipse.dltk.
	 * compiler.env.ISourceModule, int, int)
	 */
	public IModelElement[] select(final ISourceModule module, final int offset,
			final int i) {
		this.sourceModule = (org.eclipse.dltk.core.ISourceModule) module
				.getModelElement();

		final ModuleDeclaration moduleDeclaration = SourceParserUtil
				.getModuleDeclaration(sourceModule, null);

		final List results = new ArrayList();

		// this visitor search only for function definition
		try {

			// this visitor holds references to function definitions
			moduleDeclaration.traverse(new ASTVisitor() {
				protected ContextualCollectionReferences<VariableReference> contextualReferences = new ContextualCollectionReferences<VariableReference>();

				/**
				 * 
				 * @param name
				 *            function to search
				 * @param results
				 *            List with matching results
				 */
				protected void findMethodDeclaration(final String name,
						final List results) {
					Assert.isNotNull(results);

					// traverse all script model in order to find the method
					try {
						final VariableReference searchInContext = this.contextualReferences
								.searchInContext(name);

						sourceModule.accept(new IModelElementVisitor() {

							public boolean visit(IModelElement element) {

								if (element.getElementName().equals(
										searchInContext.getName())) {
									results.add(element);
								}
								return true;
							}
						});
					} catch (ModelException e) {
						RCorePlugin.getDefault().getLog().log(
								new Status(IStatus.ERROR,
										RCorePlugin.PLUGIN_ID, e.getMessage()));
					} catch (ElementNotFoundInContext e) {
						RCorePlugin.getDefault().getLog().log(
								new Status(IStatus.INFO, RCorePlugin.PLUGIN_ID,
										e.getMessage()));
						MixinModel findElements = RMixinModel.getInstance()
								.getMixin(sourceModule.getScriptProject());

						String search = module.getSourceContents().substring(
								offset, i + 1);

						IMixinElement[] find = findElements.find("*{" + search);
						// IMixinElement iMixinElement = findElements.get("");
						// filter elements in current file
						// TODO: revisar expresiones regulares en el find: algo
						// como
						// lo que sigue "*[^NombreArchivoActual]{NombreFunction
						// de este modo obtendremos directamente todas

						List<IMixinElement> filtered = new ArrayList<IMixinElement>();
						for (int i = 0; i < find.length; ++i) {
							if (!find[i].getKey().startsWith(
									sourceModule.getElementName())) {
								filtered.add(find[i]);
							}
						}
						for (IMixinElement element : filtered) {
							Object[] objects = element.getAllObjects();
							results.addAll(Arrays.asList(objects));
						}
					}
				}

				@Override
				public boolean endvisit(MethodDeclaration s) throws Exception {
					// this.contextualReferences.dropCurrentContext();
					return super.endvisit(s);
				}

				@Override
				public boolean endvisit(Expression s) throws Exception {
					if (s instanceof BinaryExpression) {
						BinaryExpression be = (BinaryExpression) s;
						if (be.getKind() == RExpressionConstansExtension.E_LEFT_ASSIGN
								|| be.getKind() == RExpressionConstansExtension.E_RIGHT_ASSIGN
								|| be.getKind() == RExpressionConstansExtension.E_ASSIGN) {

							ASTNode varReference = (RExpressionConstansExtension.E_LEFT_ASSIGN == be
									.getKind())
									|| (RExpressionConstansExtension.E_ASSIGN == be
											.getKind()) ? be.getLeft() : be
									.getRight();

							// add reference to current context (only variable
							// references)
							if (varReference instanceof VariableReference)
								this.contextualReferences
										.addElement((VariableReference) varReference);

						}
					}

					if (s instanceof Block) {
						this.contextualReferences.dropCurrentContext();
					}

					return super.endvisit(s);
				}

				@Override
				public boolean visit(Expression s) throws Exception {

					if (s.sourceStart() <= offset && offset <= s.sourceEnd()) {
						if (s instanceof RMethodCallExpression) {
							RMethodCallExpression methodCall = (RMethodCallExpression) s;
							findMethodDeclaration(methodCall.getName(), results);

						}
					}
					if (s instanceof Block) {
						this.contextualReferences.newContext();
					}

					return super.visit(s);
				}

				@Override
				public boolean visit(MethodDeclaration s) throws Exception {
					// this.contextualReferences.newContext();
					return super.visit(s);
				}
			});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return (IModelElement[]) results.toArray(new IModelElement[results
				.size()]);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.ISelectionEngine#setOptions(java.util.Map)
	 */
	public void setOptions(Map options) {
		// TODO Auto-generated method stub

	}

	@Override
	public IAssistParser getParser() {
		// TODO Auto-generated method stub
		return null;
	}

}
