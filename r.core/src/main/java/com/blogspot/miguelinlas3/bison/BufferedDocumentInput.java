package com.blogspot.miguelinlas3.bison;

import org.eclipse.jface.text.BadLocationException;
import org.eclipse.jface.text.IDocument;

public class BufferedDocumentInput extends SourceParseInput {

	private static final int BUFFER_SIZE = 1024;

	private IDocument fDocument;

	public BufferedDocumentInput() {
		setBuffer(new char[BUFFER_SIZE], 0, 0);
	}

	public BufferedDocumentInput(String fileName) {
		this();
		this.setFileName(fileName);
	}

	public void setRange(final IDocument document, final int offset,
			final int length) {
		this.fDocument = document;
		init(offset, offset + length);
	}

	@Override
	protected void updateBuffer() {
		final int start = getIndex();
		final int length = Math.min(getStopIndex() - start, BUFFER_SIZE);
		try {
			this.fDocument.get(start, length).getChars(0, length, this.fBuffer,
					0);
			setBuffer(this.fBuffer, length, 0);
		} catch (final BadLocationException e) {
			assert (false);
		}
	}

	public IDocument getDocument() {
		return this.fDocument;
	}

	public int getDocumentChar(final int offset) {
		try {
			return this.fDocument.getChar(offset);
		} catch (final BadLocationException e) {
			return -1;
		}
	}

}
