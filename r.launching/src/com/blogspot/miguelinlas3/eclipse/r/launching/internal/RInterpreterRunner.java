package com.blogspot.miguelinlas3.eclipse.r.launching.internal;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Status;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.model.IProcess;
import org.eclipse.dltk.console.ScriptConsoleServer;
import org.eclipse.dltk.core.DLTKCore;
import org.eclipse.dltk.core.environment.IDeployment;
import org.eclipse.dltk.core.environment.IExecutionEnvironment;
import org.eclipse.dltk.core.environment.IFileHandle;
import org.eclipse.dltk.debug.core.DLTKDebugPlugin;
import org.eclipse.dltk.internal.launching.execution.DeploymentManager;
import org.eclipse.dltk.launching.AbstractInterpreterRunner;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.InterpreterConfig;
import org.eclipse.dltk.launching.ScriptLaunchConfigurationConstants;
import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.PartInitException;
import org.eclipse.ui.browser.IWebBrowser;
import org.eclipse.ui.internal.browser.WorkbenchBrowserSupport;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchConfigurationConstants;
import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;

public class RInterpreterRunner extends AbstractInterpreterRunner {

	protected static final String BROWSER_GRAPHICS_NAME = "pdfGraphicResults";

	protected static final String PDF_GRAPHICS_RESULT_PROTOCOL = "file://";

	private static final String PDF_DEVICE_OUTPUT = "pdf";

	private static final String PDF_RESULT_FILE_NAME = "Rplots.pdf";

	private IProcess rawRun;

	public RInterpreterRunner(IInterpreterInstall install) {
		super(install);
	}

	@Override
	protected String getProcessType() {
		return RLaunchConfigurationConstants.ID_R_PROCESS_TYPE;
	}

	@Override
	public void run(final InterpreterConfig config, final ILaunch launch,
			IProgressMonitor monitor) throws CoreException {
		super.run(config, launch, monitor);

		while (!rawRun.isTerminated()) {
			RLaunchingPlugin.getDefault().log(
					new Status(Status.INFO, RLaunchingPlugin.PLUGIN_ID,
							"Process " + this.rawRun.getLabel()
									+ " has no terminated. Awaiting . . . "));
		}

		// after execution, open results (must run in a single UI thread, not
		// current)
		new Thread(new Runnable() {
			public void run() {

				Display.getDefault().asyncExec(new Runnable() {
					public void run() {
						showGraphicResults(launch, config);
					}
				});

			}
		}).start();

	}

	@Override
	protected IProcess rawRun(final ILaunch launch,
			final InterpreterConfig config) throws CoreException {

		this.rawRun = super.rawRun(launch, config);
		return this.rawRun;
	}

	final void showGraphicResults(ILaunch launch, InterpreterConfig config) {

		ILaunchConfiguration configuration = launch.getLaunchConfiguration();

		boolean outputGraphics = false;
		if (configuration != null) {

			try {
				outputGraphics = configuration
						.getAttribute(
								RLaunchConfigurationConstants.R_GRAPHICS_OUTPUT_CONFIGURATION_ATTRIBUTE,
								false);

			} catch (CoreException e) {
				if (DLTKCore.DEBUG) {
					e.printStackTrace();
				}
			}

			if (outputGraphics) {
				try {
					IWebBrowser b = WorkbenchBrowserSupport.getInstance()
							.createBrowser(
									RInterpreterRunner.BROWSER_GRAPHICS_NAME);
					b.openURL(new URL(
							RInterpreterRunner.PDF_GRAPHICS_RESULT_PROTOCOL
									+ config.getWorkingDirectoryPath()
									+ IPath.SEPARATOR
									+ RInterpreterRunner.PDF_RESULT_FILE_NAME));
				} catch (PartInitException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	protected void configureGraphicsOutput(ILaunch launch,
			InterpreterConfig config) {
		ILaunchConfiguration configuration = launch.getLaunchConfiguration();

		if (configuration != null) {
			boolean outputGraphics = false;
			try {
				outputGraphics = configuration
						.getAttribute(
								RLaunchConfigurationConstants.R_GRAPHICS_OUTPUT_CONFIGURATION_ATTRIBUTE,
								false);

			} catch (CoreException e) {
				if (DLTKCore.DEBUG) {
					e.printStackTrace();
				}
			}

			if (outputGraphics) {
				config.addScriptArg(new String(
						RInterpreterRunner.PDF_DEVICE_OUTPUT));
			}
		}
	}

	@Override
	protected void alterConfig(ILaunch launch, InterpreterConfig config) {
		super.alterConfig(launch, config);

		ILaunchConfiguration configuration = launch.getLaunchConfiguration();

		if (configuration != null) {
			boolean useRConsole = false;
			try {
				useRConsole = configuration
						.getAttribute(
								ScriptLaunchConfigurationConstants.ATTR_USE_INTERACTIVE_CONSOLE,
								false);

			} catch (CoreException e) {
				if (DLTKCore.DEBUG) {
					e.printStackTrace();
				}
			}
			if (useRConsole) {
				ScriptConsoleServer server = ScriptConsoleServer.getInstance();
				String port = Integer.toString(server.getPort());

				try {
					IExecutionEnvironment executionEnvironment = config
							.getExecutionEnvironment();
					IDeployment deployment = executionEnvironment
							.createDeployment();
					if (deployment == null) {
						throw new CoreException(
								new Status(IStatus.ERROR,
										RLaunchingPlugin.PLUGIN_ID,
										"Could not establish connection with environment."));
					}
					DeploymentManager.getInstance().addDeployment(launch,
							deployment);
					IPath path = deployment.add(RLaunchingPlugin.getDefault()
							.getBundle(), RLaunchingPlugin.getDefault()
							.getConsoleProxy());
					IFileHandle scriptFile = deployment.getFile(path);

					String id = configuration
							.getAttribute(
									ScriptLaunchConfigurationConstants.ATTR_DLTK_CONSOLE_ID,
									(String) null);
					config.addInterpreterArg(scriptFile.toOSString());
					config.addInterpreterArg(DLTKDebugPlugin.getDefault()
							.getBindAddress());
					IPath scriptFilePath = config.getScriptFilePath();
					if (scriptFilePath == null) {
						config.setScriptFile(new Path("--noscript"));
						config.setNoFile(true);
					}
					config.addInterpreterArg(port);
					if (id != null) {
						config.addInterpreterArg(id);
					} else {
						throw new CoreException(
								new Status(IStatus.ERROR,
										RLaunchingPlugin.PLUGIN_ID,
										"Error to obtain console ID. Please update launch configuratin."));
					}
				} catch (IOException e) {
					if (DLTKCore.DEBUG) {
						e.printStackTrace();
					}
				} catch (CoreException e) {
					if (DLTKCore.DEBUG) {
						e.printStackTrace();
					}
				}
			}
		}

		this.configureGraphicsOutput(launch, config);
	}
}
