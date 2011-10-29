/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.launching.remote;

import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.RemoteDebuggingEngineRunner;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;

/**
 * @author Administrador
 * 
 */
public class RRemoteDebuggerRunner extends RemoteDebuggingEngineRunner {

	public RRemoteDebuggerRunner(IInterpreterInstall install) {
		super(install);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.launching.DebuggingEngineRunner#getDebugPreferenceQualifier
	 * ()
	 */
	@Override
	protected String getDebugPreferenceQualifier() {
		return RLaunchingPlugin.PLUGIN_ID;
	}

}
