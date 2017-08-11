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
import com.zdz.hbwj.util.CodeUtil;
import com.zdz.hbwj.util.Md5Tool;
import com.zdz.hbwj.util.PhoneUtil;
import com.zdz.hbwj.util.RedisUtil;

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
	
	//进入用户注册页面
	@RequestMapping("index")
	public String index(){
		return "index/index";
		}
	
	//进入用户注册页面
	@RequestMapping("register")
	public String register(){
		return "index/register";
	    }
	
	//进入帮助页面
	@RequestMapping("help")
	public String help(){
	     return "index/help";
		}
	
	//获取手机验证码
	@RequestMapping("sendCode")
	@ResponseBody
	public Map<String,Object> sendCode(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		//获取手机号码
		String phone = request.getParameter("phone");
		try {
			//发送请求获取验证码
			String code = CodeUtil.sendSMSCode(phone);
			//写入redis中
			RedisUtil.set(phone, code);
			//设置redis 的过期时间
	    	//RedisUtil.setExpire(phone,120);
			//将验证码返回给前端
			map.put("result", 0);
		} catch (Exception e) {
			e.printStackTrace();
			//系统异常 获取失败
		    map.put("result",1);
		}
		return map;		
	}
	
	
	//商家注册
	@RequestMapping("userRegister")
	@ResponseBody
	public Map<String,Object> userRegister(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map< String,Object> map = new  HashMap<String, Object>();
		//获取验电话号码
		String  phone1 = request.getParameter("phone");
		//获取密码
		String pwd = request.getParameter("password");
		//获取验证码
		String code =request.getParameter("code");
		//通过电话号码去从redis中获取验证码
		String code1 = RedisUtil.get(phone1);
		//匹配验证码是否一致
		if(!code.equals(code1)){
			map.put("result", "2");
			return map;
		}
		try {
			//注册商家用户信息
			SysUser user = new SysUser();
			String phone = phone1;
			String user_pwd = Md5Tool.getMd5(pwd);
			String uuid = UUID.randomUUID().toString();
			user.setUser_id(uuid);
			user.setUser_name(phone);
			user.setUser_pwd(user_pwd);
			user.setUser_parent("admin");
			//1:商家已注册  2:提交审核 3:审核通过 4:审核不通过
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
			map.put("result","0");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "1");
			return map;
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
