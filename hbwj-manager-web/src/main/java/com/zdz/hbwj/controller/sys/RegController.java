package com.zdz.hbwj.controller.sys;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

@Controller
public class RegController {
	
	@Autowired
	private SysUserService sysUserService;
	
	
	//进入网站首页
	@RequestMapping(value="/hbwjR/index",method=RequestMethod.GET)
	public String index(ModelMap map){
		
		return "login";
		
	}
	
	@RequestMapping(value="/hbwjR/register",method=RequestMethod.POST)
	@ResponseBody
	public void  Register(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out =  response.getWriter();
		String result = "0";
		Map< String,Object> map = new  HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {			
			SysUser user = new SysUser();
			String phone =  request.getParameter("phone");
			String user_pwd = Md5Tool.getMd5(request.getParameter("password"));
			user.setUser_name(phone);
			user.setUser_pwd(user_pwd);
			user.setUser_parent("admin");
			user.setStatus(0);
			Date date = new Date();		
			user.setCreateTime(date);
			Date date1 = new Date();			
			user.setUpdateTime(date1);
			sysUserService.addSysUser(user);
			map.put("result",result);			
			String json = mapper.writeValueAsString(map);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "1");
			String json = mapper.writeValueAsString(map);
			out.write(json);
		}
	}
	
	//验证手机号码是否被注册
		@RequestMapping(value="/hbwjR/findFalse")
		@ResponseBody
		public void findFalse(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			 response.setContentType("application/json; charset=utf-8");
			 PrintWriter out =  response.getWriter();
		     String user_name = request.getParameter("phoneNum");
		     SysUser user =  sysUserService.findSysUser(user_name);
		     Map< String,Object> map = new  HashMap<String, Object>();
		  ObjectMapper mapper = new ObjectMapper();
		    if(user==null ||user.equals("")){	    	
				map.put("result","0");//0 :用户不存在
				String json = mapper.writeValueAsString(map);
				out.write(json);
		    }else{
		    	map.put("result","1");//1:用户存在
				String json = mapper.writeValueAsString(map);
				out.write(json);
		    }
		}

}
