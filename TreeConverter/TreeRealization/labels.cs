//����� ssyy
//��������� ����� � ��������.

using System;
using System.Collections.Generic;

namespace PascalABCCompiler.TreeRealization
{
    //(ssyy) ������������� ���� ����, ����� ��� �����.
    public class code_block
    {
        private code_block _up_block;

        public code_block up_block
        {
            get
            {
                return _up_block;
            }
        }

        public code_block(code_block comprehensive_block)
        {
            _up_block = comprehensive_block;
        }
    }

    public class label_node : definition_node, SemanticTree.ILabelNode
    {
        //��� �����
        private string _name;

        //������������ � ���������
        private location _loc;

        //����������, ����������� �� ����� � ����
        private bool _is_defined = false;

        //goto �� ������ �����
        private List<goto_statement> _goto_statements = new List<goto_statement>();

        public List<goto_statement> goto_statements
        {
            get { return _goto_statements; }
            //set { _goto_statements = value; }
        }

        //���� ����, � ������� ��������� �����
        private code_block _comprehensive_code_block = null;

        public code_block comprehensive_code_block
        {
            get
            {
                return _comprehensive_code_block;
            }
            set
            {
                _comprehensive_code_block = value;
            }
        }

        //��������� �� �������� �� �����
        //private bool _goto_blocked = false;

        //public bool goto_blocked
        //{
        //    get { return _goto_blocked; }
        //    set { _goto_blocked = value; }
        //}

        public label_node(string v_name, location v_location)
        {
            _name = v_name;
            _loc = v_location;
        }

        public string name
        {
            get
            {
                return _name;
            }
        }

        public override void visit(SemanticTree.ISemanticVisitor visitor)
        {
            visitor.visit((SemanticTree.ILabelNode)this);
        }

        public SemanticTree.ILocation Location
        {
            get
            {
                return _loc;
            }
        }

        public location loc
        {
            get
            {
                return _loc;
            }
        }

        /// <summary>
        /// ��� ����.
        /// </summary>
        public override semantic_node_type semantic_node_type
        {
            get
            {
                return semantic_node_type.label;
            }
        }

        /// <summary>
        /// ���������� ��� ����.
        /// </summary>
        public override general_node_type general_node_type
        {
            get
            {
                return general_node_type.label;
            }
        }

        public bool is_defined
        {
            get
            {
                return _is_defined;
            }
            set
            {
                _is_defined = value;
            }
        }
    }

    public class labeled_statement : statement_node, SemanticTree.ILabeledStatementNode
    {
        private label_node _label;

        private statement_node _statement;

        public label_node label
        {
            get
            {
                return _label;
            }
        }

        public statement_node statement
        {
            get
            {
                return _statement;
            }
        }

        SemanticTree.ILabelNode SemanticTree.ILabeledStatementNode.label
        {
            get
            {
                return _label;
            }
        }

        SemanticTree.IStatementNode SemanticTree.ILabeledStatementNode.statement
        {
            get
            {
                return _statement;
            }
        }

        public labeled_statement(label_node v_label, statement_node v_statement, location v_location)
            : base(v_location)
        {
            _label = v_label;
            _statement = v_statement;
        }

        /// <summary>
        /// ��� ����.
        /// </summary>
        public override semantic_node_type semantic_node_type
        {
            get
            {
                return semantic_node_type.labeled_statement;
            }
        }

        public override void visit(SemanticTree.ISemanticVisitor visitor)
        {
            visitor.visit((SemanticTree.ILabeledStatementNode)this);
        }
    }

    public class goto_statement : statement_node, SemanticTree.IGotoStatementNode
    {
        private label_node _label;

        private code_block _comprehensive_code_block = null;

        public code_block comprehensive_code_block
        {
            get { return _comprehensive_code_block; }
            set { _comprehensive_code_block = value; }
        }

        SemanticTree.ILabelNode SemanticTree.IGotoStatementNode.label
        {
            get
            {
                return _label;
            }
        }

        public label_node label
        {
            get
            {
                return _label;
            }
        }

        /// <summary>
        /// ��� ����.
        /// </summary>
        public override semantic_node_type semantic_node_type
        {
            get
            {
                return semantic_node_type.goto_statement;
            }
        }

        public override void visit(SemanticTree.ISemanticVisitor visitor)
        {
            visitor.visit((SemanticTree.IGotoStatementNode)this);
        }

        public goto_statement(label_node v_label, location v_location)
            :base(v_location)
        {
            _label = v_label;
        }
    }
}