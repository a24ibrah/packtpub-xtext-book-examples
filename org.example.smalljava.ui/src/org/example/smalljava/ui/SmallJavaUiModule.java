/*
 * generated by Xtext
 */
package org.example.smalljava.ui;

import org.eclipse.ui.plugin.AbstractUIPlugin;

/**
 * Use this class to register components to be used within the IDE.
 */
public class SmallJavaUiModule extends org.example.smalljava.ui.AbstractSmallJavaUiModule {
	public SmallJavaUiModule(AbstractUIPlugin plugin) {
		super(plugin);
	}
	
	@Override
	public Class<? extends org.eclipse.xtext.ui.wizard.IProjectCreator> bindIProjectCreator() {
		return org.example.smalljava.ui.wizard.SmallJavaProjectCreatorCustom.class;
	}
}
