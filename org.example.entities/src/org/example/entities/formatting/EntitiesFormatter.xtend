/*
 * generated by Xtext
 */
package org.example.entities.formatting

import org.eclipse.xtext.formatting.impl.AbstractDeclarativeFormatter
import org.eclipse.xtext.formatting.impl.FormattingConfig
import com.google.inject.Inject
import org.example.entities.services.EntitiesGrammarAccess

/**
 * This class contains custom formatting description.
 * 
 * see : http://www.eclipse.org/Xtext/documentation/latest/xtext.html#formatting
 * on how and when to use it 
 * 
 * Also see {@link org.eclipse.xtext.xtext.XtextFormattingTokenSerializer} as an example
 */
class EntitiesFormatter extends AbstractDeclarativeFormatter {

	@Inject EntitiesGrammarAccess g
	
	override protected void configureFormatting(FormattingConfig c) {
        // formatting for entities
        val e = g.getEntityAccess()
        // indentation between { }
        c.setIndentation(e.getLeftCurlyBracketKeyword_3(),
                e.getRightCurlyBracketKeyword_5())
        // newline after {
        c.setLinewrap().after(e.getLeftCurlyBracketKeyword_3())
        // two newlines after }        
        c.setLinewrap(2).after(e.getRightCurlyBracketKeyword_5())
        
        // formatting for attributes
        val a = g.getAttributeAccess()
        // newline after ;
        c.setLinewrap(1).after(a.getSemicolonKeyword_2())
        // remove possible spaces before the ;
        c.setNoSpace().before(a.getSemicolonKeyword_2())

        // It's usually a good idea to activate the following three statements.
        // They will add and preserve newlines around comments
        c.setLinewrap(0, 1, 2).before(g.getSL_COMMENTRule())
        c.setLinewrap(0, 1, 2).before(g.getML_COMMENTRule())
        c.setLinewrap(0, 1, 1).after(g.getML_COMMENTRule())
	}
}
