package com.zdz.hbwj.controller.other;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hbwj/enter/common/")
public class CommonController {
		
	   //商家申请店铺时的状态转跳的路径
	  @RequestMapping("findReviewInfo")
	  public  String  findReviewInfo(HttpServletRequest request,
			  HttpServletResponse response){
		 return "reviewResult";
		  
	  }
}
