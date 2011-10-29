/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.launching.integration;

/**
 * Utiliy function to interact with R-core system libraries
 * 
 * @author migue
 * 
 */
public class RFunctionSignature {

	/**
	 *
	 */
	protected String library;

	/**
	 * Function name
	 */
	protected String name;

	/**
	 * Signature retrieve by R-core
	 */
	protected String rawSignature;

	public RFunctionSignature(String libraryName, String name,
			String rawSignature) {
		this.library = libraryName;
		this.name = name;
		this.rawSignature = rawSignature;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRawSignature() {
		return rawSignature;
	}

	public void setRawSignature(String rawSignature) {
		this.rawSignature = rawSignature;
	}

	public String getLibrary() {
		return library;
	}

	public void setLibrary(String library) {
		this.library = library;
	}

	@Override
	public String toString() {
		return this.rawSignature.replace("function", this.name).trim();
	}
}
