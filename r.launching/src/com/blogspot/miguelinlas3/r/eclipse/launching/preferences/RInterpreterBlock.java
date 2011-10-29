/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.launching.preferences;

import org.eclipse.dltk.internal.debug.ui.interpreters.AddScriptInterpreterDialog;
import org.eclipse.dltk.internal.debug.ui.interpreters.InterpretersBlock;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.ScriptRuntime;

import com.blogspot.miguelinlas3.r.eclipse.launching.preferences.dialogs.RAddInterpreterDialog;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author Administrador
 * 
 */
public class RInterpreterBlock extends InterpretersBlock {

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.debug.ui.interpreters.InterpretersBlock#
	 * getCurrentNature()
	 */
	@Override
	protected String getCurrentNature() {
		return RNature.R_NATURE_ID;
	}

	@Override
	protected AddScriptInterpreterDialog createInterpreterDialog(
			IInterpreterInstall standin) {

		return new RAddInterpreterDialog(this, getShell(), ScriptRuntime
				.getInterpreterInstallTypes(getCurrentNature()), standin);
	}

}
