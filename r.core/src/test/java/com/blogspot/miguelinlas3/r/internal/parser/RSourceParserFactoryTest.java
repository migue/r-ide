package com.blogspot.miguelinlas3.r.internal.parser;

import junit.framework.TestCase;

import org.eclipse.dltk.ast.parser.ISourceParser;

import com.blogspot.miguelinlas3.r.eclipse.internal.parser.RSourceParser;
import com.blogspot.miguelinlas3.r.eclipse.internal.parser.RSourceParserFactory;

/**
 * Suite de pruebas unitarias destinadas a valida el correcto funcionamiento de
 * la clase {@link RSourceParserFactory}
 * 
 * @author Administrador
 * 
 */
public class RSourceParserFactoryTest extends TestCase {

	/**
	 * Clase que estamos probando
	 */
	protected RSourceParserFactory rSourceParserFactory = new RSourceParserFactory();

	/**
	 * Prueba unitaria que valida el correcto funcionamiento del método
	 * {@link RSourceParserFactory#createSourceParser()}
	 */
	public void testCreateSourceParser() {
		ISourceParser sourceParser = this.rSourceParserFactory
				.createSourceParser();

		assertTrue(sourceParser instanceof RSourceParser);
	}
}
