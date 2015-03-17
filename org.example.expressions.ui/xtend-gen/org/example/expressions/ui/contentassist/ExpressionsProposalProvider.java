/**
 * generated by Xtext
 */
package org.example.expressions.ui.contentassist;

import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.jface.text.contentassist.ICompletionProposal;
import org.eclipse.xtext.Assignment;
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext;
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.example.expressions.expressions.AbstractElement;
import org.example.expressions.expressions.Variable;
import org.example.expressions.typing.ExpressionsModelUtil;
import org.example.expressions.ui.contentassist.AbstractExpressionsProposalProvider;

/**
 * see http://www.eclipse.org/Xtext/documentation/latest/xtext.html#contentAssist on how to customize content assistant
 */
@SuppressWarnings("all")
public class ExpressionsProposalProvider extends AbstractExpressionsProposalProvider {
  @Override
  public void completeAtomic_Variable(final EObject elem, final Assignment assignment, final ContentAssistContext context, final ICompletionProposalAcceptor acceptor) {
    if ((!(elem instanceof AbstractElement))) {
      return;
    }
    List<Variable> _variablesDefinedBefore = ExpressionsModelUtil.variablesDefinedBefore(((AbstractElement) elem));
    final Procedure1<Variable> _function = new Procedure1<Variable>() {
      @Override
      public void apply(final Variable variable) {
        String _name = variable.getName();
        String _name_1 = variable.getName();
        String _plus = (_name_1 + " - Variable");
        ICompletionProposal _createCompletionProposal = ExpressionsProposalProvider.this.createCompletionProposal(_name, _plus, null, context);
        acceptor.accept(_createCompletionProposal);
      }
    };
    IterableExtensions.<Variable>forEach(_variablesDefinedBefore, _function);
  }
}
