/**
 * com.blogspot.miguelinlas3.r.eclipse.core es uno de los modulos que compone el producto R-eclipse; desarrollado por Miguel Pastor
 * http://miguelinlas3.blogspot.com
 * miguelinlas3 at gmail.com
 */
package com.blogspot.miguelinlas3.r.eclipse.core.compiler.antlr.internal.ast;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import junit.framework.TestCase;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.jface.text.Document;

import com.blogspot.miguelinlas3.bison.BisonLexer;
import com.blogspot.miguelinlas3.bison.BufferedDocumentInput;
import com.blogspot.miguelinlas3.bison.FixInterningStringCache;
import com.blogspot.miguelinlas3.bison.IStringCache;
import com.blogspot.miguelinlas3.bison.RBisonParser;
import com.blogspot.miguelinlas3.bison.SourceParseInput;

/**
 * Clase base para todas aquellas suite de pruebas unitarias que deseen validar
 * el correcto funcionamiento de la gram�tica R definida en el proyecto
 * R-project.
 * 
 * El cojunto de pruebas que deriven de esta clase validar�n la contrucci�n de
 * un AST basado en DLTK.
 * 
 * @see ASTNode
 * 
 * @author Administrador
 * 
 */
public abstract class AbstractRGrammarASTNodesTest extends TestCase {

	/**
	 * Nodo ra�z del AST
	 */
	protected ModuleDeclaration moduleDeclaration;

	/**
	 * Parser R
	 */
	protected RBisonParser parser;

	/**
	 * R Lexer
	 */
	protected BisonLexer lexer;

	protected void configureParser(String fileInputPath) {
		IStringCache cache = new FixInterningStringCache();
		try {
			this.lexer = new BisonLexer(this.buildInputStream(fileInputPath),
					cache);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.parser = new RBisonParser(this.lexer);
	}

	private String readFileAsString(String filePath) throws java.io.IOException {
		StringBuffer fileData = new StringBuffer(10000);
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		char[] buf = new char[1024];
		int numRead = 0;
		while ((numRead = reader.read(buf)) != -1) {
			fileData.append(buf, 0, numRead);
		}
		reader.close();
		return fileData.toString();
	}

	/**
	 * Construye un {@link SourceParseInput} a partir de la ruta de un fichero
	 * 
	 * @param path
	 *            Ruta del fichero con el c�digo fuente a parsear
	 * @return Document
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	protected SourceParseInput buildInputStream(String path)
			throws FileNotFoundException, IOException {
		String text = this.readFileAsString(path);
		Document document = new Document(text);
		BufferedDocumentInput input = new BufferedDocumentInput();
		input.setRange(document, 0, document.getLength());

		return input;
	}

	/**
	 * Funci�n de utilidad que procesa el archivo de entrada y construye el AST
	 * correspondiente
	 * 
	 * @param source
	 *            Archivo de c�digo fuente
	 * @return <code>true</code> si se ha parseado el archivo correctamente,
	 *         <code>false</code> en caso contrario
	 * @throws Exception
	 */
	protected boolean configureAndParse(String source) throws Exception {

		this.configureParser(source);

		this.parser.errorVerbose = true;
		this.parser.setDebugLevel(1);

		// parse the file
		boolean state = this.parser.parse();

		this.moduleDeclaration = this.parser.getASTRoot();

		return state;
	}
}
