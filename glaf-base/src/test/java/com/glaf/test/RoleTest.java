package com.glaf.test;

import org.junit.Test;

import com.glaf.base.modules.sys.service.SysRoleService;
import com.glaf.base.test.AbstractTest;

public class RoleTest extends AbstractTest{
	
	protected SysRoleService sysRoleService;
	
	@Test
	public void deleteRole(){
		sysRoleService = super.getBean("sysRoleService");
		sysRoleService.delete(19);
	}

}
