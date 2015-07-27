using System;
using System.Collections.Generic;


namespace PascalABCCompiler.SyntaxTree
{

    //��� �������� ������������� ��������:
    //1. ������� ��������� ����� ������, ��������� � OnEnter � OnLeave ����������� ��������� ����
    //� ��������� �����. ������� ������� ������ � ��� ������� ���� ������� ��� �����������.
    //
    //2. ������������ �� ����� ������ ���� �����, � ������� �������������� ��������� ������ �����.
    //�� �������� ��� ���� � ������ visit'�� ��� �������� (��� base.visit), ���� ��� �����.

	public delegate void VisitorDelegateNew(syntax_tree_node node);

    public class WalkingVisitorNew : AbstractVisitor
    {

		protected VisitorDelegateNew OnEnter;
        protected VisitorDelegateNew OnLeave;

        protected bool visitNode = true; // � OnEnter ����� ������� false

        public virtual void ProcessNode(syntax_tree_node Node)
        {
            if (Node != null)
            {
                if (OnEnter != null)
                    OnEnter(Node);

                if (visitNode)
                    Node.visit(this);
                else visitNode = true;

                if (OnLeave != null)
                    OnLeave(Node);
            }
        }

        public override void DefaultVisit(syntax_tree_node n)
        {
            var count = n.subnodes_count;
            for (var i = 0; i < count; i++)
                ProcessNode(n[i]);
        }
    }
 
}