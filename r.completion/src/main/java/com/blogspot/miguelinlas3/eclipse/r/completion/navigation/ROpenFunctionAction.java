/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.navigation;

import org.eclipse.dltk.ui.IDLTKUILanguageToolkit;
import org.eclipse.dltk.ui.actions.OpenTypeAction;

import com.blogspot.miguelinlas3.r.eclipse.ui.RUILanguageToolkit;

/**
 * @author Administrador
 * 
 */
public class ROpenFunctionAction extends OpenTypeAction {

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.ui.actions.OpenTypeAction#getUILanguageToolkit()
	 */
	@Override
	protected IDLTKUILanguageToolkit getUILanguageToolkit() {
		return new RUILanguageToolkit();
	}

}
