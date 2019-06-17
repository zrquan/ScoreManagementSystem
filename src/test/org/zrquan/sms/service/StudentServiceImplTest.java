package org.zrquan.sms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;

public class StudentServiceImplTest extends BaseTest {
	@Autowired
	StudentServiceImpl studentService;

	@Test
	public void testGetScoreInfo() {
		String json = studentService.getScoreInfo("16369003");
		System.out.println(json);
	}

	@Test
	public void testGetCreditInfo() {
		String json = studentService.getCreditInfo("16369003");
		System.out.println(json);
	}
}