package com.blogspot.miguelinlas3.eclipse.r.launching;

import org.eclipse.dltk.launching.ScriptLaunchConfigurationConstants;

public final class RLaunchConfigurationConstants extends
		ScriptLaunchConfigurationConstants {

	private RLaunchConfigurationConstants() {

	}

	public static final String ID_R_SCRIPT = "com.blogspot.miguelinlas3.r.eclipse.content-type"; //$NON-NLS-1$

	public static final String ID_R_PROCESS_TYPE = "rInterpreter"; //$NON-NLS-1$
	
	public static final String R_GRAPHICS_OUTPUT_CONFIGURATION_ATTRIBUTE = "pdfOutput";
}
