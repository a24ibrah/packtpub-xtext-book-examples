/*
* generated by Xtext
*/
package org.example.xbase.entities;

import org.eclipse.xtext.junit4.IInjectorProvider;

import com.google.inject.Injector;

public class EntitiesUiInjectorProvider implements IInjectorProvider {
	
	public Injector getInjector() {
		return org.example.xbase.entities.ui.internal.EntitiesActivator.getInstance().getInjector("org.example.xbase.entities.Entities");
	}
	
}