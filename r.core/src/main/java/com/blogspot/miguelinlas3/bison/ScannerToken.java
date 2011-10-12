package com.blogspot.miguelinlas3.bison;

import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.ast.ASTVisitor;

/**
 * Clase base para todos los valores que iran apareciendo en la pila semantica
 * del analizador sintactico.
 * 
 * Notese que esta pila servira tanto los valores que va dejando las distintas
 * acciones de las reglas como los valores semanticos que de los tokens que
 * procesa el analizador lexico
 * 
 * @author migue
 * 
 */
public class ScannerToken extends ASTNode {
	RTerminal type;
	int offset;
	int length;
	String text;
	int status;
	public int token;

	public ScannerToken() {
		// Default constructor
	}

	public ScannerToken(ScannerToken scannerToken) {
		this.type = scannerToken.type;
		this.length = scannerToken.length;
		this.text = scannerToken.text;
		this.status = scannerToken.status;
		this.token = scannerToken.token;
		this.offset = scannerToken.offset;

	}

	public RTerminal getType() {
		return type;
	}

	public int getOffset() {
		return offset;
	}

	public int getLength() {
		return length;
	}

	public String getText() {
		return text;
	}

	public int getStatus() {
		return status;
	}

	@Override
	public void traverse(ASTVisitor visitor) throws Exception {
		// TODO Auto-generated method stub

	}

}