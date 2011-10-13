/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.codeassist.completion.internal;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.parser.ISourceParser;
import org.eclipse.dltk.codeassist.IAssistParser;
import org.eclipse.dltk.compiler.env.ISourceModule;
import org.eclipse.dltk.core.DLTKLanguageManager;

import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author migue
 * 
 */
public abstract class RAssistParser implements IAssistParser {

	protected ISourceParser parser = null;

	protected ASTNode assistNodeParent = null;

	protected ModuleDeclaration module;

	public RAssistParser() {
		this.parser = DLTKLanguageManager.getSourceParser(RNature.R_NATURE_ID);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.codeassist.IAssistParser#getAssistNodeParent()
	 */
	public ASTNode getAssistNodeParent() {
		return this.assistNodeParent;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.codeassist.IAssistParser#getModule()
	 */
	public ModuleDeclaration getModule() {
		return this.module;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.IAssistParser#parse(org.eclipse.dltk.compiler
	 * .env.ISourceModule)
	 */
	public ModuleDeclaration parse(ISourceModule sourceModule) {
		ModuleDeclaration root = this.parser.parse(sourceModule.getFileName(),
				sourceModule.getContentsAsCharArray(), null);

		root.rebuild();

		return root;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.IAssistParser#setSource(org.eclipse.dltk.
	 * ast.declarations.ModuleDeclaration)
	 */
	public void setSource(ModuleDeclaration unit) {
		this.module = unit;

	}

}
