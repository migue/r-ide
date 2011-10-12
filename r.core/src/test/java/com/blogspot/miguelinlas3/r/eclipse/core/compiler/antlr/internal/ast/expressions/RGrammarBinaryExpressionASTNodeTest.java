/**
 * com.blogspot.miguelinlas3.r.eclipse.core es uno de los modulos que compone el producto R-eclipse; desarrollado por Miguel Pastor
 * http://miguelinlas3.blogspot.com
 * miguelinlas3 at gmail.com
 */
package com.blogspot.miguelinlas3.r.eclipse.core.compiler.antlr.internal.ast.expressions;

import java.util.List;

import org.eclipse.dltk.ast.statements.Statement;

import com.blogspot.miguelinlas3.r.eclipse.core.compiler.antlr.internal.ast.AbstractRGrammarASTNodesTest;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;

/**
 * Suite de pruebas que verifican la correcta construcción de nodos del AST que
 * representan operaciones binarias tales como el conjunto de operaciones
 * aritméticas, comparaciones,asignaciones, etc
 * 
 * @see BinaryExpression
 * @see Statement
 * 
 * @author Administrador
 * 
 */
public class RGrammarBinaryExpressionASTNodeTest extends
		AbstractRGrammarASTNodesTest {

	/**
	 * Lista de statements del script que se parsea en
	 * {@link #parserScriptSourceCode(String)}
	 */
	protected List statements;

	/**
	 * Recupera el statement que est� en la posici�n indicada del script
	 * parseado mediante la funci�n {@link #parserScriptSourceCode(String)}
	 * 
	 * @param position
	 * @return Statement en la posici�n indicada o <code>null</code> en caso de
	 *         que no se haya parseado el fichero
	 */
	protected Object getStatementAt(int position) {
		return this.statements != null ? this.statements.get(position) : null;
	}

	/**
	 * 
	 * Verifica que se conxtruye correctamente el nodo AST que representa una
	 * operaci�n aritm�tica de suma
	 * 
	 * @throws Exception
	 */
	public void testSumASTNode() throws Exception {

		boolean parseState = this
				.configureAndParse("src/test/resources/com/blogspot/miguelinlas3/r/eclipse/core/compiler/internal/antlr/expressions/sampleExpression.r"); //$NON-NLS-1$; 

		assertTrue(parseState);
	}

	// public void testSumWithThreeOperands() throws Exception {
	// ModuleDeclaration root = this
	//				.configureAndParse("src/test/resources/com/blogspot/miguelinlas3/r/eclipse/core/compiler/internal/antlr/expressions/complexExpression.r"); //$NON-NLS-1$
	// assertEquals(1, root.getStatements().size());
	// }
	//
	// public void testSumWithFourOperands() throws Exception {
	// ModuleDeclaration root = this
	//				.configureAndParse("src/test/resources/com/blogspot/miguelinlas3/r/eclipse/core/compiler/internal/antlr/expressions/complexExpression.r"); //$NON-NLS-1$
	// }
}
