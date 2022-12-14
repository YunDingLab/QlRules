/**
 * @name linux-c3e2219216c92919a6bd1711f340f5faa98695e6-blk_exit_queue
 * @id cpp/linux/c3e2219216c92919a6bd1711f340f5faa98695e6/blk-exit-queue
 * @description linux-c3e2219216c92919a6bd1711f340f5faa98695e6-blk_exit_queue 
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Parameter vq_844) {
	exists(FunctionCall target_0 |
		target_0.getTarget().hasName("elevator_exit")
		and not target_0.getTarget().hasName("__elevator_exit")
		and target_0.getArgument(0).(VariableAccess).getTarget()=vq_844
		and target_0.getArgument(1).(PointerFieldAccess).getTarget().getName()="elevator"
		and target_0.getArgument(1).(PointerFieldAccess).getQualifier().(VariableAccess).getTarget()=vq_844)
}

from Function func, Parameter vq_844
where
func_0(vq_844)
and vq_844.getType().hasName("request_queue *")
and vq_844.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
