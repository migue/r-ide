/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.search.core;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.core.search.matching.MatchLocator;
import org.eclipse.dltk.core.search.matching.MatchLocatorParser;
import org.eclipse.dltk.core.search.matching.PatternLocator;

/**
 * @author Administrador
 * 
 */
public class RMatchLocationParser extends MatchLocatorParser {

	public RMatchLocationParser(MatchLocator locator) {
		super(locator);
	}

	@Override
	public MethodDeclaration processMethod(MethodDeclaration m) {
		return super.processMethod(m);
	}

	@Override
	protected void processStatement(ASTNode node, PatternLocator locator) {
		super.processStatement(node, locator);
	}
}
