/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.source;

import org.eclipse.dltk.compiler.SourceElementRequestVisitor;
import org.eclipse.dltk.core.AbstractSourceElementParser;

import com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors.RSouceElementRequestor;
import com.blogspot.miguelinlas3.r.eclipse.nature.RNature;

/**
 * @author Administrador
 * 
 */
public class RSourceElementParser extends AbstractSourceElementParser {

	@Override
	protected String getNatureId() {
		return RNature.R_NATURE_ID;
	}

	@Override
	protected SourceElementRequestVisitor createVisitor() {
		return new RSouceElementRequestor(this.getRequestor());
	}

}
