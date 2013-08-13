/*
* generated by Xtext
*/
package org.example.xbase.expressions.parser.antlr;

import com.google.inject.Inject;

import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.example.xbase.expressions.services.ExpressionsGrammarAccess;

public class ExpressionsParser extends org.eclipse.xtext.parser.antlr.AbstractAntlrParser {
	
	@Inject
	private ExpressionsGrammarAccess grammarAccess;
	
	@Override
	protected void setInitialHiddenTokens(XtextTokenStream tokenStream) {
		tokenStream.setInitialHiddenTokens("RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT");
	}
	
	@Override
	protected org.example.xbase.expressions.parser.antlr.internal.InternalExpressionsParser createParser(XtextTokenStream stream) {
		return new org.example.xbase.expressions.parser.antlr.internal.InternalExpressionsParser(stream, getGrammarAccess());
	}
	
	@Override 
	protected String getDefaultRuleName() {
		return "ExpressionsModel";
	}
	
	public ExpressionsGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(ExpressionsGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
	
}
