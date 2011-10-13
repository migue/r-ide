/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.search.pages;

import org.eclipse.dltk.core.IDLTKLanguageToolkit;
import org.eclipse.dltk.ui.search.ScriptSearchPage;

import com.blogspot.miguelinlas3.r.eclipse.language.RLanguageToolkit;

/**
 * @author Administrador
 * 
 */
public class RSearchPage extends ScriptSearchPage {

	public static final String SEARCH_PAGE_ID = "com.blogspot.miguelinlas3.eclipse.r.completion.search.pages.RSearchPage"; //$NON-NLS-1$

	@Override
	protected IDLTKLanguageToolkit getLanguageToolkit() {
		return RLanguageToolkit.getDefault();
	}
}
