package com.blogspot.miguelinlas3.eclipse.r.launching.remote;

import org.eclipse.dltk.launching.AbstractRemoteLaunchConfigurationDelegate;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.RemoteDebuggingEngineRunner;

import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * 
 */

/**
 * @author Administrador
 * 
 */
public class RRemoteLaunchConfigurationDelegate extends
		AbstractRemoteLaunchConfigurationDelegate {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.launching.AbstractRemoteLaunchConfigurationDelegate#
	 * getDebuggingRunner(org.eclipse.dltk.launching.IInterpreterInstall)
	 */
	@Override
	protected RemoteDebuggingEngineRunner getDebuggingRunner(
			IInterpreterInstall install) {
		return new RRemoteDebuggerRunner(install);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.launching.AbstractScriptLaunchConfigurationDelegate#
	 * getLanguageId()
	 */
	@Override
	public String getLanguageId() {
		return RNature.R_NATURE_ID;
	}

}
