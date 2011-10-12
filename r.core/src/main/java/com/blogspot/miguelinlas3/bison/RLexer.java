package com.blogspot.miguelinlas3.bison;

import java.util.Stack;

public abstract class RLexer {

	/**
	 * Contexto
	 */

	protected static final Stack<String> MANAGE_PARENTHESIS_CONSTRUCTION = new Stack<String>();
	// protected static boolean MANAGE_PARENTHESIS_CONSTRUCTION = false;

	protected static boolean MANAGE_IF_CONSTRUCTION = false;

	private final static char[] C_FALSE = RTerminal.S_FALSE.toCharArray();
	private final static char[] C_NA_real_ = RTerminal.S_NA_REAL.toCharArray();
	private final static char[] C_NA_integer_ = RTerminal.S_NA_INT
			.toCharArray();
	private final static char[] C_NA_complex_ = RTerminal.S_NA_CPLX
			.toCharArray();
	private final static char[] C_NA_character_ = RTerminal.S_NA_CHAR
			.toCharArray();
	private final static char[] C_break = RTerminal.S_BREAK.toCharArray();
	private final static char[] C_function = RTerminal.S_FUNCTION.toCharArray();
	private final static char[] C_library = RTerminal.S_LIBRARY.toCharArray();
	private final static char[] C_repeat = RTerminal.S_REPEAT.toCharArray();
	private final static char[] C_while = RTerminal.S_WHILE.toCharArray();

	protected SourceParseInput fInput;

	protected int fNextIndex;
	protected int fNextNum;
	private int fUnknownState = -1;
	private StringBuilder fUnknownString = new StringBuilder();

	public RLexer(final SourceParseInput input) {
		reset(input);
	}

	protected void reset(final SourceParseInput input) {
		fInput = input;
		fNextIndex = 0;
		fNextNum = 0;
		fUnknownState = -1;
	}

	public void setFull() {
		fInput.init();
		reset(fInput);
	}

	public void setRange(final int offset, final int length) {
		fInput.init(offset, offset + length);
		reset(fInput);
	}

	protected final void searchNext() {
		fInput.consume(fNextNum);
		fNextIndex = fInput.getIndex();
		fNextNum = 1;
		final int c1 = fInput.get(1);

		searchNext1(c1);
	}

	protected void searchNext1(final int c1) {
		switch (c1) { // switch para asciis
		case SourceParseInput.EOF:
			createFix(RTerminal.EOF);
			return;
		case '\r':
			if (fInput.get(2) == '\n') {
				fNextNum++;
				handleNewLine();
				createLinebreakToken("\r\n"); //$NON-NLS-1$
				return;
			}
			handleNewLine();
			createLinebreakToken("\r"); //$NON-NLS-1$
			return;
		case '\n':
		case '\f':
			handleNewLine();
			createLinebreakToken("\n"); //$NON-NLS-1$
			return;
		case ' ':
		case '\t':
			consumeWhitespace();
			return;
		case '!':
			if (fInput.get(2) == '=') {
				fNextNum++;
				createFix(RTerminal.REL_NE);
				return;
			}
			createFix(RTerminal.NOT);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '\"':
			consumeStringDoubleQuote();
			return;
		case '#':
			consumeComment();
			return;
		case '$':
			createFix(RTerminal.SUB_NAMED_PART);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '%':
			consumeSpecial();
			return;
		case '&':
			if (fInput.get(2) == '&') {
				fNextNum++;
				createFix(RTerminal.AND_D);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createFix(RTerminal.AND);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '\'':
			consumeStringSingleQuote();
			return;
		case '(':
			createFix(RTerminal.GROUP_OPEN);
			RBisonParser.SKIP_NEW_LINE = true;
			RLexer.MANAGE_PARENTHESIS_CONSTRUCTION.push("(");
			return;
		case ')':
			createFix(RTerminal.GROUP_CLOSE);
			RBisonParser.SKIP_NEW_LINE = false;
			RLexer.MANAGE_PARENTHESIS_CONSTRUCTION.pop();
			return;
		case '*':
			createFix(RTerminal.MULT);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '+':
			createFix(RTerminal.PLUS);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case ',':
			createFix(RTerminal.COMMA);
			return;
		case '-':
			if (fInput.get(2) == '>') {
				fNextNum++;
				if (fInput.get(3) == '>') {
					fNextNum++;
					createFix(RTerminal.ARROW_RIGHT_D);
					return;
				}
				createFix(RTerminal.ARROW_RIGHT_S);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createFix(RTerminal.MINUS);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '.':
			switch (fInput.get(2)) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				fNextNum++;
				consumeNumberInFloat();
				return;
			default:
				scanIdentifier();
				createSymbolToken();
				return;
			}
		case '/':
			createFix(RTerminal.DIV);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '0':
			if (fInput.get(2) == 'x') {
				fNextNum++;
				consumeNumberInHex();
				return;
			}
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			consumeNumberInDec();
			return;
		case ':':
			if (fInput.get(2) == ':') {
				fNextNum++;
				if (fInput.get(3) == ':') {
					fNextNum++;
					createFix(RTerminal.NS_GET_INT);
					return;
				}
				createFix(RTerminal.NS_GET);
				return;
			}
			createFix(RTerminal.SEQ);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case ';':
			createFix(RTerminal.SEMI);
			return;
		case '<':
			switch (fInput.get(2)) {
			case '=':
				fNextNum++;
				createFix(RTerminal.REL_LE);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			case '-':
				fNextNum++;
				createFix(RTerminal.ARROW_LEFT_S);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			case '<':
				if (fInput.get(3) == '-') {
					fNextNum++;
					fNextNum++;
					createFix(RTerminal.ARROW_LEFT_D);
					return;
				}
			default:
				createFix(RTerminal.REL_LT);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
		case '=':
			if (fInput.get(2) == '=') {
				fNextNum++;
				createFix(RTerminal.REL_EQ);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createFix(RTerminal.EQUAL);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '>':
			if (fInput.get(2) == '=') {
				fNextNum++;
				createFix(RTerminal.REL_GE);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createFix(RTerminal.REL_LT);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '?':
			createFix(RTerminal.QUESTIONMARK);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '@':
			createFix(RTerminal.SUB_NAMED_SLOT);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '[':
			if (fInput.get(2) == '[') {
				fNextNum++;
				createFix(RTerminal.SUB_INDEXED_D_OPEN);
				return;
			}
			createFix(RTerminal.SUB_INDEXED_S_OPEN);
			return;
		case ']':
			createFix(RTerminal.SUB_INDEXED_CLOSE);
			RBisonParser.SKIP_NEW_LINE = false;
			return;
		case '^':
			createFix(RTerminal.POWER);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case 'A':
		case 'B':
		case 'C':
		case 'D':
		case 'E':
		case 'G':
		case 'H':
		case 'J':
		case 'K':
		case 'L':
		case 'M':
		case 'O':
		case 'P':
		case 'Q':
		case 'R':
		case 'S':
		case 'U':
		case 'V':
		case 'W':
		case 'X':
		case 'Y':
		case 'Z':
		case 'a':
		case 'c':
		case 'd':
		case 'g':
		case 'h':
		case 'j':
		case 'k':
		case 'm':
		case 'o':
		case 'p':
		case 'q':
		case 's':
		case 't':
		case 'u':
		case 'v':
		case 'x':
		case 'y':
		case 'z':
			scanIdentifier();
			createSymbolToken();
			return;
		case 'F':
			scanIdentifier();
			if (fNextNum == 5 && fInput.subequals(2, C_FALSE, 1)) {
				createFix(RTerminal.FALSE);
				return;
			}
			createSymbolToken();
			return;
		case 'I':
			scanIdentifier();
			if (fNextNum == 3 && fInput.subequals(2, 'n', 'f')) {
				createFix(RTerminal.INF);
				return;
			}
			createSymbolToken();
			return;
		case 'N':
			scanIdentifier();
			switch (fNextNum) {
			case 2:
				if (fInput.subequals(2, 'A')) {
					createFix(RTerminal.NA);
					return;
				}
				break;
			case 3:
				if (fInput.subequals(2, 'a', 'N')) {
					createFix(RTerminal.NAN);
					return;
				}
				break;
			case 4:
				if (fInput.subequals(2, 'U', 'L', 'L')) {
					createFix(RTerminal.NULL);
					RBisonParser.SKIP_NEW_LINE = false;
					return;
				}
				break;
			case 7:
				if (fInput.subequals(2, C_NA_real_, 1)) {
					createFix(RTerminal.NA_REAL);
					return;
				}
				break;
			case 11:
				if (fInput.subequals(2, C_NA_integer_, 1)) {
					createFix(RTerminal.NA_INT);
					return;
				}
				if (fInput.subequals(2, C_NA_complex_, 1)) {
					createFix(RTerminal.NA_CPLX);
					return;
				}
				break;
			case 13:
				if (fInput.subequals(2, C_NA_character_, 1)) {
					createFix(RTerminal.NA_CHAR);
					return;
				}
				break;
			}
			createSymbolToken();
			return;
		case 'T':
			scanIdentifier();
			if (fNextNum == 4 && fInput.subequals(2, 'R', 'U', 'E')) {
				createFix(RTerminal.TRUE);
				return;
			}
			createSymbolToken();
			return;
		case 'b':
			scanIdentifier();
			if (fNextNum == 5 && fInput.subequals(2, C_break, 1)) {
				createFix(RTerminal.BREAK);
				RBisonParser.SKIP_NEW_LINE = false;
				return;
			}
			createSymbolToken();
			return;
		case 'i':
			scanIdentifier();
			if (fNextNum == 2) {
				if (fInput.subequals(2, 'f')) {
					createFix(RTerminal.IF);
					RLexer.MANAGE_IF_CONSTRUCTION = true;
					RBisonParser.SKIP_NEW_LINE = true;
					return;
				}
				if (fInput.subequals(2, 'n')) {
					createFix(RTerminal.IN);
					RBisonParser.SKIP_NEW_LINE = true;
					return;
				}
			}
			createSymbolToken();
			return;
		case 'e':
			scanIdentifier();
			if (fNextNum == 4 && fInput.subequals(2, 'l', 's', 'e')) {
				createFix(RTerminal.ELSE);
				RLexer.MANAGE_IF_CONSTRUCTION = false;
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createSymbolToken();
			return;
		case 'n':
			scanIdentifier();
			if (fNextNum == 4 && fInput.subequals(2, 'e', 'x', 't')) {
				createFix(RTerminal.NEXT);
				RBisonParser.SKIP_NEW_LINE = false;
				return;
			}
			createSymbolToken();
			return;

		case 'l':
			scanIdentifier();
			if (this.fNextNum == 7 && this.fInput.subequals(2, C_library, 1)) {
				createFix(RTerminal.LIBRARY_IMPORT);
				return;
			}

			createSymbolToken();
			return;

		case 'f':
			scanIdentifier();
			switch (fNextNum) {
			case 3:
				if (fInput.subequals(2, 'o', 'r')) {
					createFix(RTerminal.FOR);
					RBisonParser.SKIP_NEW_LINE = true;
					return;
				}
				break;
			case 8:
				if (fInput.subequals(2, C_function, 1)) {
					createFix(RTerminal.FUNCTION);
					RBisonParser.SKIP_NEW_LINE = true;
					return;
				}
				break;
			}
			createSymbolToken();
			return;
		case 'r':
			scanIdentifier();
			if (fNextNum == 6 && fInput.subequals(2, C_repeat, 1)) {
				createFix(RTerminal.REPEAT);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createSymbolToken();
			return;
		case 'w':
			scanIdentifier();
			if (fNextNum == 5 && fInput.subequals(2, C_while, 1)) {
				createFix(RTerminal.WHILE);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createSymbolToken();
			return;
		case '{':
			createFix(RTerminal.BLOCK_OPEN);
			return;
		case '|':
			if (fInput.get(2) == '|') {
				fNextNum++;
				createFix(RTerminal.OR_D);
				RBisonParser.SKIP_NEW_LINE = true;
				return;
			}
			createFix(RTerminal.OR);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '}':
			createFix(RTerminal.BLOCK_CLOSE);
			return;
		case '~':
			createFix(RTerminal.TILDE);
			RBisonParser.SKIP_NEW_LINE = true;
			return;
		case '`':
			consumeSymbolGraveQuote();
			return;
		default:
			if (Character.isLetterOrDigit(c1)) {
				scanIdentifier();
				createSymbolToken();
				return;
			}
			break;
		}

		if (fUnknownState == 0) {
			fUnknownState = 1;
			return;
		}
		consumeUnknown();
	}

	private final void consumeUnknown() {
		final int unknownIndex = fNextIndex;
		int unknownNum = 0;
		do {
			unknownNum += fNextNum;
			fUnknownString.append(fInput.substring(1, fNextNum));

			fUnknownState = 0;
			searchNext();
		} while (fUnknownState == 1);
		fUnknownState = -1;

		fNextIndex = unknownIndex;
		fNextNum = unknownNum;
		createUnknownToken(fUnknownString.toString());

		if (fUnknownString.length() > 40 || fUnknownString.capacity() > 40) {
			fUnknownString.setLength(16);
			fUnknownString.trimToSize();
		}
		fUnknownString.setLength(0);
		fNextNum = 0;
		return;
	}

	private final void consumeWhitespace() {
		// 1 == ' ' | '\t'
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case ' ':
			case '\t':
				continue LOOP;
			default:
				fNextNum--;
				createWhitespaceToken();
				return;
			}
		}
	}

	private final void consumeComment() {
		// 1 == '#'
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case SourceParseInput.EOF:
			case '\r':
			case '\n':
				fNextNum--;
				createCommentToken();
				return;
			default:
				continue LOOP;
			}
		}
	}

	private final void consumeStringDoubleQuote() {
		// 1 == '\"'
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case '\\':
				if (fInput.get(++fNextNum) == SourceParseInput.EOF) {
					fNextNum--;
				}
				continue LOOP;
			case '\"':
				createStringToken(RTerminal.STRING_D,
						IRSourceConstants.STATUS_OK);
				return;
			case '\r':
				if (fInput.get(++fNextNum) != '\n') {
					fNextNum--;
				}
				handleNewLine();
				continue LOOP;
			case '\n':
				handleNewLine();
				continue LOOP;
			case SourceParseInput.EOF:
				fNextNum--;
				createStringToken(RTerminal.STRING_D,
						IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED);
				return;
			default:
				continue LOOP;
			}
		}
	}

	private final void consumeStringSingleQuote() {
		// 1 == '\''
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case '\\':
				if (fInput.get(++fNextNum) == SourceParseInput.EOF) {
					fNextNum--;
				}
				continue LOOP;
			case '\'':
				createStringToken(RTerminal.STRING_S,
						IRSourceConstants.STATUS_OK);
				return;
			case '\r':
				if (fInput.get(++fNextNum) != '\n') {
					fNextNum--;
				}
				handleNewLine();
				continue LOOP;
			case '\n':
				handleNewLine();
				continue LOOP;
			case SourceParseInput.EOF:
				fNextNum--;
				createStringToken(RTerminal.STRING_S,
						IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED);
				return;
			default:
				continue LOOP;
			}
		}
	}

	private final void consumeSymbolGraveQuote() {
		// 1 == '`'
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case '\\':
				if (fInput.get(++fNextNum) == SourceParseInput.EOF) {
					fNextNum--;
				}
				continue LOOP;
			case '`':
				createQuotedSymbolToken(RTerminal.SYMBOL_G,
						IRSourceConstants.STATUS_OK);
				return;
			case '\r':
				if (fInput.get(++fNextNum) != '\n') {
					fNextNum--;
				}
				handleNewLine();
				continue LOOP;
			case '\n':
				handleNewLine();
				continue LOOP;
			case SourceParseInput.EOF:
				fNextNum--;
				createQuotedSymbolToken(RTerminal.SYMBOL_G,
						IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED);
				return;
			default:
				continue LOOP;
			}
		}
	}

	private final void consumeNumberInHex() {
		// 1 == '0'; 2 == 'x'
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
			case 'A':
			case 'B':
			case 'C':
			case 'D':
			case 'E':
			case 'F':
			case 'a':
			case 'b':
			case 'c':
			case 'd':
			case 'e':
			case 'f':
				continue LOOP;
			case 'L':
				createNumberToken(RTerminal.NUM_INT,
						IRSourceConstants.STATUS_OK);
				return;
			case 'i':
				createNumberToken(RTerminal.NUM_COMPLEX,
						IRSourceConstants.STATUS_OK);
				return;
			default:
				fNextNum--;
				createNumberToken(RTerminal.NUM_NUM,
						IRSourceConstants.STATUS_OK);
				return;
			}
		}
	}

	private final void consumeNumberInDec() {
		// only dec digits
		int status = IRSourceConstants.STATUS_OK;
		LOOP: while (true) {
			final int next = fInput.get(++fNextNum);
			if (next >= '0' && next <= '9') {
				continue LOOP;
			}
			switch (next) {
			case '.':
				consumeNumberInFloat();
				return;
			case 'e':
			case 'E':
				status = scanNumberInExp();
				continue LOOP;
			case 'L':
				createNumberToken(RTerminal.NUM_INT, status);
				return;
			case 'i':
				createNumberToken(RTerminal.NUM_COMPLEX, status);
				return;
			default:
				fNextNum--;
				createNumberToken(RTerminal.NUM_NUM, status);
				return;
			}
		}
	}

	private final void consumeNumberInFloat() {
		// after .
		int status = IRSourceConstants.STATUS_OK;
		LOOP: while (true) {
			final int next = fInput.get(++fNextNum);
			if (next >= '0' && next <= '9') {
				continue LOOP;
			}
			switch (next) {
			case 'E':
			case 'e':
				status = scanNumberInExp();
				continue LOOP;
			case 'L':
				createNumberToken(RTerminal.NUM_NUM,
						status != IRSourceConstants.STATUS_OK ? status
								: IRSourceConstants.STATUS2_SYNTAX_FLOAT_WITH_L);
				return;
			case 'i':
				createNumberToken(RTerminal.NUM_COMPLEX, status);
				return;
			default:
				fNextNum--;
				createNumberToken(RTerminal.NUM_NUM, status);
				return;
			}
		}
	}

	private final int scanNumberInExp() {
		// after e // w/o i/L
		final int start = fInput.get(++fNextNum);
		START: if (start < '0' || start > '9') {
			if (start == '+' || start == '-') {
				final int start2 = fInput.get(++fNextNum);
				if (start2 >= '0' && start2 <= '9') {
					break START;
				}
			}
			fNextNum--;
			return IRSourceConstants.STATUS2_SYNTAX_FLOAT_EXP_INVALID;
		}
		LOOP: while (true) {
			final int next = fInput.get(++fNextNum);
			if (next >= '0' && next <= '9') {
				continue LOOP;
			}
			fNextNum--;
			return IRSourceConstants.STATUS_OK;
		}
	}

	private final void scanIdentifier() {
		// after legal start
		LOOP: while (true) {
			final int next = fInput.get(++fNextNum);
			if (next >= 'a' && next <= 'z') { // most frequent cases
				continue LOOP;
			}
			if (next <= 'Z'
					&& ((next >= 'A') || (next <= '9' && (next >= '0' || next == '.')))
					|| next == '_') {
				continue LOOP;
			}
			if (Character.isLetterOrDigit(next)) {
				continue LOOP;
			}
			fNextNum--;
			return;
		}
	}

	private final void consumeSpecial() {
		// after %
		LOOP: while (true) {
			switch (fInput.get(++fNextNum)) {
			case '%':
				createSpecialToken(IRSourceConstants.STATUS_OK);
				return;
			case '\n':
			case '\r':
			case SourceParseInput.EOF:
				fNextNum--;
				createSpecialToken(IRSourceConstants.STATUS2_SYNTAX_TOKEN_NOT_CLOSED);
				return;
			default:
				continue LOOP;
			}
		}
	}

	protected abstract void createFix(RTerminal type);

	protected abstract void createSpecialToken(int status);

	protected abstract void createSymbolToken();

	protected abstract void createQuotedSymbolToken(RTerminal type, int status);

	protected abstract void createStringToken(RTerminal type, int status);

	protected abstract void createNumberToken(RTerminal type, int status);

	protected abstract void createWhitespaceToken();

	protected abstract void createCommentToken();

	protected abstract void createLinebreakToken(String text);

	protected abstract void createUnknownToken(String text);

	protected void handleNewLine() {
	}

}
