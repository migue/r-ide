/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.core;

import java.util.Arrays;
import java.util.List;

/**
 * @author migue
 * 
 */
public class RKeywords implements IRKeywords {

	private static String[] defaultKeywords = { "if", "else", "for", "while",
			"break", "continue", "repeat", "TRUE", "FALSE", "Inf", "NaN",
			"function" };

	public List<String> getKeywords() {
		return Arrays.asList(defaultKeywords);
	}
}
