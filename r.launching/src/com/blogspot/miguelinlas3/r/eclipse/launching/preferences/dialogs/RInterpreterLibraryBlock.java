/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.launching.preferences.dialogs;

import org.eclipse.dltk.internal.debug.ui.interpreters.AbstractInterpreterLibraryBlock;
import org.eclipse.dltk.internal.debug.ui.interpreters.AddScriptInterpreterDialog;
import org.eclipse.dltk.internal.debug.ui.interpreters.LibraryLabelProvider;
import org.eclipse.jface.viewers.IBaseLabelProvider;

/**
 * @author Administrador
 * 
 */
public class RInterpreterLibraryBlock extends AbstractInterpreterLibraryBlock {

	protected RInterpreterLibraryBlock(AddScriptInterpreterDialog dialog) {
		super(dialog);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.debug.ui.interpreters.
	 * AbstractInterpreterLibraryBlock#getLabelProvider()
	 */
	@Override
	protected IBaseLabelProvider getLabelProvider() {
		return new LibraryLabelProvider();
	}

}
