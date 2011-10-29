/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.launching.preferences;

import org.eclipse.dltk.internal.debug.ui.interpreters.InterpretersBlock;
import org.eclipse.dltk.internal.debug.ui.interpreters.ScriptInterpreterPreferencePage;

/**
 * @author Administrador
 * 
 */
public class RPreferencePage extends ScriptInterpreterPreferencePage {

	public static final String PAGE_ID = "com.blogspot.miguelinlas3.r.eclipse.preferences.interpreters";

	/**
	 * 
	 */
	public RPreferencePage() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.debug.ui.interpreters.
	 * ScriptInterpreterPreferencePage#createInterpretersBlock()
	 */
	@Override
	public InterpretersBlock createInterpretersBlock() {
		return new RInterpreterBlock();
	}

}
