/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.search;

import org.eclipse.core.runtime.SubProgressMonitor;
import org.eclipse.dltk.core.ISearchPatternProcessor;
import org.eclipse.dltk.core.search.AbstractSearchFactory;
import org.eclipse.dltk.core.search.IDLTKSearchScope;
import org.eclipse.dltk.core.search.IMatchLocatorParser;
import org.eclipse.dltk.core.search.SearchPattern;
import org.eclipse.dltk.core.search.SearchRequestor;
import org.eclipse.dltk.core.search.indexing.SourceIndexerRequestor;
import org.eclipse.dltk.core.search.matching.MatchLocator;

import com.blogspot.miguelinlas3.eclipse.r.completion.search.core.RMatchLocationParser;
import com.blogspot.miguelinlas3.eclipse.r.completion.search.core.RMatchLocator;
import com.blogspot.miguelinlas3.eclipse.r.completion.search.core.RSearchPatternProcessor;
import com.blogspot.miguelinlas3.eclipse.r.completion.search.core.RSourceIndexerRequestor;

/**
 * Factory para la creacion
 * 
 * @author Administrador
 * 
 */
public class RSearchFactory extends AbstractSearchFactory {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.ISearchFactory#createMatchParser(org.eclipse.dltk
	 * .core.search.matching.MatchLocator)
	 */
	public IMatchLocatorParser createMatchParser(MatchLocator locator) {
		return new RMatchLocationParser(locator);
	}

	@Override
	public MatchLocator createMatchLocator(SearchPattern pattern,
			SearchRequestor requestor, IDLTKSearchScope scope,
			SubProgressMonitor monitor) {
		return new RMatchLocator(pattern, requestor, scope, monitor);
	}

	@Override
	public SourceIndexerRequestor createSourceRequestor() {
		return new RSourceIndexerRequestor();
	}

	@Override
	public ISearchPatternProcessor createSearchPatternProcessor() {
		return new RSearchPatternProcessor();
	}

}
