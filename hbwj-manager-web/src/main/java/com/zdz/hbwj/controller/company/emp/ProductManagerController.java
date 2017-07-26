package com.zdz.hbwj.controller.company.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/hbwj/enter/emp/")
public class ProductManagerController {

	//查看商家店铺审核信息
	@RequestMapping("companyEmpProduct")
	public String  companyEmpProduct(HttpServletRequest request,
			HttpServletResponse response){
		return "companyEmp/companyEmpProductManager";
	}
}
