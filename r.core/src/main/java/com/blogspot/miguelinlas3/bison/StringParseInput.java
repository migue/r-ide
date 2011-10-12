package com.blogspot.miguelinlas3.bison;

public class StringParseInput extends SourceParseInput implements CharSequence {

	private final char[] fStringContent;

	public StringParseInput(final String content) {
		fStringContent = content.toCharArray();
	}

	@Override
	protected void updateBuffer() {
		setBuffer(fStringContent, fStringContent.length, getIndex());
	}

	public int length() {
		return fBufferLength;
	}

	public char charAt(final int index) {
		return fBuffer[index];
	}

	public CharSequence subSequence(final int start, final int end) {
		return new String(fBuffer, start, end - start);
	}

	@Override
	public String toString() {
		return new String(fBuffer);
	}

}
