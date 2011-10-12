/**
 * 
 */
package com.blogspot.miguelinlas3.bison;

/**
 * Clase de utilidad para definir posiciones en el parser
 * 
 * @author Administrador
 * 
 */
public class Location {

	/**
	 * Comienzo de la sentencia
	 */
	Position begin;

	/**
	 * Final de la sentencia
	 */
	Position end;

	public Location(Position loc) {
		this.begin = this.end = loc;
	}

	Location(Position begin, Position end) {
		this.begin = begin;
		this.end = end;
	}

	@Override
	public String toString() {
		if (this.begin != null & this.end != end)
			return "Begin: " + this.begin.toString() + " End: " //$NON-NLS-1$ //$NON-NLS-2$
					+ this.end.toString();

		return "";
	}
}
