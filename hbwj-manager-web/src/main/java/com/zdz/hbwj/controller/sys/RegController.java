package com.zdz.hbwj.controller.sys;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
import com.zdz.hbwj.pojo.sys.UserRole;
import com.zdz.hbwj.service.admin.UserManagerService;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

/***
 * 
 * @author Administrator
 *注册的控制器 进行商家的注册信息的控制器
 */
@Controller
@RequestMapping(value="/hbwj/enter/")
public class RegController {
	
	@Autowired
	private SysUserService sysUserService;
	//进入网站首页
	@RequestMapping("index")
	public String index(ModelMap map,HttpServletRequest request,
				HttpServletResponse response){
	     String num = request.getParameter("param");
	     if(num==null || num.equals("")){
	    	 return "login";
	     }else{
	    	 if(num.equals("0")){
	    		 request.setAttribute("massage", "用户名不存在");
	    		 return "login";	    		 
	    	 }else if(num.equals("1")){
	    		 request.setAttribute("message", "密码不正确");    		
	    		 return "login";
	    	 }else{
	    		 return null;
	    	 }
	     }
				
		
	}
	
	//商家注册
	@RequestMapping("register")
	@ResponseBody
	public void  Register(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out =  response.getWriter();
		String result = "0";
		Map< String,Object> map = new  HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			//注册商家用户信息
			SysUser user = new SysUser();
			String phone =  request.getParameter("phone");
			String user_pwd = Md5Tool.getMd5(request.getParameter("password"));
			String uuid = UUID.randomUUID().toString();
			user.setUser_id(uuid);
			user.setUser_name(phone);
			user.setUser_pwd(user_pwd);
			user.setUser_parent("admin");
			//1:商家正常注册  2:提交审核 3:审核通过 4:审核不通过
			user.setStatus(1);
			Date date = new Date();		
			user.setCreateTime(date);
			Date date1 = new Date();			
			user.setUpdateTime(date1);
			
			//添加用户的角色
			UserRole role = new UserRole();
			role.setUser_id(uuid);
			role.setRole_id(3);
			//考虑事务回滚
			sysUserService.addSysUser(user,role);
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
		@RequestMapping("findFalse")
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
