/**
 * @name linux-5d069dbe8aaf2a197142558b6fb2978189ba3454-fuse_dir_fsync
 * @id cpp/linux/5d069dbe8aaf2a197142558b6fb2978189ba3454/fuse-dir-fsync
 * @description linux-5d069dbe8aaf2a197142558b6fb2978189ba3454-fuse_dir_fsync fs/fuse/dir.c
 * @kind problem
 * @problem.severity error
 * @tags security
 */

import cpp

predicate func_0(Variable vinode_1379) {
	exists(FunctionCall target_0 |
		target_0.getTarget().hasName("is_bad_inode")
		and not target_0.getTarget().hasName("fuse_is_bad")
		and target_0.getArgument(0).(VariableAccess).getTarget()=vinode_1379)
}

from Function func, Variable vinode_1379
where
func_0(vinode_1379)
and vinode_1379.getType().hasName("inode *")
and vinode_1379.getParentScope+() = func
select func, "function relativepath is " + func.getFile().getRelativePath(), "function startline is " + func.getLocation().getStartLine()
