/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.contenttypes;

import java.util.regex.Pattern;

import org.eclipse.dltk.core.ScriptContentDescriber;

/**
 * @author miguw
 * 
 */
public class RContentDescriber extends ScriptContentDescriber {

	/**
	 * Identificador para la extensión de archivos R
	 */
	public static final String CONTENT_TYPE_EXTENSION_ID = "com.blogspot.miguelinlas3.r.eclipse.content-type";

	/**
	 * Cabecera del fichero R para determinar si es de tipo R a pesar de que no
	 * presente la extensión
	 */
	protected static Pattern[] HEADER_PATTERNS = { Pattern.compile("^#!.*R.*",
			Pattern.MULTILINE) };

	/**
	 * Constructor por defecto del descriptor
	 */
	public RContentDescriber() {

	}

	/**
	 * 
	 * @see org.eclipse.dltk.core.ScriptContentDescriber#getHeaderPatterns()
	 */
	@Override
	protected Pattern[] getHeaderPatterns() {
		return RContentDescriber.HEADER_PATTERNS;

	}
}
