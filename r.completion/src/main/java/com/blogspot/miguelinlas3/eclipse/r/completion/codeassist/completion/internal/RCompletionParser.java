/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.codeassist.completion.internal;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.references.SimpleReference;
import org.eclipse.dltk.codeassist.complete.CompletionNodeFound;

import com.blogspot.miguelinlas3.r.eclipse.core.RKeywordsManager;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RModuleDeclaration;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RBlock;

/**
 * @author migue
 * 
 */
public class RCompletionParser extends RAssistParser {

	protected int position;

	/**
	 * Raiz del script R que ha sido parseado
	 */
	protected RModuleDeclaration script;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.IAssistParser#handleNotInElement(org.eclipse
	 * .dltk.ast.ASTNode, int)
	 */
	public void handleNotInElement(ASTNode unit, int position) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.codeassist.IAssistParser#parseBlockStatements(org.eclipse
	 * .dltk.ast.ASTNode, org.eclipse.dltk.ast.ASTNode, int)
	 */
	public void parseBlockStatements(ASTNode node, ASTNode unit, int position) {

		if (node instanceof RBlock) {
			RBlock statement = (RBlock) node;
			List statements = statement.getStatements();
			int len = statements.size();
			boolean first = false;
			String completionToken = null;
			ASTNode completionNode = null;
			for (int i = 0; i < len; ++i) {
				ASTNode n = (ASTNode) statements.get(i);
				if (n.sourceStart() <= position && n.sourceEnd() >= position) {
					if (i == 0) {
						first = true;
					}
					completionNode = n;
				}
			}
			if (completionNode == null) {
				if (len > 0) {
					List<String> keywords = checkKeywords(completionToken);
//					ASTNode nde = new CompletionOnKeywordArgumentOrFunctionArgument(
//							"", (TclStatement) node, keywords, position);
//					this.assistNodeParent = inNode;
					//throw new CompletionNodeFound(nde, null/*
//															 * ((TypeDeclaration)
//															 * inNode).scope
//															 */);
				}

			} else if (completionNode instanceof SimpleReference) {
				int maxLen = position - completionNode.sourceStart();
				completionToken = ((SimpleReference) completionNode).getName();

				if (completionToken.length() > maxLen && maxLen > 0) {
					completionToken = completionToken.substring(0, maxLen);
				}
			}
		} else if (node instanceof MethodDeclaration) {
			MethodDeclaration method = (MethodDeclaration) node;
			List statements = method.getStatements();
			boolean inStatement = false;
			if (statements != null) {
				int length = statements.size();
				for (int i = 0; i < length; ++i) {
					ASTNode nde = (ASTNode) statements.get(i);
					if (nde.sourceStart() <= position
							&& nde.sourceEnd() >= position) {
						inStatement = true;
						parseBlockStatements(nde, method, position);
					}
				}
			}
			if (!inStatement) {
				this.handleNotInElement(method, position);
			}
		}
	}

	public List<String> checkKeywords(String completionToken) {
		List<String> keywords = RKeywordsManager.getKeywords();
		// TODO:manejamos todas las palabras reservadas, sin restricción de zona
		// en la que se esté completando
		List<String> result = new ArrayList<String>();
		for (String k : keywords) {
			if (k.startsWith(completionToken))
				result.add(k);
		}
		return result;
	}

	class CompletionVisitor extends ASTVisitor {
		@Override
		public boolean visit(ASTNode s) throws Exception {
			return super.visit(s);
		}
	}

}
