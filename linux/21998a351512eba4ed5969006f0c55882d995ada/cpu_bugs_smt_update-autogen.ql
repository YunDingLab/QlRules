/**
 * @name linux-21998a351512eba4ed5969006f0c55882d995ada-cpu_bugs_smt_update
 * @id cpp/linux/21998a351512eba4ed5969006f0c55882d995ada/cpu_bugs_smt_update
 * @description linux-21998a351512eba4ed5969006f0c55882d995ada-cpu_bugs_smt_update 
 * @kind problem
 * @tags security
 */

import cpp

predicate func_0(Variable vspectre_v2_user) {
	exists(VariableAccess target_0 |
		target_0.getTarget()=vspectre_v2_user)
}

from Function func, Variable vspectre_v2_user
where
func_0(vspectre_v2_user)
and not vspectre_v2_user.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
