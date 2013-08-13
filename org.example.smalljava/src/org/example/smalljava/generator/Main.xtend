/*
 * generated by Xtext
 */
package org.example.smalljava.generator

import com.google.inject.Inject
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.util.CancelIndicator
import org.eclipse.xtext.validation.CheckMode
import org.eclipse.xtext.validation.IResourceValidator
import org.example.smalljava.SmallJavaStandaloneSetupGenerated
import org.example.smalljava.lib.SmallJavaLib

class Main {
	
	def static main(String[] args) {
		if (args.empty) {
			System::err.println('Aborting: no SmallJava resource provided!')
			return
		}
		val injector = new SmallJavaStandaloneSetupGenerated().createInjectorAndDoEMFRegistration
		val main = injector.getInstance(typeof(Main))
		main.runGenerator(args)
	}
	
	@Inject IResourceValidator validator
	
	@Inject SmallJavaLib smallJavaLib

	def protected runGenerator(String[] strings) {
		// load the library
		val set = smallJavaLib.loadLib
		// load the resources
		strings.forEach[
			s | set.getResource(URI::createURI(s), true)
		]
		
		// validate the resources
		var ok = true
		for (resource : set.resources) {
			System::out.println("Checking " + resource.URI + "...")
			val issues = validator.
				validate(resource, CheckMode::ALL, CancelIndicator::NullImpl)
			if (!issues.isEmpty()) {
				for (issue : issues) {
					System::err.println(issue)
				}
				ok = false
			}
		}
		
		if (ok)
			System::out.println('Programs well-typed.')
	}
}
