/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language;

import org.eclipse.dltk.core.AbstractLanguageToolkit;
import org.eclipse.dltk.core.IDLTKLanguageToolkit;

import com.blogspot.miguelinlas3.r.eclipse.contenttypes.RContentDescriber;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author Administrador
 * 
 */
public class RLanguageToolkit extends AbstractLanguageToolkit {

	/**
	 * Nombre del lenguaje
	 */
	protected static final String R_LANGUAGE_NAME = "R";

	/**
	 * Única instancia del {@link IDLTKLanguageToolkit}
	 */
	protected static RLanguageToolkit toolkit;

	/**
	 * Recupera la única instancia del {@link IDLTKLanguageToolkit}
	 * 
	 * @return la única instancia del {@link IDLTKLanguageToolkit}
	 */
	public static IDLTKLanguageToolkit getDefault() {
		if (toolkit == null) {
			toolkit = new RLanguageToolkit();
		}
		return toolkit;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.core.IDLTKLanguageToolkit#getLanguageContentType()
	 */
	public String getLanguageContentType() {
		return RContentDescriber.CONTENT_TYPE_EXTENSION_ID;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.core.IDLTKLanguageToolkit#getLanguageName()
	 */
	public String getLanguageName() {
		return RLanguageToolkit.R_LANGUAGE_NAME;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.core.IDLTKLanguageToolkit#getNatureId()
	 */
	public String getNatureId() {
		return RNature.R_NATURE_ID;
	}
}
