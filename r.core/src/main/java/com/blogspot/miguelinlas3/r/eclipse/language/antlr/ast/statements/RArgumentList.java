/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.dltk.ast.expressions.CallArgumentsList;

/**
 * @author migue
 * 
 */
public class RArgumentList extends CallArgumentsList {

	public RArgumentList() {
		// empty argument list
	}

	protected List<Integer> commaPositions = new ArrayList<Integer>();

	public List<Integer> getCommaPositions() {
		return commaPositions;
	}

	public RArgumentList(int sourceStart, int sourceEnd) {
		super(sourceStart, sourceEnd);
	}

	public void addNewCommaPosition(Integer newPosition) {
		this.commaPositions.add(newPosition);
	}

}
