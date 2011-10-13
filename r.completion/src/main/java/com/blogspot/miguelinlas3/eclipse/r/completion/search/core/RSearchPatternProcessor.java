/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.search.core;

import org.eclipse.dltk.core.ISearchPatternProcessor;

/**
 * @author Administrador
 * 
 */
public class RSearchPatternProcessor implements ISearchPatternProcessor {

	public static final String DELIMITER_REPLACEMENT_STRING = "."; //$NON-NLS-1$

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.eclipse.dltk.core.ISearchPatternProcessor#
	 * extractDeclaringTypeQualification(java.lang.String)
	 */
	public char[] extractDeclaringTypeQualification(String patternString) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchPatternProcessor#extractDeclaringTypeSimpleName
	 * (java.lang.String)
	 */
	public char[] extractDeclaringTypeSimpleName(String patternString) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchPatternProcessor#extractSelector(java.lang
	 * .String)
	 */
	public char[] extractSelector(String patternString) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchPatternProcessor#extractTypeChars(java.lang
	 * .String)
	 */
	public String extractTypeChars(String patternString) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchPatternProcessor#extractTypeQualification
	 * (java.lang.String)
	 */
	public char[] extractTypeQualification(String patternString) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchPatternProcessor#getDelimiterReplacementString
	 * ()
	 */
	public String getDelimiterReplacementString() {
		return RSearchPatternProcessor.DELIMITER_REPLACEMENT_STRING;
	}

}
