/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.internal.parser;

import org.eclipse.dltk.ast.parser.ISourceParser;
import org.eclipse.dltk.ast.parser.ISourceParserFactory;

/**
 * @author migue
 * 
 */
public class RSourceParserFactory implements ISourceParserFactory {

	/**
	 * 
	 */
	public RSourceParserFactory() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.ast.parser.ISourceParserFactory#createSourceParser()
	 */
	public ISourceParser createSourceParser() {
		return new RSourceParser();
	}

}
