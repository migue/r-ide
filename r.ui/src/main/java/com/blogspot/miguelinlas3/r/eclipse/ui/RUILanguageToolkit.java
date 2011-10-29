/**
 * 
 */
package com.blogspot.miguelinlas3.r.eclipse.ui;

import org.eclipse.dltk.core.IDLTKLanguageToolkit;
import org.eclipse.dltk.core.IModelElement;
import org.eclipse.dltk.ui.AbstractDLTKUILanguageToolkit;
import org.eclipse.dltk.ui.ScriptElementLabels;
import org.eclipse.dltk.ui.text.ScriptTextTools;
import org.eclipse.jface.preference.IPreferenceStore;

import com.blogspot.miguelinlas3.r.eclipse.language.RLanguageToolkit;
import com.blogspot.miguelinlas3.r.eclipse.ui.editor.partitions.IRPartitions;

/**
 * @author Administrador
 * 
 */
public class RUILanguageToolkit extends AbstractDLTKUILanguageToolkit {

	private static class RScriptElementLabels extends ScriptElementLabels {
		public void getElementLabel(IModelElement element, long flags,
				StringBuffer buf) {
			StringBuffer buffer = new StringBuffer(60);
			super.getElementLabel(element, flags, buffer);
			String s = buffer.toString();
			if (s != null && !s.startsWith(element.getElementName())) {
				if (s.indexOf('$') != -1) {
					s = s.replaceAll("\\$", ".");
				}
			}
			buf.append(s);
		}

		protected char getTypeDelimiter() {
			return '$';
		}
	};

	@Override
	public ScriptElementLabels getScriptElementLabels() {
		return new RScriptElementLabels();
	}

	public IDLTKLanguageToolkit getCoreToolkit() {
		return RLanguageToolkit.getDefault();
	}

	public IPreferenceStore getPreferenceStore() {
		return RUIPlugin.getDefault().getPreferenceStore();
	}

	@Override
	public ScriptTextTools getTextTools() {
		return RUIPlugin.getDefault().getTextTools();
	}

	@Override
	public String getPartitioningId() {
		return IRPartitions.R_PARTITIONING;
	}
}
