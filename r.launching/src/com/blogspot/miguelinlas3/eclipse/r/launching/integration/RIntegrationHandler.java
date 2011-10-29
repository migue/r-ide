/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.launching.integration;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.dltk.compiler.env.ISourceModule;
import org.eclipse.dltk.launching.IInterpreterInstall;
import org.eclipse.dltk.launching.LibraryLocation;
import org.eclipse.dltk.launching.ScriptRuntime;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.blogspot.miguelinlas3.eclipse.r.launching.RLaunchingPlugin;

/**
 * Este handler de integración sirve para la primera versión pero habrá que lo
 * refactorizar, porque RServe es muy lento
 * 
 * @author migue
 * 
 */
public class RIntegrationHandler {

	/**
	 * Caché con las peticiones para agilizar el proceso de petición
	 */
	protected Map<String, List<String>> cacheFuns = new HashMap<String, List<String>>();

	/**
	 * Cachea la signatura de la función correspondiente
	 * 
	 * @param library
	 * @param funcSignature
	 */
	protected void addFuncToCache(String library, String funcSignature) {
		if (!this.cacheFuns.containsKey(library)) {
			this.cacheFuns.put(library, new ArrayList<String>());
		}
		this.cacheFuns.get(library).add(funcSignature);
	}

	protected boolean isCached(String library, String funcSignature) {
		if (!this.cacheFuns.containsKey(library)) {
			return false;
		}

		List<String> list = this.cacheFuns.get(library);
		for (String fun : list) {
			if (fun.equals(funcSignature))
				return true;
		}
		return false;
	}

	protected List<String> getFunctionSignature(String library, String pattern) {
		List<String> results = new ArrayList<String>();

		List<String> list = this.cacheFuns.get(library);

		for (String fun : list) {
			if (fun.startsWith(pattern)) {
				results.add(fun);
			}
		}
		return results;
	}

	protected static final String LIBRARY_PATTERN = "library(\"{0}\")";
	protected static final String LST_STR_PATTERN = "lsf.str(\"package:{0}\")";
	protected static final String FORMAT_PATTERN = "format({0})";

	protected List<RFunctionSignature> allFunctionsInLibrary(
			LibraryLocation library, String pattern)
			throws REXPMismatchException, RserveException {
		
		RConnection connection = null;

		try {
			connection = new RConnection();
		} catch (RserveException e) {
			RLaunchingPlugin.getDefault().log("Error trying to connect RServe");
			return new ArrayList<RFunctionSignature>();
		}

		List<RFunctionSignature> result = new ArrayList<RFunctionSignature>();
		try {
			// load library
			String libraryName = library.getLibraryPath().lastSegment();
			String libraryToLoad = MessageFormat.format(LIBRARY_PATTERN,
					libraryName);

			connection.eval(libraryToLoad);

			// all functions in library
			String funcsInLibraryCommand = MessageFormat.format(
					LST_STR_PATTERN, libraryName);
			REXP funcsInLibrary = connection.eval(funcsInLibraryCommand);

			String[] allFuncs = funcsInLibrary.asStrings();			
			
			for (int i = 0; i < allFuncs.length; ++i) {
				if (allFuncs[i].startsWith(pattern)) {
					// retrieve function info

					try {
						REXP signature = connection.eval(MessageFormat.format(
								FORMAT_PATTERN, allFuncs[i]));
						String rawSignature = signature.asString();
						result.add(new RFunctionSignature(libraryName,
								allFuncs[i], rawSignature));
					} catch (RserveException e) {
						RLaunchingPlugin.log("Error retrieving signature of "
								+ allFuncs[i]);
					}

				}
			}
		} finally {
			connection.close();
		}

		return result;
	}

	public List<RFunctionSignature> matchingFunction(ISourceModule module,
			String pattern) {
		IInterpreterInstall install = null;
		try {
			install = ScriptRuntime.getInterpreterInstall(module
					.getModelElement().getScriptProject());
		} catch (CoreException e) {
			RLaunchingPlugin
					.log("Error retrieving interpreter install for module "
							+ module.getFileName());
		}
		return this.functionsInInterpreterInstall(install, pattern);
	}

	protected List<RFunctionSignature> functionsInInterpreterInstall(
			IInterpreterInstall install, String pattern) {

		LibraryLocation[] libraryLocations = install
				.getInterpreterInstallType().getDefaultLibraryLocations(
						install.getInstallLocation());

		List<RFunctionSignature> allFunctions = new ArrayList<RFunctionSignature>();
		for (int i = 0; i < libraryLocations.length; ++i) {
			try {
				allFunctions.addAll(allFunctionsInLibrary(libraryLocations[i],
						pattern));

			} catch (RserveException e) {
				RLaunchingPlugin.log("Error retrieving info from "
						+ libraryLocations[i].getLibraryPath());
				// try next library;
			} catch (REXPMismatchException e) {
				RLaunchingPlugin.log("Error processing result info from "
						+ libraryLocations[i].getLibraryPath());
				// try next library;
			}
		}

		return allFunctions;
	}
}
