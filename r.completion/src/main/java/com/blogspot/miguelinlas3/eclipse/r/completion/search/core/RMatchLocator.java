package com.blogspot.miguelinlas3.eclipse.r.completion.search.core;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.dltk.core.search.IDLTKSearchScope;
import org.eclipse.dltk.core.search.SearchPattern;
import org.eclipse.dltk.core.search.SearchRequestor;
import org.eclipse.dltk.core.search.matching.MatchLocator;

public class RMatchLocator extends MatchLocator {

	/**
	 * 
	 * {@inheritDoc}
	 */
	public RMatchLocator(SearchPattern pattern, SearchRequestor requestor,
			IDLTKSearchScope scope, IProgressMonitor progressMonitor) {
		super(pattern, requestor, scope, progressMonitor);
	}

}
