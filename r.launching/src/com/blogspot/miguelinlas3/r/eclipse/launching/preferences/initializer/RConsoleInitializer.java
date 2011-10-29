/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.launching.preferences.initializer;

import org.eclipse.core.runtime.preferences.AbstractPreferenceInitializer;
import org.eclipse.jface.preference.IPreferenceStore;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;
import com.blogspot.miguelinlas3.eclipse.r.launching.console.RConsoleConstants;

/**
 * @author Administrador
 * 
 */
public class RConsoleInitializer extends AbstractPreferenceInitializer {

	/**
	 * 
	 */
	public RConsoleInitializer() {
		// Empty constructor
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.core.runtime.preferences.AbstractPreferenceInitializer#
	 * initializeDefaultPreferences()
	 */
	@Override
	public void initializeDefaultPreferences() {
		IPreferenceStore preferences = RLaunchingPlugin.getDefault()
				.getPreferenceStore();
		preferences.setDefault(RConsoleConstants.PREF_NEW_PROMPT,
				RConsoleConstants.DEFAULT_NEW_PROMPT);
		preferences.setDefault(RConsoleConstants.PREF_CONTINUE_PROMPT,
				RConsoleConstants.DEFAULT_CONTINUE_PROMPT);
	}

}
