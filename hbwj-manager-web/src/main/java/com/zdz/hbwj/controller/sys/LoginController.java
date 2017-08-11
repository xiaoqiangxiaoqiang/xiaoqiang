package com.zdz.hbwj.controller.sys;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

/**
 * 
 * @author Administrator
 *进入网站首页和进入登录页面的控制器
 */
@Controller
@RequestMapping(value="/hbwj/enter/")
public class LoginController {
	@Autowired
	private SysUserService sysUserService;
	
	
	    //进入登录页面
		@RequestMapping("login")
		public String index(ModelMap map,HttpServletRequest request,
					HttpServletResponse response){
		     String num = request.getParameter("param");
		     if(num==null || num.equals("")){
		    	  return "index/login";
		     }else{
		    	 if(num.equals("0")){
		    		 request.setAttribute("massage", "用户名不存在");
		    		 return "index/login";	    		 
		    	 }else if(num.equals("1")){
		    		 request.setAttribute("message", "密码不正确");    		
		    		 return "index/login";
		    	 }else{
		    		 return null;
		    	 }
		     }
		}
	
	//用户提交用户名密码正式进入首页
	@RequestMapping("userLogin")
	public void userLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException{
		
		//获取更路经
		String path =request.getContextPath();
		//获取用户名
		String username =request.getParameter("username");
		//获取密码
		String userpwd = Md5Tool.getMd5(request.getParameter("password"));
		//查询该用户是否存在
		SysUser user = sysUserService.findSysUser(username);
		//判断用户名和密码的正确性
		if(user==null||user.equals("")){
			//判断用户不存在
			request.setAttribute("message", "用户名不存在");
			request.getRequestDispatcher("/WEB-INF/jsp/index/login.jsp").forward(request, response);
     		return ;
		}else{
			if(username.equals(user.getUser_name())&&userpwd.equals(user.getUser_pwd())){
				//通过用户名查询用户所对应的权限					
				List <String> list =sysUserService.findRoles(username);
				//获取httpSession
				HttpSession session =request.getSession();
				//将密码设置为空
				user.setUser_pwd("");
				//将用户信息保存到session中
				session.setAttribute(user.getUser_name(), user);
				System.out.println(session.getAttribute(user.getUser_name()));
				//将用户的角色存入到session中
		     	session.setAttribute("roles", list);
		     	//进入公司管理员页面
		     	if(list.contains("ROLE_COMAdmin")){
		     		//公司管理员首页
		     		response.sendRedirect(path+"/hbwj/enter/admin/index?user_name="+user.getUser_name());
		     		return ;
		     	     }
		     	//进入公司员工页面
		     	if(list.contains("ROLE_COMEmp")){
		     		//公司员工首页
		     		response.sendRedirect(path+"/hbwj/enter/emp/index?user_name="+user.getUser_name());
		     		return ;
		     		 }
		     	//进入商家管理员页面
		     	if(list.contains("ROLE_SHOPAdmin")){
		     		//商家管理员 申请店铺主页 1:商家只注册账号
		     		if(user.getStatus()==1){
		     			//进入商家店铺申请主页
		     			response.sendRedirect(path+"/hbwj/shop/Authority?user_name="+user.getUser_name());
		     			return ;
		     		}
		     		/*
		     		 * 商家管理员审核失败 2:商家已提交店铺审核资料 处于待审核 4:审核不通过
		     		 * 当商家以2的状态进入会进入到审核信息查看页面  以4:状态进入也是进入查看页面 
		     		 * 此时是可以查看审核不通过的详细信息 同时可以再次进行修改审核信息重新提交
		     		 */
		     		if(user.getStatus()==2 ){
		     			//重定向到商家管理页面  已经申请商家店铺
		     			response.sendRedirect(path+"/hbwj/enter/shoper/reviewDetail?user_name="+user.getUser_name());
		     			return ;
		     		}
		     		
		     		//店铺资料审核成功
		     		if(user.getStatus()==3){
		     			//审核成功 则进入商家管理页面首页
		     			response.sendRedirect(path+"/hbwj/enter/shoper/index?user_name="+user.getUser_name());
		     			return ;
		     		}
		     		//店铺资料审核不成功
		     		if(user.getStatus()==4){
		     			//店铺资料审核不成功时重新提价审核页面
		     			response.sendRedirect(path+"/hbwj/enter/shoper/reApply?user_name="+user.getUser_name());
		     			return ;
		     		}
		     		//进入商家员工主页
		     		if(user.getStatus()==5){
		     			//商家员工主页
		     			response.sendRedirect(path+"/hbwj/enter/shopEmp/index?user_name="+user.getUser_name());
		     			return ;
		     		}
			}
		  }else{
				//输入密码有误
				request.setAttribute("message", "输入密码有误");
				request.getRequestDispatcher("/WEB-INF/jsp/index/login.jsp").forward(request, response);
				return ;
			}
		}
	}
	
	   //进入忘记密码页面
		@RequestMapping("forget")
		public String forget(ModelMap map){			
				return "index/forget";
			}
	
		//进入忘记密码页面
		@RequestMapping("rule")
		public String rule(){			
			return "index/rule";
		}
		
	
	
	//重定向到无权限的页面
		@RequestMapping("noRight")
		public String noRight(){			
			return "other/noRight";
		}
		
	//重定向到错误的页面
	@RequestMapping("enter/error")
	public String enterError(ModelMap map){			
			return "error";
		}
 
	@RequestMapping("shoper/reviewFail")
	public String reviewFail(ModelMap map){
			//进入商家审核不通过页面
			return "reviewResult";
		}
	
	
}
