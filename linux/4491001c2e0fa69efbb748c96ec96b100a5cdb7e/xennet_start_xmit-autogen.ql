/**
 * @name linux-4491001c2e0fa69efbb748c96ec96b100a5cdb7e-xennet_start_xmit
 * @id cpp/linux/4491001c2e0fa69efbb748c96ec96b100a5cdb7e/xennet_start_xmit
 * @description linux-4491001c2e0fa69efbb748c96ec96b100a5cdb7e-xennet_start_xmit CVE-2022-33741
 * @kind problem
 * @tags security
 */

import cpp

predicate func_0(Parameter vskb_672) {
	exists(FunctionCall target_0 |
		target_0.getTarget().hasName("skb_copy")
		and not target_0.getTarget().hasName("bounce_skb")
		and target_0.getArgument(0).(VariableAccess).getTarget()=vskb_672
		and target_0.getArgument(1).(BitwiseOrExpr).getValue()="2592"
		and target_0.getArgument(1).(BitwiseOrExpr).getLeftOperand() instanceof BitwiseOrExpr
		and target_0.getArgument(1).(BitwiseOrExpr).getRightOperand() instanceof Literal)
}

predicate func_1(Variable vnp_674, Variable vpage_680, Parameter vskb_672, Variable vnskb_688, Variable vvmemmap_base) {
	exists(LogicalOrExpr target_1 |
		target_1.getAnOperand().(PointerFieldAccess).getTarget().getName()="bounce"
		and target_1.getAnOperand().(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=vnp_674
		and target_1.getAnOperand() instanceof FunctionCall
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(0).(ExprStmt).getExpr().(AssignExpr).getLValue().(VariableAccess).getTarget()=vnskb_688
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(0).(ExprStmt).getExpr().(AssignExpr).getRValue().(FunctionCall).getTarget().hasName("bounce_skb")
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(0).(ExprStmt).getExpr().(AssignExpr).getRValue().(FunctionCall).getArgument(0).(VariableAccess).getTarget()=vskb_672
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(1).(IfStmt).getCondition().(NotExpr).getOperand().(VariableAccess).getTarget()=vnskb_688
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(1).(IfStmt).getThen().(GotoStmt).toString() = "goto ..."
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(2).(ExprStmt).getExpr().(FunctionCall).getTarget().hasName("dev_consume_skb_any")
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(2).(ExprStmt).getExpr().(FunctionCall).getArgument(0).(VariableAccess).getTarget()=vskb_672
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(3).(ExprStmt).getExpr().(AssignExpr).getLValue().(VariableAccess).getTarget()=vskb_672
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(3).(ExprStmt).getExpr().(AssignExpr).getRValue().(VariableAccess).getTarget()=vnskb_688
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getLValue().(VariableAccess).getTarget()=vpage_680
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getRValue().(PointerArithmeticOperation).getAnOperand().(VariableAccess).getTarget()=vvmemmap_base
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getRValue().(PointerArithmeticOperation).getAnOperand().(BinaryBitwiseOperation).getLeftOperand().(FunctionCall).getTarget().hasName("__phys_addr")
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getRValue().(PointerArithmeticOperation).getAnOperand().(BinaryBitwiseOperation).getLeftOperand().(FunctionCall).getArgument(0).(PointerFieldAccess).getTarget().getName()="data"
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getRValue().(PointerArithmeticOperation).getAnOperand().(BinaryBitwiseOperation).getLeftOperand().(FunctionCall).getArgument(0).(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=vskb_672
		and target_1.getParent().(IfStmt).getThen().(BlockStmt).getStmt(4).(ExprStmt).getExpr().(AssignExpr).getRValue().(PointerArithmeticOperation).getAnOperand().(BinaryBitwiseOperation).getRightOperand().(Literal).getValue()="12")
}

predicate func_2(Variable voffset_681) {
	exists(FunctionCall target_2 |
		target_2.getTarget().hasName("__builtin_expect")
		and target_2.getArgument(0).(NotExpr).getOperand().(NotExpr).getOperand().(RelationalOperation).getLesserOperand().(SubExpr).getLeftOperand().(BinaryBitwiseOperation).getLeftOperand().(Literal).getValue()="1"
		and target_2.getArgument(0).(NotExpr).getOperand().(NotExpr).getOperand().(RelationalOperation).getLesserOperand().(SubExpr).getLeftOperand().(BinaryBitwiseOperation).getRightOperand().(Literal).getValue()="12"
		and target_2.getArgument(0).(NotExpr).getOperand().(NotExpr).getOperand().(RelationalOperation).getLesserOperand().(SubExpr).getRightOperand().(VariableAccess).getTarget()=voffset_681
		and target_2.getArgument(0).(NotExpr).getOperand().(NotExpr).getOperand().(RelationalOperation).getGreaterOperand().(Literal).getValue()="14"
		and target_2.getArgument(1).(Literal).getValue()="0")
}

predicate func_3(Function func) {
	exists(BitwiseOrExpr target_3 |
		target_3.getValue()="544"
		and target_3.getLeftOperand().(Literal).getValue()="32"
		and target_3.getRightOperand().(Literal).getValue()="512"
		and target_3.getEnclosingFunction() = func)
}

predicate func_4(Function func) {
	exists(Literal target_4 |
		target_4.getValue()="2048"
		and target_4.getEnclosingFunction() = func)
}

predicate func_5(Variable vnp_674) {
	exists(PointerFieldAccess target_5 |
		target_5.getTarget().getName()="queues"
		and target_5.getQualifier().(VariableAccess).getTarget()=vnp_674)
}

from Function func, Variable vnp_674, Variable vpage_680, Parameter vskb_672, Variable voffset_681, Variable vnskb_688, Variable vvmemmap_base
where
func_0(vskb_672)
and not func_1(vnp_674, vpage_680, vskb_672, vnskb_688, vvmemmap_base)
and func_2(voffset_681)
and func_3(func)
and func_4(func)
and vnp_674.getType().hasName("netfront_info *")
and func_5(vnp_674)
and vpage_680.getType().hasName("page *")
and vskb_672.getType().hasName("sk_buff *")
and voffset_681.getType().hasName("unsigned int")
and vnskb_688.getType().hasName("sk_buff *")
and vvmemmap_base.getType().hasName("unsigned long")
and vnp_674.getParentScope+() = func
and vpage_680.getParentScope+() = func
and vskb_672.getParentScope+() = func
and voffset_681.getParentScope+() = func
and vnskb_688.getParentScope+() = func
and not vvmemmap_base.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
