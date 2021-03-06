package org.example.xbase.entities.jvmmodel

import com.google.inject.Inject
import org.eclipse.xtext.xbase.jvmmodel.AbstractModelInferrer
import org.eclipse.xtext.xbase.jvmmodel.IJvmDeclaredTypeAcceptor
import org.eclipse.xtext.xbase.jvmmodel.JvmTypesBuilder
import org.example.xbase.entities.entities.Entity

/**
 * <p>Infers a JVM model from the source model.</p> 
 *
 * <p>The JVM model should contain all elements that would appear in the Java code 
 * which is generated from the source model. Other models link against the JVM model rather than the source model.</p>     
 */
class EntitiesJvmModelInferrer extends AbstractModelInferrer {

	@Inject extension JvmTypesBuilder

	/**
	 * The dispatch method {@code infer} is called for each instance of the
	 * given element's type that is contained in a resource.
	 * 
	 * @param element
	 *            the model to create one or more
	 *            {@link org.eclipse.xtext.common.types.JvmDeclaredType declared
	 *            types} from.
	 * @param acceptor
	 *            each created
	 *            {@link org.eclipse.xtext.common.types.JvmDeclaredType type}
	 *            without a container should be passed to the acceptor in order
	 *            get attached to the current resource. The acceptor's
	 *            {@link IJvmDeclaredTypeAcceptor#accept(org.eclipse.xtext.common.types.JvmDeclaredType)
	 *            accept(..)} method takes the constructed empty type for the
	 *            pre-indexing phase. This one is further initialized in the
	 *            indexing phase using the closure you pass to the returned
	 *            {@link org.eclipse.xtext.xbase.jvmmodel.IJvmDeclaredTypeAcceptor.IPostIndexingInitializing#initializeLater(org.eclipse.xtext.xbase.lib.Procedures.Procedure1)
	 *            initializeLater(..)}.
	 * @param isPreIndexingPhase
	 *            whether the method is called in a pre-indexing phase, i.e.
	 *            when the global index is not yet fully updated. You must not
	 *            rely on linking using the index if isPreIndexingPhase is
	 *            <code>true</code>.
	 */
   	def dispatch void infer(Entity entity, IJvmDeclaredTypeAcceptor acceptor, boolean isPreIndexingPhase) {
   		acceptor.accept(entity.toClass("entities."+entity.name)) [
   			documentation = entity.documentation
   			if (entity.superType != null)
				superTypes += entity.superType.cloneWithProxies
			entity.attributes.forEach[
				a | 
				val type = a.type ?: a.initexpression?.inferredType
				members += a.toField(a.name, type) [
					documentation = a.documentation
					if (a.initexpression != null)
						initializer = a.initexpression
				]
				members += a.toGetter(a.name, type)
				members += a.toSetter(a.name, type)
			]
			entity.operations.forEach[
				op |
				members += op.toMethod(op.name, op.type ?: inferredType) [
					documentation = op.documentation
					for (p : op.params) {
						parameters += p.toParameter(p.name, p.parameterType)
					}
					body = op.body
				]
			]
			members += entity.toMethod("toString", typeRef(String)) [
				body = [
					append(
					'''
					return
					"entity «entity.name» {\n" +
						«FOR a : entity.attributes»
						"\t«a.name» = " + «a.name».toString() + "\n" +
						«ENDFOR»
					"}";'''
					)
				]
			]
   		]
   	}
}

