/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.internal.parser;

import java.io.IOException;

import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.parser.AbstractSourceParser;
import org.eclipse.dltk.compiler.problem.IProblemReporter;
import org.eclipse.jface.text.Document;

import com.blogspot.miguelinlas3.bison.BisonLexer;
import com.blogspot.miguelinlas3.bison.BufferedDocumentInput;
import com.blogspot.miguelinlas3.bison.FixInterningStringCache;
import com.blogspot.miguelinlas3.bison.RBisonParser;

/**
 * @author migue
 * 
 */
public class RSourceParser extends AbstractSourceParser {

	/**
	 * Manager para gestionar los problemas
	 */
	private IProblemReporter problemReporter;

	public RSourceParser() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.ast.parser.ISourceParser#parse(char[], char[],
	 * org.eclipse.dltk.compiler.problem.IProblemReporter)
	 */
	public ModuleDeclaration parse(char[] fileName, char[] source,
			IProblemReporter reporter) {
		this.problemReporter = reporter;

		BufferedDocumentInput input = new BufferedDocumentInput(new String(
				fileName));

		Document document = new Document(new String(source));
		input.setRange(document, 0, document.getLength());

		RBisonParser parser = new RBisonParser(new BisonLexer(input,
				new FixInterningStringCache(), this.problemReporter));
		parser.errorVerbose = true;

		try {
			if (parser.parse())
				return parser.getASTRoot();
		} catch (IOException e) {
			System.out.println("Error parsing file " + new String(fileName));
		}

		return parser.getASTRoot();

	}
}
