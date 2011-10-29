/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.launching.preferences.dialogs;

import org.eclipse.dltk.internal.debug.ui.interpreters.AbstractInterpreterLibraryBlock;
import org.eclipse.dltk.internal.debug.ui.interpreters.AddScriptInterpreterDialog;
import org.eclipse.dltk.internal.debug.ui.interpreters.IAddInterpreterDialogRequestor;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.IInterpreterInstallType;
import org.eclipse.swt.widgets.Shell;

/**
 * @author Administrador
 * 
 */
public class RAddInterpreterDialog extends AddScriptInterpreterDialog {

	public RAddInterpreterDialog(IAddInterpreterDialogRequestor requestor,
			Shell shell, IInterpreterInstallType[] interpreterInstallTypes,
			IInterpreterInstall editedInterpreter) {
		super(requestor, shell, interpreterInstallTypes, editedInterpreter);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.internal.debug.ui.interpreters.AddScriptInterpreterDialog
	 * #createLibraryBlock(org.eclipse.dltk.internal.debug.ui.interpreters.
	 * AddScriptInterpreterDialog)
	 */
	@Override
	protected AbstractInterpreterLibraryBlock createLibraryBlock(
			AddScriptInterpreterDialog dialog) {
		return new RInterpreterLibraryBlock(dialog);
	}

}
