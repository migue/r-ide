package com.blogspot.miguelinlas3;

import java.io.IOException;

import junit.framework.TestCase;

import org.eclipse.jface.text.Document;
import org.eclipse.jface.text.IDocument;

import com.blogspot.miguelinlas3.bison.BisonLexer;
import com.blogspot.miguelinlas3.bison.BufferedDocumentInput;
import com.blogspot.miguelinlas3.bison.RBisonParser;

public class RScannerTest extends TestCase {

	protected BisonLexer lexer;

	@Override
	protected void setUp() throws Exception {
		// BufferedDocumentInput input = new BufferedDocumentInput();
		BufferedDocumentInput fileInput = new BufferedDocumentInput();

		// input.init();
		IDocument document = new Document("a<-b<-c<-1;"); //$NON-NLS-1$
		fileInput.setRange(document, 0, document.getLength());

	}

	public void testScanner() {
		RBisonParser parser = new RBisonParser(this.lexer);

		try {
			boolean parse = parser.parse();
			assertTrue(parse);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
