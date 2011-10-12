package com.blogspot.miguelinlas3.bison;

public class RScannerLexer extends RLexer {

	protected final ScannerToken fNextToken;

	public RScannerLexer(final SourceParseInput input) {
		super(input);
		fNextToken = new ScannerToken();
	}

	public ScannerToken getToken() {
		return fNextToken;
	}

	public void nextToken() {
		do {
			searchNext();
		} while (fNextToken.type == null);
	}

	@Override
	protected void createFix(final RTerminal type) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = IRSourceConstants.STATUS_OK;
	}

	@Override
	protected void createSpecialToken(final int status) {
		fNextToken.type = RTerminal.SPECIAL;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = status;
	}

	@Override
	protected void createSymbolToken() {
		fNextToken.type = RTerminal.SYMBOL;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = IRSourceConstants.STATUS_OK;
	}

	@Override
	protected void createQuotedSymbolToken(final RTerminal type,
			final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = status;
	}

	@Override
	protected void createStringToken(final RTerminal type, final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = status;
	}

	@Override
	protected void createNumberToken(final RTerminal type, final int status) {
		fNextToken.type = type;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = status;
		RBisonParser.SKIP_NEW_LINE = false;
	}

	@Override
	protected void createWhitespaceToken() {
		fNextToken.type = null;
	}

	@Override
	protected void createCommentToken() {
		// / XXX De momento los comentarios no se pasan
		fNextToken.type = RTerminal.COMMENT;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = null;
		fNextToken.status = IRSourceConstants.STATUS_OK;
	}

	@Override
	protected void createLinebreakToken(final String text) {

		// if (!RLexer.MANAGE_PARENTHESIS_CONSTRUCTION.isEmpty()
		// /* && RBisonParser.SKIP_NEW_LINE */) {
		// this.fNextToken.type = null;
		// } else
		// / XXX REVISAR ESTO!!!
		if (RBisonParser.SKIP_NEW_LINE) {
			this.fNextToken.type = null;
		} else
			this.fNextToken.type = RTerminal.LINEBREAK;

		// this.fNextToken.type = (RBisonParser.SKIP_NEW_LINE ||
		// !RLexer.MANAGE_PARENTHESIS_CONSTRUCTION
		// .isEmpty()) ? null : ;

		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = text;
		fNextToken.status = IRSourceConstants.STATUS_OK;
	}

	@Override
	protected void createUnknownToken(final String text) {
		fNextToken.type = RTerminal.UNKNOWN;
		fNextToken.offset = fNextIndex;
		fNextToken.length = fNextNum;
		fNextToken.text = text;
		fNextToken.status = IRSourceConstants.STATUS_OK;
	}

}
