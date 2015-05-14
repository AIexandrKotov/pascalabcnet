using System;
using System.Collections.Generic;

namespace PascalABCCompiler.SemanticTree
{

	//��� �������.
	//basic-������� ������, �� ������������ � ���������, �������� ����� �������� ���� ����� �����.
	//common-������� ���, ����� � �.�., ������������ �������������.
	//compiled-���, ����� ��� ������ ����, ������������ �������������.
	public enum node_kind {basic,common,compiled,indefinite};

	//������� ������� ������. ���� ����� � ��� ����? � ��� ������� �� ��������.
	public enum type_access_level {tal_public,tal_internal};

	//��� �� ����� ������������ ��������� � ��������� ����?
	//public enum reference_or_value_type {reference_type,value_type};

	//������������ �������� - � �������, � ������, � ������������ ����.
	public enum node_location_kind {in_function_location,in_class_location,in_namespace_location, in_block_location, indefinite};

	//������� ������� � ��������� ������.
    public enum field_access_level { fal_private, fal_internal, fal_protected, fal_public };
	
	//�������, ����������� ��� ����������� ������� ������.
	public enum polymorphic_state {ps_static,ps_common,ps_virtual,ps_virtual_abstract};

    public enum type_special_kind { none_kind, not_set_kind, array_kind, enum_kind, typed_file, binary_file, short_string, array_wrapper, record, set_type, base_set_type, diap_type, text_file };
	
    public enum attribute_qualifier_kind {none_kind, return_kind, assembly_kind, param_kind, type_kind, field_kind, event_kind, property_kind, method_kind}
	//��� �������� ��������� - �� ������ ��� �� ��������.
	public enum parameter_type {value,var,cnst};

	//��� ������� �������.
	public enum basic_function_type 
	{
		none,
		iadd,isub,imul,idiv,imod, igr,ism,igreq,ismeq,ieq,inoteq, ishl,ishr,ior,inot,ixor,iand, iunmin, iinc, idec, isinc, isdec, iassign,  //signed integer (4 byte)
        uiadd, uisub, uimul, uidiv, uimod, uigr, uism, uigreq, uismeq, uieq, uinoteq, uishl, uishr, uior, uinot, uixor, uiand, uiunmin, uiinc, uidec, uisinc, uisdec, uiassign, //unsigned integer (4 byte)
        badd, bsub, bmul, bdiv, bmod, bgr, bsm, bgreq, bsmeq, beq, bnoteq, bshl, bshr, bor, bnot, bxor, band, bunmin, binc, bdec, bsinc, bsdec, bassign, //unsigned byte
        sbadd, sbsub, sbmul, sbdiv, sbmod, sbgr, sbsm, sbgreq, sbsmeq, sbeq, sbnoteq, sbshl, sbshr, sbor, sbnot, sbxor, sband, sbunmin, sbinc, sbdec, sbsinc, sbsdec, sbassign, //signed byte
		sadd,ssub,smul,sdiv,smod, sgr,ssm,sgreq,ssmeq,seq,snoteq, sshl,sshr,sor,snot,sxor,sand, sunmin, sinc, sdec, ssinc, ssdec, sassign, //short (2-byte)
        usadd, ussub, usmul, usdiv, usmod, usgr, ussm, usgreq, ussmeq, useq, usnoteq, usshl, usshr, usor, usnot, usxor, usand, usunmin, usinc, usdec, ussinc, ussdec, usassign, //unsigned short (2 byte)
        ladd,lsub,lmul,ldiv,lmod, lgr,lsm,lgreq,lsmeq,leq,lnoteq, lshl,lshr,lor,lnot,lxor,land, lunmin, linc, ldec, lsinc, lsdec, lassign, //long (8 byte)
        uladd, ulsub, ulmul, uldiv, ulmod, ulgr, ulsm, ulgreq, ulsmeq, uleq, ulnoteq, ulshl, ulshr, ulor, ulnot, ulxor, uland, ulunmin, ulinc, uldec, ulsinc, ulsdec, ulassign, //unsigned long (8 byte)
		fadd,fsub,fmul,fdiv,      fgr,fsm,fgreq,fsmeq,feq,fnoteq,                               funmin, fassign,//float
		dadd,dsub,dmul,ddiv,      dgr,dsm,dgreq,dsmeq,deq,dnoteq,                               dunmin,  dassign,//double
		boolgr,boolsm,boolgreq,boolsmeq,booleq,boolnoteq,boolor,boolnot,boolxor,booland, boolassign,  //boolean
		chargr,charsm,chargreq,charsmeq,chareq,charnoteq, cinc, cdec, csinc, csdec, charassign,  //char
		chartous,chartoi,chartoui,chartol,chartoul,chartof,chartod,    chartob,chartosb,chartos,
		btos,btous,btoi,btoui,btol,btoul,btof,btod,     btosb,btochar, //byte to ...
        sbtos,sbtoi,sbtol,sbtof,sbtod,                  sbtob,sbtous,sbtoui,sbtoul,sbtochar,//signed byte to short, int, long, float, double
		stoi,stol,stof,stod,                            stob,stosb,stous,stoui,stoul,stochar, //short to ...
        ustoi,ustoui,ustol,ustoul,ustof,ustod,          ustob,ustosb,ustos,ustochar,  //unsigned short to ...
		itol,itof,itod,                                 itob,itosb,itos,itous,itoui,itoul,itochar,     //integer to ...
        uitol,uitoul,                                   uitob,uitosb,uitos,uitous,uitoi,uitof,uitod,uitochar,    //uint to ...
		ltof,ltod,                                      ltob,ltosb,ltos,ltous,ltoi,ltoui,ltoul,ltochar,     //long to ...
                                                        ultob,ultosb,ultos,ultous,ultoi,ultoui,ultol,ultochar,ultof,ultod, //ulong to ...
		ftod,                                           ftob,ftosb,ftos,ftous,ftoi,ftoui,ftol,ftoul,ftochar, //float to ...
        dtob,dtosb,dtos,dtous,dtoi,dtoui,dtol,dtoul,dtof,   dtochar,
		objassign,objeq,objnoteq, //������������ � ��������������� �������� �� ������.
		//write,writei,writed,writec,writeb,read,readi,readd,readc,readb,expd,absd,absi //temporary functions (����� ������ �� ��������� ����� �������. ����� ����������� �������.)
        objtoobj, boolinc, booldec, boolsinc, boolsdec, booltoi, enumgr, enumgreq, enumsm, enumsmeq,
        booltob, booltosb, booltos, booltous, booltoui, booltol, booltoul
	};

    public enum runtime_statement_type { invoke_delegate, ctor_delegate, begin_invoke_delegate, end_invoke_delegate };

    public enum generic_parameter_kind { gpk_none, gpk_class, gpk_value };

	//�������� � ������� ������ ���� ����.
	public interface IDocument
	{
		//������ ���� � �����.
		string file_name
		{
			get;
		}
	}

	//�������� � ������� � ������� ������ ���� ����.
    public interface ILocation
	{
		//������, � ������� ������������� ������ ������� ��������.
		int begin_line_num
		{
			get;
		}

		//�������, � ������� ������������� ������ ������� ��������.
		int begin_column_num
		{
			get;
		}

		//������, � ������� ������������� ����� ������� ��������.
		int end_line_num
		{
			get;
		}

		//�������, � ������� ������������� ����� ������� ��������.
		int end_column_num
		{
			get;
		}

		//��������, � ������� ��������� ������ ������� ������.
		IDocument document
		{
			get;
		}
	}

	public interface ILocated
	{
		ILocation Location
		{
			 get;
		}
	}

	//������� ��������� ��� ���� ����������� ����� ������.
	public interface ISemanticNode
	{
		void visit(ISemanticVisitor visitor);
	}

	//������� �����, ��� ������������� ����������� � ��������� (����������� �����, ���������� � �.�.). ������� �� ���������.
	public interface IDefinitionNode : ISemanticNode
	{
		string Documentation
		{
			get;
		}
		IAttributeNode[] Attributes
		{
			get;
		}
	}

	//������� ��������� ��� �������, ������� ��������� ����. ������� �� ���������.
	public interface ITypeNode : IDefinitionNode
	{
		//��� ���� - �������(basic), ������� (common) ��� �������������� (compiled).
		node_kind node_kind
		{
			get;
		}

		//��� ����. ��� ������ �� �������������� � ��������� ������ ��� � ��� ����, � ����� ��� ��������.
		string name
		{
			get;
		}

		//������� ��� ��� ������� ����. ��� object-� =null.
		ITypeNode base_type
		{
			get;
		}

        bool is_value_type
        {
            get;
        }

        type_special_kind type_special_kind
        {
            get;
        }

        ITypeNode element_type
        {
            get;
        }

        //ssyy
        bool is_class
        {
            get;
        }

        bool IsInterface
        {
            get;
            //set;
        }
		
        bool IsAbstract
        {
        	get;
        }
        
        bool IsEnum
        {
        	get;
        }
        
        bool IsDelegate
        {
        	get;
        }
        
        List<ITypeNode> ImplementingInterfaces
        {
            get;
        }

        //�������� �� generic-����������
        bool is_generic_parameter
        {
            get;
        }

        bool is_generic_type_definition
        {
            get;
        }

        bool is_generic_type_instance
        {
            get;
        }

        //������� �� �� ���������� ��������������� ����
        bool depended_from_indefinite
        {
            get;
        }

        //�������� generic-����, ���������� ������ ��������
        ICommonTypeNode generic_type_container
        {
            get;
        }

        ICommonFunctionNode common_generic_function_container
        {
            get;
        }
        //\ssyy
	}

	//��������� ��� �������� ������� �����.
	//��� ��������� .Net ���� ���� ����� �� �����. �� ����� ����������, �������� ��� ��������� ��������� ����.
	//��� �� ����� ���� �����������, �������� ��� ������������� ����� �����.
	//���� �������� � ���� ������ ������� ������������ compiled_type_node.
	//��� ���� ����� ���� �� ���������� �������� name � base_type.
	//� ����� ����� �����������, ����� � ����� ������. ���� ���� ��������� ����� �� ������ ��������������.
	public interface IBasicTypeNode : ITypeNode
	{

	}

    public interface IUnsizedArray : ITypeNode
    {
        ITypeNode element_type
        {
            get;
        }
    }

    //�������� �����, ������������ ������������� � ���������.
    public interface ITypeSynonym : IDefinitionNode, ILocated
    {
        //��� ����. ��� ������ �� �������������� � ��������� ������ ��� � ��� ����, � ����� ��� ��������.
        string name
        {
            get;
        }

        //���, �������� ����� �������
        ITypeNode original_type
        {
            get;
        }

    }

    public interface ITemplateClass : IDefinitionNode
    {
        byte[] serialized_tree
        {
            get;
        }

        string name
        {
            get;
        }
    }

    //��������� ��� generic-�����
    public interface IGenericInstance
    {
        List<ITypeNode> generic_parameters
        {
            get;
        }
    }

    //��������� ��� generic-���������
    public interface IGenericTypeInstance: IGenericInstance, ICommonTypeNode
    {
        ITypeNode original_generic
        {
            get;
        }

        System.Collections.Hashtable used_members
        {
            get;
        }
    }

    public interface ICommonGenericTypeInstance : IGenericTypeInstance
    {
    }

    public interface ICompiledGenericTypeInstance : IGenericTypeInstance
    {
    }

    public interface IGenericFunctionInstance : IGenericInstance, ICommonFunctionNode
    {
        IFunctionNode original_function
        {
            get;
        }
    }

    public interface ICompiledGenericMethodInstance : IGenericFunctionInstance, ICommonMethodNode
    {
    }

    //�������� ������� ����, ������������ ������������� � ���������.
	public interface ICommonTypeNode : ITypeNode, INamespaceMemberNode, ILocated
	{
        bool IsSealed
        {
            get;
        }
		//��� public ��� internal.
		type_access_level type_access_level
		{
			get;
		}

		//������ ����.
		ICommonMethodNode[] methods
		{
			get;
		}

		//���� ����.
		ICommonClassFieldNode[] fields
		{
			get;
		}

		//�������� ����.
		ICommonPropertyNode[] properties
		{
			get;
		}

        //���������, ������������ � ����.
        IClassConstantDefinitionNode[] constants
        {
            get;
        }
		
        ICommonEventNode[] events
        {
        	get;
        }
        
        IPropertyNode default_property
        {
            get;
        }
		
        IConstantNode lower_value
        {
        	get;
        }
        
        IConstantNode upper_value
        {
        	get;
        }
        
        ICommonMethodNode static_constructor
        {
        	get;
        }
        
        int rank
        {
        	get;
        }
        
        //(ssyy) �������� �� ��������� generic-����
        bool is_generic_type_definition
        {
            get;
        }

        List<ICommonTypeNode> generic_params
        {
            get;
        }

        ICommonClassFieldNode runtime_initialization_marker
        {
            get;
        }

        bool has_static_constructor
        {
            get;
        }
	}

    //��������� ��� �������� �����, �������������� �� ������.
	//��� ������������� ����������������� ����� � ��������� ��������������� � System.Reflection.
	//��� ���������� ���� ������� �� .Net. ����� ��������� �� ����� � ������� �������� ��������������� ������ ����������.
	//��� ����� ����� ����������, ����� ������ ��� ����� �� ����������������� �����, � ������� ��� ���� ���������
	//����� System.Reflection � ������ ������. ����� ��� ��������� ���� ��� ������ ��������� (�������� ��������� ����)
	//����� ����� ������ ��������� ��������� � ������� ��������� ������. ��������, ���������� � ����� �����
	//������� �� �� ������, � �� dll-���������. � �� ���� ������ ������� ��� ���������, �.�. � ���� �� ���������
	//����� ������� ����� � ����������������� �������. ������� ���� � ��������� System.Reflection � �������
	//����� ��� ����. ����� ����� ����� �������� ������ �������� ���� ���������.
	public interface ICompiledTypeNode : ITypeNode
	{
		//����������������� ���.
		System.Type compiled_type
		{
			get;
		}
		
		int rank
		{
			get;
		}
	}

	//���������, �������������� ������������� � 0 ������.
	public interface IRefTypeNode : ITypeNode
	{
		ITypeNode pointed_type
		{
			get;
		}
	}
	
	public interface IShortStringTypeNode : ITypeNode
	{
		int Length
		{
			get;
		}
	}
	
	public interface ISimpleArrayNode : ITypeNode
	{
		int length
		{
			get;
		}
		
		ITypeNode element_type
		{
			get;
		}
	}
	
	public interface ISimpleArrayIndexingNode : IAddressedExpressionNode
	{
		IExpressionNode array
		{
			get;
		}
		
		IExpressionNode[] indices
		{
			get;
		}
		
		IExpressionNode index
		{
			get;
		}
	}

	//������� ��������� ��� statement-��. �������, ����������� ������ ���� ��������� ����� �� ������ �����������.
	//������ ����������� ������, ����������� ���������� ����������� �� ������� ����������.
	//������ ����� ��������, �� ������ ��, ��� �������� ���� �� ����� ����� :-).
	public interface IStatementNode : ISemanticNode, ILocated
	{

	}

    public interface IRuntimeManagedMethodBody : IStatementNode
    {
        runtime_statement_type runtime_statement_type
        {
            get;
        }
    }

	//������� ��������� ��� ���������.
	public interface IExpressionNode : IStatementNode
	{
		//��� ���������.
		ITypeNode type
		{
			get;
		}
	}

	//������� ��������� ��� ������� �������. ����� �� ���������.
	public interface IFunctionCallNode : IExpressionNode
	{
		//������ ����������� ����������. ���������� � ���� ���������� � ����������� ���������� ���������
		//�� ����� ���������� �������������� ������. ��� ������������� ��� ���������� �������������� ������
		//����������� ���� �������������� �����.
		IExpressionNode[] real_parameters
		{
			get;
		}

		//���������� �����.
		IFunctionNode function
		{
			get;
		}

        //ssyy
        //����� ��� ��������� �������������� ������������ �������
        bool last_result_function_call
        {
            get;
            set;
        }
        //\ssyy

	}

	//����� �������� ������.
	public interface IBasicFunctionCallNode : IFunctionCallNode
	{
		//���������� �����.
		IBasicFunctionNode basic_function
		{
			get;
		}
	}

    public interface INonStaticMethodCallNode : IFunctionCallNode
    {
        bool virtual_call
        {
            get;
            set;
        }

    }

	//����� �������, ������������ � ������������ ����.
	public interface ICommonNamespaceFunctionCallNode : IFunctionCallNode
	{
		//���������� �����.
		ICommonNamespaceFunctionNode namespace_function
		{
			get;
		}
	}

	//����� �������, ������������ � ������ �������.
	public interface ICommonNestedInFunctionFunctionCallNode : IFunctionCallNode
	{
		//���������� �����.
		ICommonNestedInFunctionFunctionNode common_function
		{
			get;
		}

		//����������� ������� ��������� �������.
		int static_depth
		{
			get;
		}
	}

	//����� ������ ������.
    public interface ICommonMethodCallNode : INonStaticMethodCallNode
	{
		//���������� �����.
		ICommonMethodNode method
		{
			get;
		}

		//��������� ������, ������ ����� �������� ����� �������.
		IExpressionNode obj
		{
			get;
		}
	}

	//����, ��������������� ��������� this � ���������.
	public interface IThisNode : IExpressionNode
	{
	}

    public interface IAsNode : IExpressionNode
    {
        IExpressionNode left
        {
            get;
        }

        ITypeNode right
        {
            get;
        }
    }

    public interface IIsNode : IExpressionNode
    {
        IExpressionNode left
        {
            get;
        }

        ITypeNode right
        {
            get;
        }
    }
    
    public interface ISizeOfOperator : IExpressionNode
    {
        ITypeNode oftype
        {
            get;
        }
    }

    public interface ITypeOfOperator : IExpressionNode
    {
        ITypeNode oftype
        {
            get;
        }
    }

	//����� ����������� ������ ������.
    public interface ICommonStaticMethodCallNode : IFunctionCallNode
	{
		//���������� �����.
		ICommonMethodNode static_method
		{
			get;
		}

		//���, ����������� ����� �������� ��������.
		ICommonTypeNode common_type
		{
			get;
		}
	}

	//����� ������������ common-������.
	public interface ICommonConstructorCall : ICommonStaticMethodCallNode
	{
        //ssyy
        bool new_obj_awaited();
        //\ssyy
	}

	//����� ������������������ ������.
    public interface ICompiledMethodCallNode : INonStaticMethodCallNode
	{
		//���������� �����.
		ICompiledMethodNode compiled_method
		{
			get;
		}

		//��������� ������, ������ ����� �������� ����� �������.
		IExpressionNode obj
		{
			get;
		}

    }

	//����� ������������ ������, ������������������ ������.
    public interface ICompiledStaticMethodCallNode : IFunctionCallNode
	{
		//���������� �����.
		ICompiledMethodNode static_method
		{
			get;
		}

		//���, ����������� ����� �������� �� ��������.
		ICompiledTypeNode compiled_type
		{
			get;
		}

        ITypeNode[] template_parametres
        {
            get;
        }
	}

	//����� ������������ ������������������ ������.
	public interface ICompiledConstructorCall : IFunctionCallNode
	{
		ICompiledConstructorNode constructor
		{
			get;
		}

		ICompiledTypeNode compiled_type
		{
			get;
		}

        //ssyy
        bool new_obj_awaited();
        //\ssyy
	}

	//������� ��������� ��� �������� �������. ������� �� ���������.
	public interface IFunctionNode : IDefinitionNode
	{
		//��� ���� - ������� (basic), ������� (common) ��� �������������� (compiled).
		node_kind node_kind
		{
			get;
		}

		//������ ���������� ���������� �������.
		IParameterNode[] parameters
		{
			get;
		}

		//��� ������������� �������� �������.
		ITypeNode return_value_type
		{
			get;
		}

		//��� �������. ��� ������ �� �������������� � �������� - � ��� ����, � ������� ������� ����������.
		string name
		{
			get;
		}

		//������������ ������� - � �������, � ������, � ������������ ����.
		node_location_kind node_location_kind
		{
			get;
		}

        //�������� �� generic-��������
        bool is_generic_function
        {
            get;
        }

        //����� �����-���������� generic-�������. 0 ��� ��-generic.
        int generic_parameters_count
        {
            get;
        }
    }

	//��������� ����� ������.
	public interface IClassMemberNode
	{
		//���, ���������� ���� ���� ������.
		ITypeNode comperehensive_type
		{
			get;
		}

		//�����������, ������� ��� ����������� �����.
		polymorphic_state polymorphic_state
		{
			get;
		}

		//������� ������� � ����� ������.
		field_access_level field_access_level
		{
			get;
		}
	}

	//��������� ����� ������������������ ������.
	public interface ICompiledClassMemberNode : IClassMemberNode
	{
		//���, ���������� ���� ������.
		ICompiledTypeNode comprehensive_type
		{
			get;
		}
	}

	//��������� ����� �������� ������.
	public interface ICommonClassMemberNode : IClassMemberNode
	{
		//���, ���������� ���� ������.
		ICommonTypeNode common_comprehensive_type
		{
			get;
		}
	}

	//��������� ���������� ��� �������, ������������ ������ �������.
	public interface IFunctionMemberNode
	{
		//�������, ���������� ���� �������.
		ICommonFunctionNode function
		{
			get;
		}
	}

	//��������� ���������� ��� �������, ������������ � ������������ ����.
	public interface INamespaceMemberNode
	{
		//������������ ����, � ������� ��������� �������.
		ICommonNamespaceNode comprehensive_namespace
		{
			get;
		}
	}

	//����� ��� �������� �������, ����� �� ������������ ������� (��������, �������� ���� ����� �����).
	public interface IBasicFunctionNode : IFunctionNode
	{
		//����� ������ ��� ������� �������.
		basic_function_type basic_function_type
		{
			get;
		}
	}

    public enum SpecialFunctionKind
    {
        None, New, Dispose, NewArray
    }

	//��������� ��� �������� �������, ������������ �������������.
	public interface ICommonFunctionNode : IFunctionNode, ILocated
	{
        SpecialFunctionKind SpecialFunctionKind
        {
            get;
        }
		
        bool is_overload
        {
        	get;
        }
        
		//������ ����������, ������������ � �������.
		ILocalVariableNode[] var_definition_nodes
		{
			get;
		}

		//������ ��������� �������.
		ICommonNestedInFunctionFunctionNode[] functions_nodes
		{
			get;
		}

		//��� �������.
		IStatementNode function_code
		{
			get;
		}

		//����������, ������� �������� ������������ �������� �������. ��� �������� - null.
		ILocalVariableNode return_variable
		{
			get;
		}

        //���������, ������������ � �������.
        ICommonFunctionConstantDefinitionNode[] constants
        {
            get;
        }

        //Generic-��������� �������
        List<ICommonTypeNode> generic_params
        {
            get;
        }
    }

	//�������, ������������ ��������������� � ������������ ����.
	public interface ICommonNamespaceFunctionNode : ICommonFunctionNode, INamespaceMemberNode
	{
		//����������� ����, � ������� ���������� ��� �������.
		ICommonNamespaceNode namespace_node
		{
			get;
		}

        ITypeNode ConnectedToType
        { 
            get;  
        }
	}

	//�������, ������������ � ������ �������.
	public interface ICommonNestedInFunctionFunctionNode : ICommonFunctionNode, IFunctionMemberNode
	{
	
	}

	//����� ������, ������������ �������������.
	public interface ICommonMethodNode : ICommonFunctionNode, ICommonClassMemberNode
	{
		bool is_constructor
		{
			get;
		}

        IFunctionNode overrided_method
        {
            get;
        }

        bool is_final
        {
            get;
            set;
        }

        bool newslot_awaited
        {
            get;
            set;
        }

    }

	//����� ��� �������� �������������� (compiled) �������.
	public interface ICompiledMethodNode : IFunctionNode, ICompiledClassMemberNode
	{
		//����������������� �����.
		System.Reflection.MethodInfo method_info
		{
			get;
		}

        bool is_extension
        {
            get;
        }
	}

	//����� ������������ ������������������ ����.
	public interface ICompiledConstructorNode : IFunctionNode, ICompiledClassMemberNode
	{
		System.Reflection.ConstructorInfo constructor_info
		{
			get;
		}
	}

	//��������� ��� �������� ����������� if.
	public interface IIfNode : IStatementNode
	{
		//�������.
		IExpressionNode condition
		{
			get;
		}

		//���� then.
		IStatementNode then_body
		{
			get;
		}

		//���� else. ���� if ��� then ��� �������� = null.
		IStatementNode else_body
		{
			get;
		}
	}

	//��������� ��� ����������� while.
	public interface IWhileNode : IStatementNode
	{
		//�������.
		IExpressionNode condition
		{
			get;
		}

		//���� while.
		IStatementNode body
		{
			get;
		}
	}

	//��������� ��� ����������� repeat.
	public interface IRepeatNode : IStatementNode
	{
		//���� do .. while (repeat .. until).
		IStatementNode body
		{
			get;
		}

		//�������.
		IExpressionNode condition
		{
			get;
		}
	}

	//����� ��� �������� ����������� for. 
	//For - C++/C# - ������. ��� ������������� ������������� for �� ������������� � ��� �����������.
	public interface IForNode : IStatementNode
	{
		//������������� ���������� �����.
		IStatementNode initialization_statement
		{
			get;
		}

		//������� ����������� �����.
		IExpressionNode while_expr
		{
			get;
		}
		
		IExpressionNode init_while_expr
		{
			get;
		}
		
		//��������� ��������� �����.
		IStatementNode increment_statement
		{
			get;
		}

		//���� �����.
		IStatementNode body
		{
			get;
		}
		
		bool IsBoolCycle
		{
			get;
		}
	}



	public interface IWhileBreakNode : IStatementNode
	{
		IWhileNode while_node
		{
			get;
		}
	}

	public interface IRepeatBreakNode : IStatementNode
	{
		IRepeatNode repeat_node
		{
			get;
		}
	}

	public interface IForBreakNode : IStatementNode
	{
		IForNode for_node
		{
			get;
		}
	}
	
	public interface IForeachBreakNode : IStatementNode
	{
		IForeachNode foreach_node
		{
			get;
		}
	}
	
	
    public interface IExitProcedure : IStatementNode
    {
    }


	public interface IWhileContinueNode : IStatementNode
	{
		IWhileNode while_node
		{
			get;
		}
	}

	public interface IRepeatContinueNode : IStatementNode
	{
		IRepeatNode repeat_node
		{
			get;
		}
	}

	public interface IForContinueNode : IStatementNode
	{
		IForNode for_node
		{
			get;
		}
	}
	
	public interface IForeachContinueNode : IStatementNode
	{
		IForeachNode foreach_node
		{
			get;
		}
	}
	
	public interface IExternalStatementNode : IStatementNode
	{
		string module_name
		{
			get;
		}
		
		string name
		{
			get;
		}
	}
	
	public interface IPInvokeStatementNode : IStatementNode
	{
		
	}
	
    public interface ISwitchNode : IStatementNode
    {
        IExpressionNode case_expression
        {
            get;
        }

        ICaseVariantNode[] case_variants
        {
            get;
        }

        IStatementNode default_statement
        {
            get;
        }
    }

    public interface ICaseVariantNode : IStatementNode
    {
        IIntConstantNode[] elements
        {
            get;
        }

        ICaseRangeNode[] ranges
        {
            get;
        }

        IStatementNode statement_to_execute
        {
            get;
        }
    }

    public interface ICaseRangeNode : IStatementNode
    {
        IIntConstantNode lower_bound
        {
            get;
        }

        IIntConstantNode high_bound
        {
            get;
        }
    }
	
	/*//    switch.
	public interface ISwitchNode : IStatementNode
	{
	}

	//���� �� ��������� ����������� swithc.
	public interface ICaseVariantNode : IStatementNode
	{
		//���������, ��� ������� ����� ��������� ���, ��������������� ����� ����.
		IExpressionNode[] expressions
		{
			get;
		}

		//���������, ��� ��������� � ������� ����� ��������� ���, ��������������� ����� ����.
		IRangExpression[] ranges
		{
			get;
		}

		//��� ����� ����.
		IStatementNode statement
		{
			get;
		}
	}

	public interface IRangeExpression : IExpressionNode
	{
		IExpressionNode lower_bound
		{
			get;
		}

		IExpressionNode upper_bound
		{
			get;
		}
	}*/

	//��������� ��� �������� ������ statement-��.
	public interface IStatementsListNode : IStatementNode
	{
        ILocalBlockVariableNode[] LocalVariables
        {
            get;
        }
		//������ statement-��.
		IStatementNode[] statements
		{
			get;
		}
        //��������� ����� ���������� ������
        ILocation LeftLogicalBracketLocation
        {
			get;
		}
        //��������� ������ ���������� ������
        ILocation RightLogicalBracketLocation
        {
			get;
		}
        
	}

    public interface IThrowNode : IStatementNode
    {
        IExpressionNode exception_expresion
        {
            get;
        }
    }

    public interface ITryBlockNode : IStatementNode
    {
        IStatementNode TryStatements
        {
            get;
        }

        IStatementNode FinallyStatements
        {
            get;
        }

        IExceptionFilterBlockNode[] ExceptionFilters
        {
            get;
        }
    }

    public interface IExceptionFilterBlockNode : IStatementNode
    {
        ITypeNode ExceptionType
        {
            get;
        }

        ILocalBlockVariableReferenceNode ExceptionInstance
        {
            get;
        }

        IStatementNode ExceptionHandler
        {
            get;
        }
    }

    /*
    public interface ICatchNode : IStatementNode
    {
        ISemanticNode[] catch_body
        {
            get;
        }
    }

    public interface ITryStatementNode : IStatementNode
    {
        IStatementNode[] try_body
        {
            get;
        }

        
    }
    */
     
	//���� ������������ ����.
	public interface INamespaceNode : IDefinitionNode
	{
		string namespace_name
		{
			get;
		}
	}
	
	//���� ������������ ����, ������������� �������������.
	public interface ICommonNamespaceNode : INamespaceNode, ILocated
	{
		//������������ ����, ��������� � ��� ������������ ����.
		ICommonNamespaceNode[] nested_namespaces
		{
			get;
		}

		//������������ ����, � ������� �������� ��� ������������ ����.
		INamespaceNode comprehensive_namespace
		{
			get;
		}

		//����, ��������� � namespace.
		ICommonTypeNode[] types
		{
			get;
		}
		
		ITypeSynonym[] type_synonims
		{
			get;
		}

        ITemplateClass[] templates
        {
            get;
        }

		//����������, ��������� � ���� namespace.
		ICommonNamespaceVariableNode[] variables
		{
			get;
		}

		//�������, ��������� � namespace.
		ICommonNamespaceFunctionNode[] functions
		{
			get;
		}

		//���������, ��������� � namespace. ��� ������ ���������������� ��� ������.
		INamespaceConstantDefinitionNode[] constants
		{
			get;
		}

        ICommonNamespaceEventNode[] events
        {
            get;
        }
		
		bool IsMain
		{
			get;
		}
	}

	//����������������� ������������ ����.
	public interface ICompiledNamespaceNode : INamespaceNode
	{
		
	}

    /// ������� ��������� ��� �������� � dll.
    public interface IProgramBase : IDefinitionNode, ILocated
    {
        //������������ ����, ������������ � ��������� ��� dll.
        ICommonNamespaceNode[] namespaces
        {
            get;
        }
        
        string[] UsedNamespaces
        {
        	get;
        }
    }

	//���� dll ����������.
	public interface IDllNode : IProgramBase
	{
		//����� ������������� dll.
		ICommonNamespaceFunctionNode initialization_function
		{
			get;
		}

		//����� ����������� dll.
		ICommonNamespaceFunctionNode finalization_function
		{
			get;
		}
	}

	//�������� ���� ���������.
	public interface IProgramNode : IProgramBase
	{
		//������� �������. �� ���������� ����������� ���������� ���������.
		//��� �������� ������ ������� ������������� ������� (� ������), ���������� �������� ���������
		//� ������ ������� ����������� �������.
		ICommonNamespaceFunctionNode main_function
		{
			get;
		}

        //��������� generic-�����, �������������� � ���������.
        List<IGenericTypeInstance> generic_type_instances
        {
            get;
        }

        //��������� generic-�����, �������������� � ���������.
        List<IGenericFunctionInstance> generic_function_instances
        {
            get;
        }
        
        IStatementNode InitializationCode
        {
        	get;
        }
    }

	//��� ���������, ������� ����� ���������� ����� (�������� ����������).
	public interface IAddressedExpressionNode : IExpressionNode
	{
		
	}

	//�������� return.
	public interface IReturnNode : IStatementNode
	{
		IExpressionNode return_value
		{
			get;
		}
	}

    //ssyy �������
    //�������� return �� .ctor.
    /*public interface ICtorReturnNode : IStatementNode
    {
    }*/
    //\ssyy

    public interface IReferenceNode : IAddressedExpressionNode
    {
        //����������� ��������� ����������.
        IVAriableDefinitionNode Variable
        {
            get;
        }
    }

    //���������, �������������� ��������� � ��������� ���������� � ���� ���������.
    public interface ILocalVariableReferenceNode : IReferenceNode
	{
		//����������� ��������� ����������.
		ILocalVariableNode variable
		{
			get;
		}

		//�������� ����������� ������, ����� ������������ � ����������.
		int static_depth
		{
			get;
		}
	}

    //���������, �������������� ��������� � ��������� ���������� � �����.
    public interface ILocalBlockVariableReferenceNode : IReferenceNode
    {
        //����������� ��������� ����������.
        ILocalBlockVariableNode Variable
        {
            get;
        }
    }
    
    //���������, �������������� ��������� � ����������, ������������ ��������������� � namespace.
    public interface INamespaceVariableReferenceNode : IReferenceNode
	{
		//����������.
		ICommonNamespaceVariableNode variable
		{
			get;
		}
	}

	//���������, �������������� ��������� � ���� ������.
    public interface ICommonClassFieldReferenceNode : IReferenceNode
	{
		//���� ������.
		ICommonClassFieldNode field
		{
			get;
		}

		//������ ������.
		IExpressionNode obj
		{
			get;
		}
	}

	//���������, �������������� ��������� � ������������ ���� ������.
    public interface IStaticCommonClassFieldReferenceNode : IReferenceNode
	{
		//����������� ���� ������.
		ICommonClassFieldNode static_field
		{
			get;
		}

		//�����, � ������������ ������ �������� �� ����������.
		ICommonTypeNode class_type
		{
			get;
		}
	}

	//��������� � ���� ������������������ ������.
    public interface ICompiledFieldReferenceNode : IReferenceNode
	{
		//���� ������.
		ICompiledClassFieldNode field
		{
			get;
		}

		//������ ������.
		IExpressionNode obj
		{
			get;
		}
	}

	//���������, �������������� ��������� � ������������ ���� ������������������ ������.
    public interface IStaticCompiledFieldReferenceNode : IReferenceNode
	{
		//���� ������.
		ICompiledClassFieldNode static_field
		{
			get;
		}

		//�����, � ������������ ���� �������� �� ����������.
		ICompiledTypeNode class_type
		{
			get;
		}
	}

	//��������� � ��������� ������.
    public interface ICommonParameterReferenceNode : IReferenceNode
	{
		//�������� ������, � �������� �� ����������.
		ICommonParameterNode parameter
		{
			get;
		}

		//�������� ����������� ������, ����� ���������� � ��������� � ������� � ������� �� ��������.
		int static_depth
		{
			get;
		}
	}

	//������� ���� ��� ������������� �������� � ���� ��������� (�� ����������� ��������, � �����, ����� � �.�.).
	public interface IConstantNode : IExpressionNode
	{
        object value
        {
            get;
        }
	}

	//��������� ��� ������������� ��������� ��������.
	public interface IBoolConstantNode : IConstantNode
	{
		//�������� ���������.
		bool constant_value
		{
			get;
		}
	}

    //��������� ��� ������������� byte ��������.
    public interface IByteConstantNode : IConstantNode
    {
        //�������� ���������.
        byte constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� signed byte ��������.
    public interface ISByteConstantNode : IConstantNode
    {
        //�������� ���������.
        sbyte constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� signed short ��������.
    public interface IShortConstantNode : IConstantNode
    {
        //�������� ���������.
        short constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� unsigned short ��������.
    public interface IUShortConstantNode : IConstantNode
    {
        //�������� ���������.
        ushort constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� int ��������.
    public interface IIntConstantNode : IConstantNode
    {
        //�������� ���������.
        int constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� unsigned int ��������.
    public interface IUIntConstantNode : IConstantNode
    {
        //�������� ���������.
        uint constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� long ��������.
    public interface ILongConstantNode : IConstantNode
    {
        //�������� ���������.
        long constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� unsigned long ��������.
    public interface IULongConstantNode : IConstantNode
    {
        //�������� ���������.
        ulong constant_value
        {
            get;
        }
    }

    //��������� ��� ������������� float ��������.
    public interface IFloatConstantNode : IConstantNode
    {
        //�������� ���������.
        float constant_value
        {
            get;
        }
    }

	//��������� ��� ������������� double ��������.
	public interface IDoubleConstantNode : IConstantNode
	{
		//�������� ���������.
		double constant_value
		{
			get;
		}
	}

	//��������� ��� ������������� char �������� (���� ����� ��� 2-������� char - widechar � delphi).
	public interface ICharConstantNode : IConstantNode
	{
		//�������� ���������.
		char constant_value
		{
			get;
		}
	}

	//��������� ��� ������������� string-��������.
	public interface IStringConstantNode : IConstantNode
	{
		//�������� ���������.
		string constant_value
		{
			get;
		}
	}

    public interface IEnumConstNode : IConstantNode
    {
        int constant_value
        {
            get;
        }
    }

    public interface IArrayConstantNode : IConstantNode
    {
        IConstantNode[] ElementValues
        {
            get;
        }
        
        ITypeNode ElementType
        {
            get;
        }
    }
    
    public interface IArrayInitializer : IExpressionNode
    {
    	IExpressionNode[] ElementValues
        {
            get;
        }
        
        ITypeNode ElementType
        {
            get;
        }
    }
    
    public interface IRecordConstantNode : IConstantNode
    {
        IConstantNode[] FieldValues
        {
            get;
        }
    }
	
    public interface IRecordInitializer : IExpressionNode
    {
    	IExpressionNode[] FieldValues
    	{
    		get;
    	}
    }
    
    public interface ICompiledStaticMethodCallNodeAsConstant : IConstantNode
    {
        ICompiledStaticMethodCallNode MethodCall
        {
            get;
        }
    }

    public interface ICompiledStaticFieldReferenceNodeAsConstant : IConstantNode
    {
        IStaticCompiledFieldReferenceNode FieldReference
        {
            get;
        }
    }

    public interface ICommonNamespaceFunctionCallNodeAsConstant : IConstantNode
    {
        ICommonNamespaceFunctionCallNode MethodCall
        {
            get;
        }
    }
    
    public interface IBasicFunctionCallNodeAsConstant : IConstantNode
    {
    	IBasicFunctionCallNode MethodCall
    	{
    		get;
    	}
    }
    
    public interface ICompiledConstructorCallAsConstant : IConstantNode
    {
        ICompiledConstructorCall MethodCall
        {
            get;
        }
    }
    /*public interface IClassConstantNode : IConstantNode
    {

    }*/

	/*//���� ��� ������������� ��������� ������������.
	public interface IAssignNode : IExpressionNode
	{
		//���� �������������.
		IAddressedExpressionNode to
		{
			get;
		}

		//��� �����������.
		IExpressionNode from
		{
			get;
		}
	}*/

	//������ ��������� ��� ���������� ���������� �������, ��������� ����������, ���������� ���������� ��������� � ������ � ����� ������. ����� �� ���������.
	public interface IVAriableDefinitionNode : IDefinitionNode
	{
		//��� ����������.
		string name
		{
			get;
		}

		//��� ����������.
		ITypeNode type
		{
			get;
		}

        IExpressionNode inital_value
        {
            get;
        }

		//����������� ����������.
		node_location_kind node_location_kind
		{
			get;
		}
	}

	//��������� ��� �������� ��������� ����������.
	public interface ILocalVariableNode : IVAriableDefinitionNode, IFunctionMemberNode, ILocated
	{
		//������������, �� ���������� �� ��������� ��������. ������������ ��� �����������.
		bool is_used_as_unlocal
		{
			get;
		}
	}
    
    //��������� ��� �������� ��������� ����������.
    public interface ILocalBlockVariableNode : IVAriableDefinitionNode, ILocated
    {
        IStatementsListNode Block
        {
            get;
        }
    }

	//���������, �������������� ���������� ����������, ��������� � ������ ��� ���������.
	public interface ICommonNamespaceVariableNode : IVAriableDefinitionNode, INamespaceMemberNode, ILocated
	{
		
	}

	//��������� ��� �������� ����� ������.
	public interface ICommonClassFieldNode: IVAriableDefinitionNode, ICommonClassMemberNode, ILocated
	{

	}

	//����������, ������������ � ����������������� ������.
	public interface ICompiledClassFieldNode : IVAriableDefinitionNode, ICompiledClassMemberNode
	{
		System.Reflection.FieldInfo compiled_field
		{
			get;
		}
	}

	//������� ��������� ��� �����������, �������������� ��������� �������, ������� � ����������������� �������.
	public interface IParameterNode : IVAriableDefinitionNode
	{
		//��� ���������.
		parameter_type parameter_type
		{
			get;
		}

		//�������, � ������� ������ ���� �������.
		IFunctionNode function
		{
			get;
		}

        bool is_params
        {
            get;
        }

        bool is_const
        {
            get;
        }

        IExpressionNode default_value
        {
            get;
        }
	}

	//��������� ��� ������������� ���������� common �������.
	public interface ICommonParameterNode : IParameterNode, ILocated
	{
		//�������, � ������� ��������� ���������.
		ICommonFunctionNode common_function
		{
			get;
		}

		//������������ �� �������� �� ��������� ��������.
		bool is_used_as_unlocal
		{
			get;
		}
	}

	//���������, �������������� ��������� ������� �������.
	public interface IBasicParameterNode : IParameterNode
	{
		
	}

	//���������, �������������� ��������� ���������������� �������.
	public interface ICompiledParameterNode : IParameterNode
	{
		//�������, � ������� ��������� ���������.
		ICompiledMethodNode compiled_function
		{
			get;
		}
	}

	//���������, ����������� ����������� ���������.
	public interface IConstantDefinitionNode : IDefinitionNode
	{
		//��� ���������.
		string name
		{
			get;
		}

		//��� ���������.
		ITypeNode type
		{
			get;
		}

		//�������� ���������.
		IConstantNode constant_value
		{
			get;
		}
	}

    //���������, ������������ � ������.
    public interface IClassConstantDefinitionNode : IConstantDefinitionNode, IClassMemberNode, ILocated
    {

    }

    public interface ICompiledClassConstantDefinitionNode : IConstantDefinitionNode, IClassMemberNode
    {
        ICompiledTypeNode comprehensive_type
        {
            get;
        }
    }

    //���������, ������������ � ������������ ����.
    public interface INamespaceConstantDefinitionNode : IConstantDefinitionNode, ILocated
    {
        ICommonNamespaceNode comprehensive_namespace
        {
            get;
        }
    }

    //���������, ������������ � �������.
    public interface ICommonFunctionConstantDefinitionNode : IConstantDefinitionNode, ILocated
    {
        ICommonFunctionNode comprehensive_function
        {
            get;
        }
    }

    //���������, ������������ � ����������������� ����.
    public interface ICompiledConstantNode : IConstantDefinitionNode
    {
        ICompiledTypeNode comprehensive_type
        {
            get;
        }
    }

	//����, ����������� �������� ������. ������� �� ���������.
	public interface IPropertyNode : IDefinitionNode
	{
		//��� ������� (basic, common, compiled).
		node_kind node_kind
		{
			get;
		}

		//��� ��������.
		string name
		{
			get;
		}

		//���, ������� �������� ��� ��������.
		ITypeNode comprehensive_type
		{
			get;
		}

		//��� ��������.
		ITypeNode property_type
		{
			get;
		}

		//�������, ������� ���������� �������� ��������.
		IFunctionNode get_function
		{
			get;
		}

		//�������, ������� ������������� �������� ��������.
		IFunctionNode set_function
		{
			get;
		}

		IParameterNode[] parameters
		{
			get;
		}
	}

	//������������ ������������� ��������.
	public interface ICommonPropertyNode : IPropertyNode, ICommonClassMemberNode, ILocated
	{
		//���, ������� �������� ��� ��������.
		/*ICommonTypeNode common_comprehensive_type
		{
			get;
		}*/

		//�������, ������� ���������� �������� ��������.
		/*ICommonClassMemberNode get_common_function
		{
			get;
		}

		//�������, ������� ������������� �������� ��������.
		ICommonClassMemberNode set_common_function
		{
			get;
		}*/
	}

	//������� ��������. ���� ����� �� �����, �� ��� ���������� ��������� ���� ����� ����� ����������.
	public interface IBasicPropertyNode : IPropertyNode
	{

	}

	//�������� � ����������������� ����.
	public interface ICompiledPropertyNode : IPropertyNode, ICompiledClassMemberNode
	{
		//�������� � ������.
		System.Reflection.PropertyInfo property_info
		{
			get;
		}

		//���, ������� �������� ��� ��������.
		ICompiledTypeNode compiled_comprehensive_type
		{
			get;
		}

		//�������, ������� ���������� �������� ��������.
		ICompiledMethodNode compiled_get_method
		{
			get;
		}

		//�������, ������� ������������� �������� ��������.
		ICompiledMethodNode compiled_set_method
		{
			get;
		}

	}

	public interface IGetAddrNode : IExpressionNode
	{
		IExpressionNode addr_of_expr
		{
			get;
		}
	}
	
	public interface IDereferenceNode : IAddressedExpressionNode
	{
		IExpressionNode derefered_expr
		{
			get;
		}
	}

	public interface INullConstantNode : IConstantNode
    {
    }

    public interface IStatementsExpressionNode : IExpressionNode
    {
        IStatementNode[] statements
        {
            get;
        }

        IExpressionNode expresion
        {
            get;
        }
    }

    public interface IQuestionColonExpressionNode : IExpressionNode
    {
        IExpressionNode condition
        {
            get;
        }

        IExpressionNode ret_if_true
        {
            get;
        }

        IExpressionNode ret_if_false
        {
            get;
        }
    }

    public interface ILabelNode : IDefinitionNode, ILocated
    {
        //��� �����. ��� ������ �� �������������� � ��������� ������ ��� � ��� ����, � ����� ��� ��������.
        string name
        {
            get;
        }

        //��������� �� ����� � ����
        /*bool is_defined
        {
            get;
            set;
        }*/

    }

    public interface ILabeledStatementNode : IStatementNode, ILocated
    {
        //�����, ������� ������� statement
        ILabelNode label
        {
            get;
        }

        //���� ����������
        IStatementNode statement
        {
            get;
        }

    }

    public interface IGotoStatementNode : IStatementNode, ILocated
    {
        //�����, �� ������� ���������� �������
        ILabelNode label
        {
            get;
        }
    }

    public interface IForeachNode : IStatementNode, ILocated
    {
        IVAriableDefinitionNode VarIdent
        {
            get;
        }

        IExpressionNode InWhatExpr
        {
            get;
        }

        IStatementNode Body
        {
            get;
        }
    }

    public interface ILockStatement : IStatementNode, ILocated
    {
        IExpressionNode LockObject
        {
            get;
        }
        IStatementNode Body
        {
            get;
        }
    }

    public interface IRethrowStatement : IStatementNode, ILocated
    {
    	
    }
    
    public interface INamespaceConstantReference : IConstantNode, ILocated
    {
    	INamespaceConstantDefinitionNode Constant
    	{
    		get;
    	}
    }
    
    public interface IFunctionConstantReference : IConstantNode, ILocated
    {
    	ICommonFunctionConstantDefinitionNode Constant
    	{
    		get;
    	}
    }
    
    public interface IFunctionConstantDefinitionNode : IConstantDefinitionNode, ILocated
    {
        ICommonFunctionNode function
        {
            get;
        }
    }
    
    public interface ICommonConstructorCallAsConstant : IConstantNode, ILocated
    {
    	ICommonConstructorCall ConstructorCall
    	{
    		get;
    	}
    }
    
    public interface IEventNode : IDefinitionNode
    {
    	
    }
    
    public interface ICompiledEventNode : IEventNode
    {
        System.Reflection.EventInfo CompiledEvent
        {
            get;
        }
    }
    
    public interface ICommonEventNode : IDefinitionNode, IEventNode, ICommonClassMemberNode, ILocated
    {
    	string Name
    	{
    		get;
    	}
    	
    	ITypeNode DelegateType
    	{
    		get;
    	}
    	
    	ICommonMethodNode AddMethod
    	{
    		get;
    	}
    	
    	ICommonMethodNode RemoveMethod
    	{
    		get;
    	}
    	
    	ICommonMethodNode RaiseMethod
    	{
    		get;
    	}

        ICommonClassFieldNode Field
        {
            get;
        }

    	bool IsStatic
    	{
    		get;
    	}
    }

    public interface ICommonNamespaceEventNode : IDefinitionNode, IEventNode, ILocated
    {
        string Name
        {
            get;
        }

        ITypeNode DelegateType
        {
            get;
        }

        ICommonNamespaceFunctionNode AddFunction
        {
            get;
        }

        ICommonNamespaceFunctionNode RemoveFunction
        {
            get;
        }

        ICommonNamespaceFunctionNode RaiseFunction
        {
            get;
        }

        ICommonNamespaceVariableNode Field
        {
            get;
        }
    }

    public interface IStaticEventReference : IAddressedExpressionNode
    {
    	IEventNode Event
    	{
    		get;
    	}
    }
    
    public interface INonStaticEventReference : IStaticEventReference
    {
    	IExpressionNode obj
    	{
    		get;
    	}
    }

    public interface IDefaultOperatorNode : IExpressionNode
    {
    }
	
    public interface IAttributeNode : ISemanticNode, ILocated
    {
    	IFunctionNode AttributeConstructor
    	{
    		get;
    	}
    	
    	attribute_qualifier_kind qualifier
    	{
    		get;
    	}
    	
    	ITypeNode AttributeType
    	{
    		get;
    	}
    	
    	IConstantNode[] Arguments
    	{
    		get;
    	}
    	
    	IPropertyNode[] PropertyNames
    	{
    		get;
    	}
    	
    	IConstantNode[] PropertyInitializers
    	{
    		get;
    	}
    	
    	IVAriableDefinitionNode[] FieldNames
    	{
    		get;
    	}
    	
    	IConstantNode[] FieldInitializers
    	{
    		get;
    	}
    }
    public interface ILambdaFunctionNode : IExpressionNode
    {
        //��� ���� - ������� (basic), ������� (common) ��� �������������� (compiled).
        node_kind node_kind
        {
            get;
        }

        //������ ���������� ���������� �������.
        IParameterNode[] parameters
        {
            get;
        }

        //��� ������������� �������� �������.
        ITypeNode return_value_type
        {
            get;
        }

        IStatementNode body
        {
            get;
        }

        IFunctionNode function
        {
            get;
        }

        //������������ ������� - � �������, � ������, � ������������ ����.
        node_location_kind node_location_kind
        {
            get;
        }

        //�������� �� generic-��������
        bool is_generic_function
        {
            get;
        }

        //����� �����-���������� generic-�������. 0 ��� ��-generic.
        int generic_parameters_count
        {
            get;
        }
    }
    public interface ILambdaFunctionCallNode : IExpressionNode
    {
        //������ ����������� ����������. ���������� � ���� ���������� � ����������� ���������� ���������
        //�� ����� ���������� �������������� ������. ��� ������������� ��� ���������� �������������� ������
        //����������� ���� �������������� �����.
        IExpressionNode[] parameters
        {
            get;
        }

        //���������� �����.
        ILambdaFunctionNode lambda
        {
            get;
        }
    }
    /*public interface ICompiledFunctionNode : IFunctionNode
    {
        string test
        {
            get;
        }      
    }*/
}
