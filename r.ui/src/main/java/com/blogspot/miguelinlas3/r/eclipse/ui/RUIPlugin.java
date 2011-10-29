package com.blogspot.miguelinlas3.r.eclipse.ui;

import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.osgi.framework.BundleContext;


import com.blogspot.miguelinlas3.r.eclipse.ui.text.RTextTools;

/**
 * The activator class controls the plug-in life cycle
 */
public class RUIPlugin extends AbstractUIPlugin {

	// The plug-in ID
	public static final String PLUGIN_ID = "com.blogspot.miguelinlas3.r.eclipse.ui";

	// The shared instance
	private static RUIPlugin plugin;

	protected RTextTools rTextTools;

	public synchronized RTextTools getTextTools() {
		if (this.rTextTools == null)
			this.rTextTools = new RTextTools(true);

		return this.rTextTools;
	}

	/**
	 * The constructor
	 */
	public RUIPlugin() {
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
	public static RUIPlugin getDefault() {
		return plugin;
	}

}
