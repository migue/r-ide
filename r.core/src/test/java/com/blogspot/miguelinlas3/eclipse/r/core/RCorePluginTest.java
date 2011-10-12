package com.blogspot.miguelinlas3.eclipse.r.core;

import junit.framework.TestCase;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;

/**
 * Conjunto de pruebas unitarias que validan el comportamiento de la clase
 * {@link RCorePlugin}
 * 
 * @author Administrador
 * 
 */
public class RCorePluginTest extends TestCase {

	/**
	 * CLase a probar
	 */
	protected RCorePlugin rCorePlugin = RCorePlugin.getDefault();

	/**
	 * Prueba unitaria que comprueba que la instancia del <code>activator</code>
	 * es �nica en todo el programa
	 */
	public void testIsSingleInstance() {
		RCorePlugin sameReference = RCorePlugin.getDefault();

		assertEquals(this.rCorePlugin, sameReference);
	}

}
