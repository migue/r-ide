/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.core.internal.mixin;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.dltk.core.DLTKLanguageManager;
import org.eclipse.dltk.core.IScriptProject;
import org.eclipse.dltk.core.mixin.MixinModel;

import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author migue
 * 
 */
public class RMixinModel {
	private Map<IScriptProject, MixinModel> instances = new HashMap<IScriptProject, MixinModel>();;

	private static RMixinModel instance;

	private RMixinModel() {
	}

	public static synchronized RMixinModel getInstance() {
		if (instance == null)
			instance = new RMixinModel();
		return instance;
	}

	public MixinModel getMixin(IScriptProject project) {
		synchronized (instances) {
			MixinModel mixinModel = instances.get(project);
			if (mixinModel == null) {
				mixinModel = new MixinModel(DLTKLanguageManager
						.getLanguageToolkit(RNature.R_NATURE_ID), project);
				instances.put(project, mixinModel);
				// bindObjectInitialization(mixinModel);
			}
			return mixinModel;
		}
	}

}
