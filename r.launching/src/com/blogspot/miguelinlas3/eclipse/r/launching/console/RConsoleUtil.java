package com.blogspot.miguelinlas3.eclipse.r.launching.console;

import java.io.IOException;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IPath;
import org.eclipse.debug.core.DebugException;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.model.IProcess;
import org.eclipse.dltk.console.ScriptConsoleServer;
import org.eclipse.dltk.core.DLTKCore;
import org.eclipse.dltk.core.environment.EnvironmentManager;
import org.eclipse.dltk.core.environment.IDeployment;
import org.eclipse.dltk.core.environment.IEnvironment;
import org.eclipse.dltk.core.environment.IExecutionEnvironment;
import org.eclipse.dltk.core.environment.IFileHandle;
import org.eclipse.dltk.debug.core.DLTKDebugPlugin;
import org.eclipse.dltk.internal.launching.execution.DeploymentManager;
import org.eclipse.dltk.launching.ScriptLaunchUtil;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

public class RConsoleUtil {
	public static ILaunch runDefaultRInterpreter(RInterpreter interpreter)
			throws CoreException, IOException {

		final ConsoleDeployment deployment = deployConsoleScript(EnvironmentManager
				.getLocalEnvironment());
		if (deployment == null) {
			return null;
		}
		final ILaunch launch = ScriptLaunchUtil.runScript(RNature.R_NATURE_ID,
				deployment.scriptFile, null, null,
				constructConsoleArgs(interpreter), null);
		registerForCleanup(launch, deployment, interpreter);
		return launch;
	}

	/**
	 * @since 1.1
	 */
	// public static ILaunch runTclInterpreter(IInterpreterInstall install,
	// TclInterpreter interpreter) throws CoreException, IOException {
	// final ConsoleDeployment deployment = deployConsoleScript(install
	// .getEnvironment());
	// if (deployment == null) {
	// return null;
	// }
	// final ILaunch launch = ScriptLaunchUtil.runScript(install,
	// deployment.scriptFile, null, null,
	// constructConsoleArgs(interpreter), null);
	// registerForCleanup(launch, deployment, interpreter);
	// return launch;
	// }

	private static class ConsoleDeployment {
		final IFileHandle scriptFile;
		final IDeployment deployment;

		public ConsoleDeployment(IDeployment deployment, IFileHandle scriptFile) {
			this.deployment = deployment;
			this.scriptFile = scriptFile;
		}

	}

	private static ConsoleDeployment deployConsoleScript(
			IEnvironment environment) throws IOException {
		final IExecutionEnvironment exeEnv = (IExecutionEnvironment) environment
				.getAdapter(IExecutionEnvironment.class);
		final IDeployment deployment = exeEnv.createDeployment();
		if (deployment == null) {
			return null;
		}
		final IPath path = deployment.add(RLaunchingPlugin.getDefault()
				.getBundle(), RLaunchingPlugin.getDefault().getConsoleProxy());
		return new ConsoleDeployment(deployment, deployment.getFile(path));
	}

	private static String[] constructConsoleArgs(RInterpreter interpreter) {
		ScriptConsoleServer server = ScriptConsoleServer.getInstance();
		return new String[] { DLTKDebugPlugin.getDefault().getBindAddress(),
				Integer.toString(server.getPort()),
				server.register(interpreter) };
	}

	private static void registerForCleanup(final ILaunch launch,
			final ConsoleDeployment deployment, RInterpreter interpreter) {
		if (launch == null) {
			return;
		}
		DeploymentManager.getInstance().addDeployment(launch,
				deployment.deployment);
		interpreter.addCloseOperation(new Runnable() {
			public void run() {
				IProcess[] processes = launch.getProcesses();
				if (processes != null) {
					for (int i = 0; i < processes.length; i++) {
						try {
							processes[i].terminate();
						} catch (DebugException e) {
							if (DLTKCore.DEBUG) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		});
	}

}
