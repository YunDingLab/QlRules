/**
 * @name linux-28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1-wcn36xx_set_tx_mgmt
 * @id cpp/linux/28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1/wcn36xx-set-tx-mgmt
 * @description linux-28131d896d6d316bc1f6f305d1a9ed6d96c3f2a1-wcn36xx_set_tx_mgmt CVE-2020-24588
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Parameter vbd_450, Function func) {
	exists(ExprStmt target_0 |
		target_0.getExpr().(AssignExpr).getLValue().(ValueFieldAccess).getTarget().getName()="bd_ssn"
		and target_0.getExpr().(AssignExpr).getLValue().(ValueFieldAccess).getQualifier().(PointerFieldAccess).getTarget().getName()="pdu"
		and target_0.getExpr().(AssignExpr).getLValue().(ValueFieldAccess).getQualifier().(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=vbd_450
		and (func.getEntryPoint().(BlockStmt).getStmt(9)=target_0 or func.getEntryPoint().(BlockStmt).getStmt(9).getFollowingStmt()=target_0))
}

predicate func_1(Parameter vbd_450) {
	exists(PointerFieldAccess target_1 |
		target_1.getTarget().getName()="queue_id"
		and target_1.getQualifier().(VariableAccess).getTarget()=vbd_450)
}

from Function func, Parameter vbd_450
where
not func_0(vbd_450, func)
and vbd_450.getType().hasName("wcn36xx_tx_bd *")
and func_1(vbd_450)
and vbd_450.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
