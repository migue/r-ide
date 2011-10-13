package com.blogspot.miguelinlas3.eclipse.r.completion.codeassist.completion;

import java.util.List;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;
import org.eclipse.dltk.ast.references.SimpleReference;
import org.eclipse.dltk.codeassist.complete.ICompletionOnKeyword;
import org.eclipse.dltk.utils.CorePrinter;

import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.RBlock;

public class CompletionOnKeywordArgumentOrFunctionArgument extends
		SimpleReference implements ICompletionOnKeyword {

	private List<String> possibleKeywords;
	private RBlock statement;
	private ASTNode completionNode;

	public CompletionOnKeywordArgumentOrFunctionArgument(String token,
			ASTNode completionNode, RBlock node,
			List<String> keywordspossibleKeywords) {
		super(completionNode.sourceStart(), completionNode.sourceEnd(), token);
		this.possibleKeywords = keywordspossibleKeywords;
		this.statement = node;
		this.completionNode = completionNode;
	}

	public CompletionOnKeywordArgumentOrFunctionArgument(String token,
			RBlock node, List<String> possibleKeywords, int position) {
		super(position, position, token);
		this.possibleKeywords = possibleKeywords;
		this.statement = node;
		this.completionNode = null;
	}

	public char[] getToken() {
		if (getName() != null) {
			return getName().toCharArray();
		}
		return "".toCharArray();
	}

//	public List<String> getPossibleKeywords() {
//		return this.possibleKeywords;
//	}

	public void printNode(CorePrinter output) {
	}

	public void traverse(ASTVisitor pVisitor) throws Exception {
	}

	public boolean canCompleteEmptyToken() {
		return true;
	}

	public RBlock getStatement() {
		return this.statement;
	}

//	public int argumentIndex() {
//		if (this.completionNode == null) {
//			if (this.statement.getCount() == 1) {
//				return 1;
//			}
//			if (statement.getCount() > 2
//					&& statement.getAt(0).sourceEnd() <= sourceStart()
//					&& sourceEnd() <= statement.getAt(1).sourceStart()) {
//				return 1;
//			}
//			return -1;
//		}
//		for (int i = 0; i < this.statement.getCount(); ++i) {
//			if (this.statement.getAt(i).equals(this.completionNode)) {
//				return i;
//			}
//		}
//		return -1;
//	}

	public ASTNode getCompletionNode() {
		return this.completionNode;
	}

	public String[] getPossibleKeywords() {
		// TODO Auto-generated method stub
		return null;
	}
}
