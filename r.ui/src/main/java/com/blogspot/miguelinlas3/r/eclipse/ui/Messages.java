package com.blogspot.miguelinlas3.r.eclipse.ui;

import org.eclipse.osgi.util.NLS;

public class Messages extends NLS {
	private static final String BUNDLE_NAME = "com.blogspot.miguelinlas.internal.console.ui.messages"; //$NON-NLS-1$
	public static String RConsole_Name;
	static {
		// initialize resource bundle
		NLS.initializeMessages(BUNDLE_NAME, Messages.class);
	}

	private Messages() {
	}
}
