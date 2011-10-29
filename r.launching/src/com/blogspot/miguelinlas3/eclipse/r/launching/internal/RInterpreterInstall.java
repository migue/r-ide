/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.launching.internal;

import java.util.List;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IPath;
import org.eclipse.debug.core.ILaunchManager;
import org.eclipse.dltk.core.environment.IEnvironment;
import org.eclipse.dltk.core.environment.IExecutionEnvironment;
import org.eclipse.dltk.core.environment.IFileHandle;
import org.eclipse.dltk.launching.AbstractInterpreterInstall;
import org.eclipse.dltk.launching.IInterpreterInstallType;
import org.eclipse.dltk.launching.IInterpreterRunner;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;
import com.blogspot.miguelinlas3.eclipse.r.launching.integration.RIntegrationHandler;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author Administrador
 * 
 */
public class RInterpreterInstall extends AbstractInterpreterInstall {

	protected static final String R_COMMAND = "R";
	protected static final String CMD_ARG = "CMD";
	protected static final String R_ARGS = "--no-save";
	protected static final String START_RSERVE_COMMAND = "Rserve";
	private Process process;

	public RInterpreterInstall(IInterpreterInstallType type, String id) {
		super(type, id);
	}

	@Override
	public void setInstallLocation(IFileHandle installLocation) {
		super.setInstallLocation(installLocation);
		this.startupRServeEngine();
	}

	private String[] buildCmdLine() {
		IPath path = (IPath) getInstallLocation().getPath().clone();

		return new String[] {
				path.removeLastSegments(1).toOSString() + IPath.SEPARATOR
						+ RInterpreterInstall.R_COMMAND,
				RInterpreterInstall.CMD_ARG,
				RInterpreterInstall.START_RSERVE_COMMAND,
				RInterpreterInstall.R_ARGS };
	}

	private void startupRServeEngine() {
		// activamos el servicio de autocompleción de código
		// XXX esto habrá que hacerlo con un parser en el futuro en lugar de
		// delegar en R
		IEnvironment env = getEnvironment();
		IExecutionEnvironment exeEnv = (IExecutionEnvironment) env
				.getAdapter(IExecutionEnvironment.class);

		if (this.process == null) {
			try {
				process = exeEnv.exec(this.buildCmdLine(), null, null);

				// InputStream errorStream = process.getErrorStream();
				//
				// BufferedReader reader = new BufferedReader(new
				// InputStreamReader(
				// errorStream));
				// StringBuffer buffer = new StringBuffer();
				// String line = "";
				// try {
				// while ((line = reader.readLine()) != null) {
				// buffer.append(line);
				// }
				// } catch (IOException e) {
				// // TODO Auto-generated catch block
				// e.printStackTrace();
				// }
				//
				// System.out.println(buffer.toString());

			} catch (CoreException e) {
				RLaunchingPlugin
						.log("Error mientras se intentaba arrancar el servicio de compleción");
			}

		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.launching.IInterpreterInstall#getNatureId()
	 */
	public String getNatureId() {
		return RNature.R_NATURE_ID;
	}

	@Override
	public IInterpreterRunner getInterpreterRunner(String mode) {

		IInterpreterRunner runner = super.getInterpreterRunner(mode);

		if (runner != null)
			return runner;

		if (ILaunchManager.RUN_MODE.equals(mode)) {
			return new RInterpreterRunner(this);
		}

		return null;
	}

	@Override
	protected void finalize() throws Throwable {
		super.finalize();
		if (this.process != null)
			this.process.destroy();
	}
}
