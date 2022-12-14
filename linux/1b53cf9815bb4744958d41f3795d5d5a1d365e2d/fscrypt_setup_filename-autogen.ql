/**
 * @name linux-1b53cf9815bb4744958d41f3795d5d5a1d365e2d-fscrypt_setup_filename
 * @id cpp/linux/1b53cf9815bb4744958d41f3795d5d5a1d365e2d/fscrypt-setup-filename
 * @description linux-1b53cf9815bb4744958d41f3795d5d5a1d365e2d-fscrypt_setup_filename NULL
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Parameter vdir_339) {
	exists(FunctionCall target_0 |
		target_0.getTarget().hasName("fscrypt_get_crypt_info")
		and not target_0.getTarget().hasName("fscrypt_get_encryption_info")
		and target_0.getArgument(0).(VariableAccess).getTarget()=vdir_339)
}

from Function func, Parameter vdir_339
where
func_0(vdir_339)
and vdir_339.getType().hasName("inode *")
and vdir_339.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
