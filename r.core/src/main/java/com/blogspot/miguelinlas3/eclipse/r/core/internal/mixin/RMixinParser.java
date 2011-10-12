/**
 * 
 */
package com.blogspot.miguelinlas3.eclipse.r.core.internal.mixin;

import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.dltk.ast.declarations.ModuleDeclaration;
import org.eclipse.dltk.ast.parser.ISourceParserConstants;
import org.eclipse.dltk.core.ISourceModule;
import org.eclipse.dltk.core.SourceParserUtil;
import org.eclipse.dltk.core.mixin.IMixinParser;
import org.eclipse.dltk.core.mixin.IMixinRequestor;

import com.blogspot.miguelinlas3.eclipse.r.RCorePlugin;
import com.blogspot.miguelinlas3.eclipse.r.parser.internal.visitors.RMixinVisitor;

/**
 * @author migue
 * 
 */
public class RMixinParser implements IMixinParser {

	IMixinRequestor requestor;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.dltk.core.mixin.IMixinParser#parserSourceModule(boolean,
	 * org.eclipse.dltk.core.ISourceModule)
	 */
	@Override
	public void parserSourceModule(boolean signature, ISourceModule module) {

		ModuleDeclaration moduleDeclaration = null;
		try {
			moduleDeclaration = SourceParserUtil.getModuleDeclaration(module,
					null, ISourceParserConstants.DEFAULT);
		} catch (Exception e) {
			RCorePlugin.getDefault().getLog().log(
					new Status(IStatus.ERROR, RCorePlugin.PLUGIN_ID,
							"Error while parsing " + module));
			return;
		}
		if (moduleDeclaration == null) {
			return;
		}
		
		RMixinVisitor rMixinVisitor = new RMixinVisitor(module,
				moduleDeclaration, this.requestor);

		try {
			moduleDeclaration.traverse(rMixinVisitor);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.dltk.core.mixin.IMixinParser#setRequirestor(org.eclipse.dltk
	 * .core.mixin.IMixinRequestor)
	 */
	@Override
	public void setRequirestor(IMixinRequestor requestor) {
		this.requestor = requestor;
	}

}
