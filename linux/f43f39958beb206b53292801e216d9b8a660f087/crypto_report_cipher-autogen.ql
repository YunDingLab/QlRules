/**
 * @name linux-f43f39958beb206b53292801e216d9b8a660f087-crypto_report_cipher
 * @id cpp/linux/f43f39958beb206b53292801e216d9b8a660f087/crypto-report-cipher
 * @description linux-f43f39958beb206b53292801e216d9b8a660f087-crypto_report_cipher 
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Function func) {
	exists(FunctionCall target_0 |
		target_0.getTarget().hasName("strncpy")
		and target_0.getArgument(0) instanceof ValueFieldAccess
		and target_0.getArgument(1) instanceof StringLiteral
		and target_0.getArgument(2) instanceof SizeofExprOperator
		and target_0.getEnclosingFunction() = func)
}

predicate func_1(Variable vrcipher_85) {
	exists(ValueFieldAccess target_1 |
		target_1.getTarget().getName()="type"
		and target_1.getQualifier().(VariableAccess).getTarget()=vrcipher_85)
}

predicate func_2(Variable vrcipher_85) {
	exists(SizeofExprOperator target_2 |
		target_2.getValue()="64"
		and target_2.getExprOperand().(ValueFieldAccess).getTarget().getName()="type"
		and target_2.getExprOperand().(ValueFieldAccess).getQualifier().(VariableAccess).getTarget()=vrcipher_85)
}

predicate func_3(Function func) {
	exists(StringLiteral target_3 |
		target_3.getValue()="cipher"
		and target_3.getEnclosingFunction() = func)
}

predicate func_4(Function func) {
	exists(FunctionCall target_4 |
		target_4.getTarget().hasName("strlcpy")
		and target_4.getArgument(0) instanceof ValueFieldAccess
		and target_4.getArgument(1) instanceof StringLiteral
		and target_4.getArgument(2) instanceof SizeofExprOperator
		and target_4.getEnclosingFunction() = func)
}

from Function func, Variable vrcipher_85
where
not func_0(func)
and func_1(vrcipher_85)
and func_2(vrcipher_85)
and func_3(func)
and func_4(func)
and vrcipher_85.getType().hasName("crypto_report_cipher")
and vrcipher_85.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
