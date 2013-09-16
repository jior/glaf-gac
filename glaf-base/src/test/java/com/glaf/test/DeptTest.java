package com.glaf.test;

import org.junit.Test;

import com.glaf.base.modules.sys.service.SysDepartmentService;
import com.glaf.base.test.AbstractTest;

public class DeptTest extends AbstractTest {
	protected SysDepartmentService sysDepartmentService;

	@Test
	public void testDelete() {
		sysDepartmentService = super.getBean("sysDepartmentService");
		sysDepartmentService.delete(7);
	}
}
