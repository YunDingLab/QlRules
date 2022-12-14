/**
 * @name linux-28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1-ath10k_add_interface
 * @id cpp/linux/28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1/ath10k-add-interface
 * @description linux-28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1-ath10k_add_interface CVE-2020-24588
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Variable varvif_5461) {
	exists(ComplementExpr target_0 |
		target_0.getValue()="18446744073709551615"
		and target_0.getOperand().(Literal).getValue()="0"
		and target_0.getParent().(AssignExpr).getRValue() = target_0
		and target_0.getParent().(AssignExpr).getLValue().(PointerFieldAccess).getTarget().getName()="beacon_paddr"
		and target_0.getParent().(AssignExpr).getLValue().(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=varvif_5461)
}

predicate func_1(Variable varvif_5461) {
	exists(PointerFieldAccess target_1 |
		target_1.getTarget().getName()="beacon_buf"
		and target_1.getQualifier().(VariableAccess).getTarget()=varvif_5461
		and target_1.getParent().(AssignExpr).getRValue() = target_1
		and target_1.getParent().(AssignExpr).getLValue().(PointerFieldAccess).getTarget().getName()="beacon_paddr"
		and target_1.getParent().(AssignExpr).getLValue().(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=varvif_5461)
}

from Function func, Variable varvif_5461
where
not func_0(varvif_5461)
and func_1(varvif_5461)
and varvif_5461.getType().hasName("ath10k_vif *")
and varvif_5461.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
