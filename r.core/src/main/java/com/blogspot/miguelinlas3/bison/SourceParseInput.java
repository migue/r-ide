package com.blogspot.miguelinlas3.bison;

public abstract class SourceParseInput {

	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public final static int EOF = -1;

	protected char[] fBuffer = new char[0];
	protected int fBufferLength = 0;
	private int fIndexInBuffer = 0;
	private int fIndex;
	private int fStop;

	protected SourceParseInput() {
		fIndex = -1;
		fStop = -1;
	}

	public void init() {
		fIndex = 0;
		fStop = -1;
		fIndexInBuffer = 0;
		fBufferLength = 0;
		updateBuffer();
	}

	public void init(final int start, final int stop) {
		fIndex = start;
		fStop = stop;
		fIndexInBuffer = 0;
		fBufferLength = 0;
		updateBuffer();
	}

	public final int getIndex() {
		return fIndex;
	}

	public final int getStopIndex() {
		return fStop;
	}

	public final int get(final int num) {
		int idx = fIndexInBuffer + num - 1;
		if (idx < fBufferLength) {
			return fBuffer[idx];
		}
		updateBuffer();
		idx = fIndexInBuffer + num - 1;
		if (idx < fBufferLength) {
			return fBuffer[idx];
		}
		return EOF;
	}

	public final boolean subequals(final int num, final char c1) {
		return (fBuffer[fIndexInBuffer + num - 1] == c1);
	}

	public final boolean subequals(final int num, final char c1, final char c2) {
		int idx = fIndexInBuffer + num - 1;
		return (fBuffer[idx] == c1 && fBuffer[++idx] == c2);
	}

	public final boolean subequals(final int num, final char c1, final char c2,
			final char c3) {
		int idx = fIndexInBuffer + num - 1;
		return (fBuffer[idx] == c1 && fBuffer[++idx] == c2 && fBuffer[++idx] == c3);
	}

	public final boolean subequals(final int num, final char[] sequence,
			int start) {
		final int length = sequence.length;
		for (int idx = fIndexInBuffer + num - 1; start < length;) {
			if (fBuffer[idx++] != sequence[start++]) {
				return false;
			}
		}
		return true;
	}

	public final String substring(final int num, final int length) {
		return new String(fBuffer, fIndexInBuffer + num - 1, length);
	}

	public final void consume(final int num) {
		fIndex += num;
		fIndexInBuffer += num;
	}

	protected abstract void updateBuffer();

	protected void setBuffer(final char[] buffer, final int length,
			final int indexPosition) {
		fIndexInBuffer = indexPosition;
		fBuffer = buffer;
		final int stopInBuffer = fIndexInBuffer + fStop - fIndex;
		fBufferLength = (fStop > 0 && stopInBuffer < length) ? stopInBuffer
				: length;
	}

}
