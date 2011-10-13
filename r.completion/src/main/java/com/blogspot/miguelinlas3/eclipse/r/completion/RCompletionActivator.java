package com.blogspot.miguelinlas3.eclipse.r.completion;

import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.osgi.framework.BundleContext;

public class RCompletionActivator extends AbstractUIPlugin {

	// The plug-in ID
	public static final String PLUGIN_ID = "r.completion";

	// The shared instance
	private static RCompletionActivator plugin;

	/**
	 * The constructor
	 */
	public RCompletionActivator() {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.ui.plugin.AbstractUIPlugin#start(org.osgi.framework.BundleContext
	 * )
	 */
	public void start(BundleContext context) throws Exception {
		super.start(context);
		plugin = this;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.ui.plugin.AbstractUIPlugin#stop(org.osgi.framework.BundleContext
	 * )
	 */
	public void stop(BundleContext context) throws Exception {
		plugin = null;
		super.stop(context);
	}

	/**
	 * Returns the shared instance
	 * 
	 * @return the shared instance
	 */
	public static RCompletionActivator getDefault() {
		return plugin;
	}
}
