/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.core;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IConfigurationElement;
import org.eclipse.core.runtime.Platform;
import org.eclipse.dltk.core.DLTKCore;

/**
 * @author migue
 * 
 */
public final class RKeywordsManager {
	private static final String EXTENSION_POINT = "r.core.rkeywords";
	private static final String CLASS = "class";
	private static boolean initialized = false;
	private static final List<String> keywords = new ArrayList<String>();

	private static void initialize() {
		if (initialized) {
			return;
		}
		initialized = true;
		IConfigurationElement[] cfg = Platform.getExtensionRegistry()
				.getConfigurationElementsFor(RKeywordsManager.EXTENSION_POINT);

		for (int i = 0; i < cfg.length; i++) {
			if (cfg[i].getName().equals("keywords")) {
				try {
					IRKeywords addedKeywords = (IRKeywords) cfg[i]
							.createExecutableExtension(RKeywordsManager.CLASS);
					if (addedKeywords != null) {
						keywords.addAll(addedKeywords.getKeywords());
					}
				} catch (CoreException e) {
					if (DLTKCore.DEBUG) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static List<String> getKeywords() {
		initialize();
		return keywords;
	}

}
