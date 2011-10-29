/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.launching.internal;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.ILog;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.core.runtime.Status;
import org.eclipse.dltk.core.environment.IDeployment;
import org.eclipse.dltk.core.environment.IExecutionEnvironment;
import org.eclipse.dltk.core.environment.IFileHandle;
import org.eclipse.dltk.internal.launching.AbstractInterpreterInstallType;
import org.eclipse.dltk.launching.EnvironmentVariable;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.osgi.framework.Bundle;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author Administrador
 * 
 */
public class RInterpreterInstallType extends AbstractInterpreterInstallType {

	public static final String R_INTERPRETER_INSTALL_TYPE_ID = "com.blogspot.miguelinlas3.r.eclipse.r.interpreter.install.type";

	public static final String R_INSTALLER_TYPE_NAME = "R";

	private static final String[] INTERPRETER_NAMES = { "R", "Rcmd", "Rscript",
			"rscript" };

	private static final String R_UNIX_SYSTEM_DEFAULT_INSTALL_PATH = "/usr/lib/R/";

	private static final String R_UNIX_ADDITIONAL_LIBRARIES_INSTALL_PATH = "/usr/local/lib/R/site-library/";

	/**
	 * Nombre del subdirectorio de instalación de R en el que se encuentran las
	 * librerías disponibles
	 */
	private static final String R_PACKAGES_INSTALLATION_FOLDER = "library";

	/**
	 * 
	 */
	private static final String R_ADITIONAL_PACKAGES_INSTALLATION_FOLDER = "site-library";

	/**
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.internal.launching.AbstractInterpreterInstallType#
	 *      createPathFile(org.eclipse.dltk.core.environment.IDeployment)
	 */
	@Override
	protected IPath createPathFile(IDeployment deployment) throws IOException {
		Bundle bundle = RCorePlugin.getDefault().getBundle();
		return deployment.add(bundle, "scripts/packages.R");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.launching.AbstractInterpreterInstallType#
	 * doCreateInterpreterInstall(java.lang.String)
	 */
	@Override
	protected IInterpreterInstall doCreateInterpreterInstall(String id) {
		return new RInterpreterInstall(this, id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.internal.launching.AbstractInterpreterInstallType#getLog
	 * ()
	 */
	protected ILog getLog() {
		return RCorePlugin.getDefault().getLog();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.launching.AbstractInterpreterInstallType#
	 * getPluginId()
	 */
	@Override
	protected String getPluginId() {
		return RCorePlugin.PLUGIN_ID;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.internal.launching.AbstractInterpreterInstallType#
	 * getPossibleInterpreterNames()
	 */
	@Override
	protected String[] getPossibleInterpreterNames() {
		return RInterpreterInstallType.INTERPRETER_NAMES;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.launching.IInterpreterInstallType#getName()
	 */
	public String getName() {
		return RInterpreterInstallType.R_INSTALLER_TYPE_NAME;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.launching.IInterpreterInstallType#getNatureId()
	 */
	public String getNatureId() {
		return RNature.R_NATURE_ID;
	}

	protected String[] transformLibrariesPath(File[] libraries) {
		Assert.isNotNull(libraries);

		String[] transformed = new String[libraries.length];
		for (int i = 0; i < libraries.length; ++i) {
			try {
				transformed[i] = libraries[i].getCanonicalPath();

			} catch (IOException e) {
				getLog().log(
						new Status(Status.ERROR, RCorePlugin.PLUGIN_ID,
								"El archivo " + libraries[i]
										+ " no ha podido ser encontrado"));
			}
		}

		return transformed;
	}

	/**
	 * Determina el conjunto de librer�as disponibles en la instalaci�n del
	 * int�rprete manejado
	 * 
	 * @param locator
	 *            Home de la instalaci�n del int�rprete R
	 * @return Conjunto de librer�as disponibles en la instalaci�n
	 */
	protected File[] buildLibrariesPath(IFileHandle locator) {

		File librariesPath = null;
		File aditionalLibrariesPath = null;
		File otherLocation = null;
		IPath installationPath = null;

		if (Platform.getOS().equals(Platform.OS_WIN32)) {

			installationPath = new Path(locator.getCanonicalPath())
					.removeLastSegments(2);

		} else {
			// *nix systems
			installationPath = new Path(
					RInterpreterInstallType.R_UNIX_SYSTEM_DEFAULT_INSTALL_PATH);
		}

		try {
			librariesPath = new File(installationPath.toFile()
					.getCanonicalPath()
					+ IPath.SEPARATOR
					+ RInterpreterInstallType.R_PACKAGES_INSTALLATION_FOLDER);
			aditionalLibrariesPath = new File(
					installationPath.toFile().getCanonicalPath()
							+ IPath.SEPARATOR
							+ RInterpreterInstallType.R_ADITIONAL_PACKAGES_INSTALLATION_FOLDER);
			otherLocation = new File(
					RInterpreterInstallType.R_UNIX_ADDITIONAL_LIBRARIES_INSTALL_PATH);
		} catch (IOException e) {
			RCorePlugin.getDefault().getLog().log(
					new Status(IStatus.ERROR, RCorePlugin.PLUGIN_ID,
							"Error retrieving libraries"));
		}

		File[] libraries = librariesPath.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				return pathname.isDirectory();
			}
		});

		File[] aditionalLibraries = aditionalLibrariesPath
				.listFiles(new FileFilter() {
					public boolean accept(File pathname) {
						return pathname.isDirectory();
					}
				});

		File[] otherLibraries = otherLocation.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				return pathname.isDirectory();
			}
		});

		List<File> result = new ArrayList<File>();
		result.addAll(Arrays.asList(libraries));
		result.addAll(Arrays.asList(aditionalLibraries));
		result.addAll(Arrays.asList(otherLibraries));
		return result.toArray(new File[libraries.length
				+ aditionalLibraries.length]);
	}

	/**
	 * Este tipo de int�rpretes configura las referencias a las librer�as a
	 * partir de los directorios disponibles en la isntalaci�n del int�rprete
	 */
	@Override
	protected String retrivePaths(IExecutionEnvironment exeEnv,
			IFileHandle installLocation, List locations,
			IProgressMonitor monitor, IFileHandle locator,
			EnvironmentVariable[] variables) {

		IPath interpreterPath = new Path(locator.getCanonicalPath())
				.removeLastSegments(1);

		String[] librariesPath = this.transformLibrariesPath(this
				.buildLibrariesPath(installLocation));

		fillLocationsExceptOne(exeEnv.getEnvironment(), locations,
				librariesPath, interpreterPath);

		return "";
	}
}
