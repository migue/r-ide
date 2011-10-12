package com.blogspot.miguelinlas3.bison;

public class FixInterningStringCache implements IStringCache {

	private static final int HASHSET_MAX = 0x1ff;

	private static final int CHARTABLE_SIZE = 127;
	private static final String[] CHARTABLE;
	static {
		CHARTABLE = new String[CHARTABLE_SIZE];
		for (int i = 0; i < CHARTABLE_SIZE; i++) {
			CHARTABLE[i] = String.valueOf((char) i).intern();
		}
	}

	private final String[] fValues;

	public FixInterningStringCache() {
		fValues = new String[HASHSET_MAX + 1];
	}

	public String get(final String s) {
		switch (s.length()) {
		case 0:
			return ""; //$NON-NLS-1$
		case 1:
			final int c = s.charAt(0);
			if (c >= 0 && c < CHARTABLE_SIZE) {
				return CHARTABLE[c];
			}

			return getChar(s);

		default:
			return getDefault(s);
		}
	}

	private String getChar(final String s) {
		final int hashCode = s.hashCode();
		final int i1 = ((hashCode - CHARTABLE_SIZE) & HASHSET_MAX);
		final String s1 = fValues[i1];
		if (s1 != null && s1.hashCode() == hashCode && s1.equals(s)) {
			// fStatFound++;
			return s1;
		}
		return (fValues[i1] = s.intern());
	}

	private String getDefault(final String s) {
		final int hashCode = s.hashCode();
		final int i1 = (hashCode & HASHSET_MAX);
		final String s1 = fValues[i1];
		if (s1 != null && s1.hashCode() == hashCode && s1.equals(s)) {
			// fStatFound++;
			return s1;
		}
		// fStatSet++;
		return (fValues[i1] = s.intern());
	}

}
