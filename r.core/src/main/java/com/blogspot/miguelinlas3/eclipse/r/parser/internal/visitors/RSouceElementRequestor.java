package com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors;

import org.eclipse.dltk.ast.declarations.MethodDeclaration;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.expressions.Expression;
import org.eclipse.dltk.ast.references.VariableReference;
import org.eclipse.dltk.ast.statements.Statement;
import org.eclipse.dltk.compiler.ISourceElementRequestor;
import org.eclipse.dltk.compiler.SourceElementRequestVisitor;

import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.BinaryExpression;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.RExpressionConstansExtension;
import com.blogspot.miguelinlas3.r.eclipse.language.antlr.ast.statements.LoadLibraryExpression;

/**
 * Visitor que recorre el AST construido por el parser con el objetivo de
 * determinar las diferentes construcciones del script R.
 * <p>
 * Ser� el encargado de determinar diferntes elementos como funciones, clases,
 * etc que aparecen en el script. Puede ser util para mostrar los componentes
 * del archivo en la vista de <code>Script Explorer</code> o en el
 * <code>Outline</code>
 * 
 * @author Administrador
 * 
 */
public class RSouceElementRequestor extends SourceElementRequestVisitor {

	public RSouceElementRequestor(ISourceElementRequestor requesor) {
		super(requesor);
	}

	@Override
	public boolean visit(MethodDeclaration method) throws Exception {
		return super.visit(method);
	}

	@Override
	public boolean visit(Expression expression) throws Exception {
		if (expression instanceof BinaryExpression) {
			BinaryExpression binaryExp = (BinaryExpression) expression;

			if (binaryExp.getKind() == RExpressionConstansExtension.E_LEFT_ASSIGN
					&& binaryExp.getRight() instanceof MethodDeclaration) {
				MethodDeclaration methodDeclaration = (MethodDeclaration) binaryExp
						.getRight();
				VariableReference symbol = (VariableReference) binaryExp
						.getLeft();
				methodDeclaration.setName(symbol.getName());
			}

		}

		if (expression instanceof LoadLibraryExpression) {
			LoadLibraryExpression lib = (LoadLibraryExpression) expression;
			ISourceElementRequestor.FieldInfo info = new ISourceElementRequestor.FieldInfo();
			info.name = lib.getLoadLibrary();
			info.nameSourceEnd = lib.librarySourceEnd();
			info.nameSourceStart = lib.sourceStart();
			this.fRequestor.enterField(info);
			this.fRequestor.exitField(lib.sourceEnd());
		}

		return super.visit(expression);
	}

	@Override
	public boolean visit(Statement statement) throws Exception {
		return super.visit(statement);
	}

	@Override
	public boolean visit(ModuleDeclaration declaration) throws Exception {
		return super.visit(declaration);
	}
}
