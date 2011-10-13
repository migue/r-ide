/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.completion.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.ui.text.util.CollectionUtils;

import com.blogspot.miguelinlas3.eclipse.r.completion.navigation.exception.ElementNotFoundInContext;

/**
 * This class represents contextual informatión in order to help completion and
 * navigation operations
 * 
 * @author migue
 * 
 */

public class ContextualCollectionReferences<T extends VariableReference> {

	protected Stack<Map<String, T>> contexts;

	public ContextualCollectionReferences() {
		contexts = new Stack<Map<String, T>>();
	}

	public void newContext() {
		this.contexts.push(new HashMap<String, T>());
	}

	public Map<String, T> dropCurrentContext() {
		return this.contexts.pop();
	}

	/**
	 * Add a new element in current context
	 * 
	 * @param element
	 *            New elemento to put in current context
	 */
	public void addElement(T element) {
		this.contexts.peek().put(element.getName(), element);
	}

	public Map<String, T> getElementsInCurrentContext() {
		return this.contexts.peek();
	}

	/**
	 * Search in all context the indicated reference
	 * 
	 * @param reference
	 * @return The reference found.
	 * @throws ElementNotFoundInContext
	 */
	public T searchInContext(String name) throws ElementNotFoundInContext {
		for (Map<String, T> context : this.contexts) {
			if (context.containsKey(name)) {
				return context.get(name);
			}
		}

		throw new ElementNotFoundInContext("Element " + name
				+ " has not been found in current context");
	}

	/**
	 * Search in all context the indicate reference that starts with indcated
	 * pattern
	 * 
	 * @param pattern
	 * @return The list of references found
	 * @throws ElementNotFoundInContext
	 *             If no references were found
	 * 
	 */
	public List<T> searchInContextStartWith(String pattern)
			throws ElementNotFoundInContext {

		List<T> foundItems = new ArrayList<T>();

		for (Map<String, T> context : this.contexts) {
			for (String key : context.keySet()) {
				if (key.startsWith(pattern)) {
					foundItems.add(context.get(key));
				}
			}
		}

		if (foundItems.size() == 0) {
			throw new ElementNotFoundInContext("No elements starting with "
					+ pattern + " were found in current contexts");
		}

		return foundItems;
	}
}
