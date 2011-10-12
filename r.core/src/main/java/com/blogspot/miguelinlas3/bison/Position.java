/**
 * 
 */
package com.blogspot.miguelinlas3.bison;

/**
 * Clase que representa posiciones en el archivo parseado
 * 
 * @author Administrador
 * 
 */
public class Position {
	int firstLine;
	int firstColumn;
	int lastLine;
	int lastColumn;

	public int getFirstLine() {
		return firstLine;
	}

	public void setFirstLine(int firstLine) {
		this.firstLine = firstLine;
	}

	public int getFirstColumn() {
		return firstColumn;
	}

	public void setFirstColumn(int firstColumn) {
		this.firstColumn = firstColumn;
	}

	public int getLastLine() {
		return lastLine;
	}

	public void setLastLine(int lastLine) {
		this.lastLine = lastLine;
	}

	public int getLastColumn() {
		return lastColumn;
	}

	public void setLastColumn(int lastColumn) {
		this.lastColumn = lastColumn;
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Position)) {
			return false;
		}
		Position other = (Position) obj;
		if ((other.getFirstColumn() == this.firstColumn)
				&& (other.getFirstLine() == this.firstLine)
				&& (other.getLastColumn() == this.lastColumn)
				&& (other.getLastLine() == this.lastLine)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		String print = "Primera Linea: " + Integer.toString(this.firstLine)
				+ "\n";
		print += "Primera Columna: " + Integer.toString(this.firstColumn)
				+ "\n";
		print += "última Linea: " + Integer.toString(this.lastLine) + "\n";
		print += "Última Columna: " + Integer.toString(this.lastColumn) + "\n";

		return print;
	}
}
