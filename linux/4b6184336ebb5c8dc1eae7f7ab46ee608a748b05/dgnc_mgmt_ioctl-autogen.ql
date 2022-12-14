/**
 * @name linux-4b6184336ebb5c8dc1eae7f7ab46ee608a748b05-dgnc_mgmt_ioctl
 * @id cpp/linux/4b6184336ebb5c8dc1eae7f7ab46ee608a748b05/dgnc_mgmt_ioctl
 * @description linux-4b6184336ebb5c8dc1eae7f7ab46ee608a748b05-dgnc_mgmt_ioctl 
 * @kind problem
 * @tags security
 */

import cpp

predicate func_0(Variable vddi_109) {
	exists(ExprStmt target_0 |
		target_0.getExpr().(FunctionCall).getTarget().hasName("__memset")
		and target_0.getExpr().(FunctionCall).getArgument(0).(AddressOfExpr).getOperand().(VariableAccess).getTarget()=vddi_109
		and target_0.getExpr().(FunctionCall).getArgument(1).(Literal).getValue()="0"
		and target_0.getExpr().(FunctionCall).getArgument(2).(SizeofExprOperator).getValue()="32"
		and target_0.getExpr().(FunctionCall).getArgument(2).(SizeofExprOperator).getExprOperand().(VariableAccess).getTarget()=vddi_109)
}

from Function func, Variable vddi_109
where
not func_0(vddi_109)
and vddi_109.getType().hasName("digi_dinfo")
and vddi_109.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
