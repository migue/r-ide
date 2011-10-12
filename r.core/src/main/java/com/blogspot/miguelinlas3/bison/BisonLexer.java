package com.blogspot.miguelinlas3.bison;

import java.io.IOException;

import org.eclipse.core.resources.IMarker;
import org.eclipse.dltk.ast.ASTNode;
import org.eclipse.dltk.compiler.problem.DefaultProblem;
import org.eclipse.dltk.compiler.problem.IProblem;
import org.eclipse.dltk.compiler.problem.IProblemReporter;
import org.eclipse.dltk.compiler.problem.ProblemSeverities;

import com.blogspot.miguelinlas3.bison.RBisonParser.Location;

/**
 * 
 */
public final class BisonLexer extends RScannerLexer implements
		RBisonParser.Lexer {

	protected IProblemReporter errorReporter;

	public IProblemReporter getErrorReporter() {
		return errorReporter;
	}

	public void setErrorReporter(IProblemReporter errorReporter) {
		this.errorReporter = errorReporter;
	}

	private final IStringCache fStringCache;

	/**
	 * Numero de linea en el archivo
	 */
	protected int currentLine;

	/**
	 * Posicion en la linea actual
	 */
	// protected int startPos;
	// protected int endPos;

	public BisonLexer(final SourceParseInput input, final IStringCache cache) {
		super(input);
		fStringCache = cache;
	}

	public BisonLexer(BufferedDocumentInput input,
			FixInterningStringCache fixInterningStringCache,
			IProblemReporter problemReporter) {
		this(input, fixInterningStringCache);
		this.errorReporter = problemReporter;
	}

	@Override
	protected void reset(final SourceParseInput input) {
		super.reset(input);
	}

	@Override
	protected void createNumberToken(final RTerminal type, final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = fInput.substring(1, fNextNum);
		fNextToken.status = status;

		RBisonParser.SKIP_NEW_LINE = false;
	}

	@Override
	protected void createSymbolToken() {
		fNextToken.type = RTerminal.SYMBOL;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = fInput.substring(1, fNextNum);
		if (fStringCache != null && fNextToken.text.length() <= 20) {
			fNextToken.text = fStringCache.get(fNextToken.text);
		}
		fNextToken.status = IRSourceConstants.STATUS_OK;
		RBisonParser.SKIP_NEW_LINE = false;
	}

	@Override
	protected void createQuotedSymbolToken(final RTerminal type,
			final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = ((status & IRSourceConstants.STATUS_MASK_12) != IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED) ? fInput
				.substring(2, fNextNum - 2)
				: fInput.substring(2, fNextNum - 1);
		if (fStringCache != null && fNextToken.text.length() <= 20) {
			fNextToken.text = fStringCache.get(fNextToken.text);
		}
		fNextToken.status = status;

		RBisonParser.SKIP_NEW_LINE = false;
	}

	@Override
	protected void createStringToken(final RTerminal type, final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = ((status & IRSourceConstants.STATUS_MASK_12) != IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED) ? fInput
				.substring(2, fNextNum - 2)
				: fInput.substring(2, fNextNum - 1);
		fNextToken.status = status;

		RBisonParser.SKIP_NEW_LINE = false;
	}

	@Override
	protected void createSpecialToken(final int status) {
		fNextToken.type = RTerminal.SPECIAL;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = ((status & IRSourceConstants.STATUS_MASK_12) != IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED) ? fInput
				.substring(2, fNextNum - 2)
				: fInput.substring(2, fNextNum - 1);
		if (fStringCache != null && fNextToken.text.length() <= 3) {
			fNextToken.text = fStringCache.get(fNextToken.text);
		}
		fNextToken.status = status;
	}

	public ASTNode getLVal() {
		ScannerToken token = this.getToken();
		return new ScannerToken(token);
	}

	@Override
	protected void handleNewLine() {

		// / XXX REVISAR ESTO!!!
		// if (!RLexer.MANAGE_PARENTHESIS_CONSTRUCTION.isEmpty()
		// /*&& RBisonParser.SKIP_NEW_LINE*/) {
		// this.fNextToken.type = null;
		// } else

		if (RBisonParser.SKIP_NEW_LINE) {
			this.fNextToken.type = null;
		}

		++this.currentLine;
	}

	public void yyerror(String s) {
		// TODO Auto-generated method stub

	}

	public int yylex() throws IOException {
		// avanzamos
		this.nextToken();

		// retornamos el siguiente token
		return this.getToken().getType().getToken();
	}

	public Position getEndPos() {
		Position pos = new Position();

		pos.setFirstColumn(this.fNextIndex);
		pos.setLastColumn(this.fNextNum + this.fNextIndex);
		pos.setFirstLine(this.currentLine);
		// pos.setLastLine();

		return pos;
	}

	public Position getStartPos() {
		Position pos = new Position();

		pos.setFirstColumn(this.fNextIndex);
		pos.setLastColumn(this.fNextNum + this.fNextIndex);
		pos.setFirstLine(this.currentLine);
		// pos.setLastLine();

		return pos;
	}

	public void yyerror(Location loc, String s) {

		DefaultProblem problem = new DefaultProblem(this.fInput.getFileName(),
				s, 0, new String[] {}, ProblemSeverities.Error, loc.begin
						.getFirstColumn(), loc.end.getLastColumn(), loc.begin
						.getFirstLine());
		if (this.errorReporter != null)
			this.errorReporter.reportProblem(problem);
	}
}
