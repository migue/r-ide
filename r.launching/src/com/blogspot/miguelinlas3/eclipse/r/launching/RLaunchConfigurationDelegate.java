package com.blogspot.miguelinlas3.eclipse.r.launching;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.dltk.launching.AbstractScriptLaunchConfigurationDelegate;
import org.eclipse.dltk.launching.InterpreterConfig;

import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

public class RLaunchConfigurationDelegate extends
		AbstractScriptLaunchConfigurationDelegate {

	public static final String LAUNCH_CONFIGURATION_ID = "com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchConfigurationType"; //$NON-NLS-1$

	public String getLanguageId() {
		return RNature.R_NATURE_ID;
	}

	@Override
	protected InterpreterConfig createInterpreterConfig(
			ILaunchConfiguration configuration, ILaunch launch)
			throws CoreException {
		InterpreterConfig config = super.createInterpreterConfig(configuration,
				launch);
		if (config != null) {
		}

		return config;
	}

}