package com.blogspot.miguelinlas3.eclipse.r.launching;

import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.osgi.framework.BundleContext;

/**
 * The activator class controls the plug-in life cycle
 */
public class RLaunchingPlugin extends AbstractUIPlugin {

	// The plug-in ID
	public static final String PLUGIN_ID = "r.launching"; //$NON-NLS-1$

	// The shared instance
	private static RLaunchingPlugin plugin;

	/**
	 * The constructor
	 */
	public RLaunchingPlugin() {
		plugin = this;
	}

	public void start(BundleContext context) throws Exception {
		super.start(context);
	}

	public void stop(BundleContext context) throws Exception {
		plugin = null;
		super.stop(context);
	}

	/**
	 * Returns the shared instance
	 * 
	 * @return the shared instance
	 */
	public static RLaunchingPlugin getDefault() {
		return plugin;
	}

	public static String getUniqueIdentifier() {
		return PLUGIN_ID;
	}

	public static void log(IStatus status) {
		getDefault().getLog().log(status);
	}

	public static void log(String message) {
		log(new Status(IStatus.ERROR, getUniqueIdentifier(), IStatus.ERROR,
				message, null));
	}

	public static void log(Throwable e) {
		log(new Status(IStatus.ERROR, getUniqueIdentifier(), IStatus.ERROR, e
				.getMessage(), e));
	}

	public String getConsoleProxy() {
		return "console/ConsoleProxy.R"; //$NON-NLS-1$
	}
}
