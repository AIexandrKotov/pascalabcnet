﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using PascalABCCompiler.SyntaxTree;
using PascalABCCompiler.TreeConversion;
using PascalABCCompiler.TreeConverter;

namespace SyntaxVisitors.SugarVisitors
{
    // Patterns

    public class DeconstructionDesugaringResult
    {
        /// <summary>
        /// Переменная, имеющая тип паттерна
        /// </summary>
        public var_statement CastVariableDefinition { get; set; }

        /// <summary>
        /// Переменная, в которую сохраняется результат мэтчинга
        /// </summary>
        public var_statement SuccessVariableDefinition { get; set; }

        /// <summary>
        /// Переменные, полученные в результате деконструкции
        /// </summary>
        public List<var_def_statement> DeconstructionVariables { get; private set; } = new List<var_def_statement>();

        /// <summary>
        /// Проверка соответствия типа выражения типу паттерна
        /// </summary>
        public expression TypeCastCheck { get; set; }

        /// <summary>
        /// Вызов Deconstruct
        /// </summary>
        public statement DeconstructCall { get; set; }

        public ident CastVariable => CastVariableDefinition.var_def.vars.list.First();

        public ident SuccessVariable => SuccessVariableDefinition.var_def.vars.list.First();

        public List<statement> GetDeconstructionDefinitions(SourceContext patternContext)
        {
            var result = new List<statement>();
            result.Add(CastVariableDefinition);
            result.Add(new desugared_deconstruction(DeconstructionVariables, CastVariable, patternContext)); 
            result.Add(SuccessVariableDefinition);

            return result;
        }

        public if_node GetPatternCheckWithDeconstrunctorCall()
        {
            return SubtreeCreator.CreateIf(
                TypeCastCheck,
                new statement_list(new assign(SuccessVariable.name, true), DeconstructCall));
        }
    }

    public class PatternsDesugaringVisitor : BaseChangeVisitor
    {
        private enum PatternLocation { Unknown, IfCondition, Assign }

        private const string DeconstructMethodName = compiler_string_consts.deconstruct_method_name;
        private const string IsTestMethodName = compiler_string_consts.is_test_function_name;
        private const string GeneratedPatternNamePrefix = "<>pattern";

        private int _variableCounter = 0;
        private if_node _previousIf;
        private statement desugaredMatchWith;

        private List<if_node> processedIfNodes = new List<if_node>();

        public static PatternsDesugaringVisitor New => new PatternsDesugaringVisitor();

        public override void visit(match_with matchWith)
        {
            desugaredMatchWith = null;
            _previousIf = null;

            // Преобразование из сахара в известную конструкцию каждого case
            foreach (var patternCase in matchWith.case_list.elements)
            {
                if (patternCase == null)
                    continue;

                if (patternCase.pattern is deconstructor_pattern)
                    // TODO Patterns: introduce a variable for expression and cache it
                    DesugarDeconstructorPatternCase(matchWith.expr, patternCase);
            }

            if (matchWith.defaultAction != null)
                AddDefaultCase(matchWith.defaultAction as statement_list);

            if (desugaredMatchWith == null)
                desugaredMatchWith = new empty_statement();

            // Замена выражения match with на новое несахарное поддерево и его обход
            ReplaceUsingParent(matchWith, desugaredMatchWith);
            visit(desugaredMatchWith);
        }

        public override void visit(is_pattern_expr isPatternExpr)
        {
            Debug.Assert(GetLocation(isPatternExpr) != PatternLocation.Unknown, "Is-pattern expression is in an unknown context");
            Debug.Assert(GetAscendant<statement_list>(isPatternExpr) != null, "Couldn't find statement list in upper nodes");
            
            DesugarIsExpression(isPatternExpr);
        }

        void DesugarDeconstructorPatternCase(expression matchingExpression, pattern_case patternCase)
        {
            Debug.Assert(patternCase.pattern is deconstructor_pattern);

            //var result = new statement_list();
            //var pattern = patternCase.pattern as deconstructor_pattern;
            //// создание фиктивной переменной необходимого типа
            //var desugaredPattern = DesugarPattern(pattern, matchingExpression);
            //result.Add(desugaredPattern.CastVariableDefinition);

            

            //// Создание тела if из объявлений переменных, вызова Deconstruct и соответствующего тела case
            //var ifBody = new statement_list();
            //ifBody.Add(new desugared_deconstruction(desugaredPattern.DeconstructionVariables, desugaredPattern.CastVariable, patternCase.pattern.source_context));
            //ifBody.Add(desugaredPattern.DeconstructCall);

            //if (patternCase.condition != null)
            //{
            //    // Выполняем тело, если выполняется условие when
            //    ifBody.Add(SubtreeCreator.CreateIf(patternCase.condition, patternCase.case_action));
            //}
            //else
            //    ifBody.Add(patternCase.case_action);

            //var ifCondition = desugaredPattern.TypeCastCheck;
            //var ifCheck = SubtreeCreator.CreateIf(ifCondition, ifBody);

            //result.Add(ifCheck);

            //// Добавляем полученные statements в результат
            //AddDesugaredCaseToResult(result, ifCheck);
        }

        private ident NewGeneralName() => new ident(GeneratedPatternNamePrefix + "GenVar" + _variableCounter++);

        private ident NewSuccessName() => new ident(GeneratedPatternNamePrefix + "Success" + _variableCounter++);

        private ident NewEndIfName() => new ident(GeneratedPatternNamePrefix + "EndIf" + _variableCounter++);

        private bool IsGenerated(string name) => name.StartsWith(GeneratedPatternNamePrefix);

        private void AddDefaultCase(statement_list statements)
        {
            AddDesugaredCaseToResult(statements, _previousIf);
        }

        private void AddDesugaredCaseToResult(statement_list statements, if_node newIf)
        {
            // Если результат пустой, значит это первый case
            if (desugaredMatchWith == null)
                desugaredMatchWith = statements;
            else
            {
                _previousIf.else_body = statements;
                _previousIf.FillParentsInDirectChilds();
            }

            // Запоминаем только что сгенерированный if
            _previousIf = newIf;
        }

        private DeconstructionDesugaringResult DesugarPattern(deconstructor_pattern pattern, expression matchingExpression)
        {
            Debug.Assert(!pattern.IsRecursive, "All recursive patterns should be desugared into simple patterns at this point");

            var desugarResult = new DeconstructionDesugaringResult();
            var castVariableName = NewGeneralName();
            desugarResult.CastVariableDefinition = new var_statement(castVariableName, pattern.type);

            var successVariableName = NewSuccessName();
            desugarResult.SuccessVariableDefinition = new var_statement(successVariableName, named_type_reference.Boolean);

            // делегирование проверки паттерна функции IsTest
            desugarResult.TypeCastCheck = SubtreeCreator.CreateSystemFunctionCall(IsTestMethodName, matchingExpression, castVariableName);

            var parameters = pattern.parameters.Cast<var_deconstructor_parameter>();
            foreach (var deconstructedVariable in parameters)
            {
                desugarResult.DeconstructionVariables.Add(
                    new var_def_statement(deconstructedVariable.identifier, deconstructedVariable.type));
            }

            var deconstructCall = new procedure_call();
            deconstructCall.func_name = SubtreeCreator.CreateMethodCall(DeconstructMethodName, castVariableName.name, parameters.Select(x => x.identifier).ToArray());
            desugarResult.DeconstructCall = deconstructCall;

            return desugarResult;
        }

        private void DesugarIsExpression(is_pattern_expr isPatternExpr)
        {
            Debug.Assert(isPatternExpr.right is deconstructor_pattern);

            var patternLocation = GetLocation(isPatternExpr);
            
            var pattern = isPatternExpr.right as deconstructor_pattern;
            if (pattern.IsRecursive)
            {
                var desugaredRecursiveIs = DesugarRecursiveDeconstructor(isPatternExpr.left, pattern);
                ReplaceUsingParent(isPatternExpr, desugaredRecursiveIs);
                desugaredRecursiveIs.visit(this);
                return;
            }

            switch (patternLocation)
            {
                case PatternLocation.IfCondition: DesugarIsExpressionInIfCondition(isPatternExpr); break;
                case PatternLocation.Assign: DesugarIsExpressionInAssignment(isPatternExpr); break;
            }
        }

        private expression DesugarRecursiveDeconstructor(expression expression, deconstructor_pattern pattern)
        {
            List<pattern_deconstructor_parameter> parameters = pattern.parameters;
            expression conjunction = new is_pattern_expr(expression, pattern);
            for (int i = 0; i < parameters.Count; i++)
            {
                if (parameters[i] is recursive_deconstructor_parameter parameter)
                {
                    var parameterType = (parameter.pattern as deconstructor_pattern).type;
                    var newName = NewGeneralName();
                    var varParameter = new var_deconstructor_parameter(newName, parameterType);
                    parameters[i] = varParameter;
                    varParameter.Parent = parameters[i];
                    conjunction = bin_expr.LogicalAnd(conjunction, DesugarRecursiveDeconstructor(newName, parameter.pattern as deconstructor_pattern));
                }
            }

            return conjunction;
        }

        private void DesugarIsExpressionInAssignment(is_pattern_expr isExpression)
        {
            var pattern = isExpression.right as deconstructor_pattern;
            var desugaringResult = DesugarPattern(pattern, isExpression.left);
            ReplaceUsingParent(isExpression, desugaringResult.SuccessVariable);

            var statementsToAdd = desugaringResult.GetDeconstructionDefinitions(pattern.source_context);
            statementsToAdd.Add(desugaringResult.GetPatternCheckWithDeconstrunctorCall());

            AddDefinitionsInUpperStatementList(isExpression, statementsToAdd);
        }

        private void DesugarIsExpressionInIfCondition(is_pattern_expr isExpression)
        {
            var pattern = isExpression.right as deconstructor_pattern;
            var desugaringResult = DesugarPattern(pattern, isExpression.left);
            ReplaceUsingParent(isExpression, desugaringResult.SuccessVariable);

            var statementsToAdd = desugaringResult.GetDeconstructionDefinitions(pattern.source_context);
            statementsToAdd.Add(desugaringResult.GetPatternCheckWithDeconstrunctorCall());

            var enclosingIf = GetAscendant<if_node>(isExpression);
            // Если уже обрабатывался ранее (второй встретившийся в том же условии is), то не изменяем if
            if (processedIfNodes.Contains(enclosingIf))
                AddDefinitionsInUpperStatementList(isExpression, statementsToAdd);
            // Иначе помещаем определения и if-then в отдельный блок, а else после этого блока
            else
            {
                // Сохраняем родителя, так как он может поменяться при вызове ConvertIfNode
                var ifParent = enclosingIf.Parent;
                var convertedIf = ConvertIfNode(enclosingIf, statementsToAdd);
                ifParent.ReplaceDescendantUnsafe(enclosingIf, convertedIf);
                convertedIf.Parent = ifParent;
            }
        }

        private statement_list ConvertIfNode(if_node ifNode, List<statement> statementsBeforeIf)
        {
            // if e then <then> else <else>
            //
            // переводим в
            //
            // begin
            //   statementsBeforeIf
            //   if e then begin <then>; goto end_if end;
            // end
            // <else>
            // end_if: empty_statement

            // if e then <then>
            // 
            // переводим в
            //
            // begin
            //   statementsBeforeIf
            //   if e then <then>
            // end

            //ifNode = ifNode.TypedClone();

            // Добавляем, чтобы на конвертировать еще раз, если потребуется
            processedIfNodes.Add(ifNode);

            var statementsBeforeAndIf = new statement_list();
            statementsBeforeAndIf.AddMany(statementsBeforeIf);
            statementsBeforeAndIf.Add(ifNode);

            if (ifNode.else_body == null)
                return statementsBeforeAndIf;
            else
            {
                var result = new statement_list();
                result.Add(statementsBeforeAndIf);
                var endIfLabel = NewEndIfName();
                // добавляем метку
                if (!(ifNode.then_body is statement_list))
                {
                    ifNode.then_body = new statement_list(ifNode.then_body, ifNode.then_body.source_context);
                    ifNode.then_body.Parent = ifNode;
                }

                var thenBody = ifNode.then_body as statement_list;
                thenBody.Add(new goto_statement(endIfLabel));
                // добавляем else и метку за ним
                result.Add(ifNode.else_body);
                result.Add(new labeled_statement(endIfLabel));
                // удаляем else из if
                ifNode.else_body = null;
                // Добавляем метку
                AddLabel(endIfLabel);

                return result;
            }
        }

        private void AddLabel(ident label)
        {
            var module = listNodes.First() as program_module;
            Debug.Assert(module != null, "Can't find root");
            var block = module.program_block;

            if (block.defs == null)
                block.defs = new declarations();

            block.defs.Add(new label_definitions(label));
        }

        private void AddDefinitionsInUpperStatementList(syntax_tree_node currentNode, IEnumerable<statement> statementsToAdd)
        {
            var definitionsAdded = false;
            var ascendants = currentNode.AscendantNodes().ToArray();

            // Объявление переменной в ближайшем statement_list
            for (int i = 0; i < ascendants.Length; i++)
            {
                if (ascendants[i] is statement_list statements)
                {
                    statements.InsertBefore(
                        ascendants[i - 1] as statement,
                        statementsToAdd);

                    definitionsAdded = true;
                    break;
                }
            }

            // TODO Patterns: convert to compilation error
            Debug.Assert(definitionsAdded, "Couldn't add definitions");
        }

        private PatternLocation GetLocation(syntax_tree_node node)
        {
            var firstStatement = GetAscendant<statement>(node);
            
            switch (firstStatement)
            {
                case if_node _: return PatternLocation.IfCondition;
                case assign _:  return PatternLocation.Assign;
                default: return PatternLocation.Unknown;
            }
        }

        private T GetAscendant<T>(syntax_tree_node node)
            where T : syntax_tree_node
        {
            var current = node.Parent;
            while (current != null)
            {
                if (current is T res)
                    return res;

                current = current.Parent;
            }

            return null;
        }
    }
}

