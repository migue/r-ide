/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast;

import java.util.Iterator;
import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;

import com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors.ASTVisitorHelper;
import com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors.IASTRewriter;

/**
 * Nodo raiz del AST que representa un script R
 * 
 * @author Administrador
 * 
 */
public class RModuleDeclaration extends ModuleDeclaration {

	public RModuleDeclaration(int sourceLength) {
		super(sourceLength);
	}

	public RModuleDeclaration(int length, boolean rebuild) {
		super(length, rebuild);
	}

	public boolean visitAll(IASTRewriter visitor) throws Exception {
		List statements = this.getStatements();
		for (Iterator iterator = statements.iterator(); iterator.hasNext();) {
			ASTNode node = (ASTNode) iterator.next();
			ASTVisitorHelper.visit(node, visitor);
		}

		return true;
	}
}