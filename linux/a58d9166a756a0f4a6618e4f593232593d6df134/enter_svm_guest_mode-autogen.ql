/**
 * @name linux-a58d9166a756a0f4a6618e4f593232593d6df134-enter_svm_guest_mode
 * @id cpp/linux/a58d9166a756a0f4a6618e4f593232593d6df134/enter-svm-guest-mode
 * @description linux-a58d9166a756a0f4a6618e4f593232593d6df134-enter_svm_guest_mode CVE-2021-29657
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Parameter vsvm_437, Parameter vvmcb12_438, Function func) {
	exists(ExprStmt target_0 |
		target_0.getExpr().(FunctionCall).getTarget().hasName("load_nested_vmcb_control")
		and target_0.getExpr().(FunctionCall).getArgument(0).(VariableAccess).getTarget()=vsvm_437
		and target_0.getExpr().(FunctionCall).getArgument(1).(AddressOfExpr).getOperand().(PointerFieldAccess).getTarget().getName()="control"
		and target_0.getExpr().(FunctionCall).getArgument(1).(AddressOfExpr).getOperand().(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=vvmcb12_438
		and func.getEntryPoint().(BlockStmt).getAStmt()=target_0)
}

from Function func, Parameter vsvm_437, Parameter vvmcb12_438
where
func_0(vsvm_437, vvmcb12_438, func)
and vsvm_437.getType().hasName("vcpu_svm *")
and vvmcb12_438.getType().hasName("vmcb *")
and vsvm_437.getParentScope+() = func
and vvmcb12_438.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
