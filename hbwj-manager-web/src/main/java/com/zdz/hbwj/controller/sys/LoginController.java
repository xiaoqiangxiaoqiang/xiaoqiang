package com.zdz.hbwj.controller.sys;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.admin.UserManagerService;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

@Controller
@RequestMapping(value="/hbwj/")
public class LoginController {
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("login")
	public void login(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				
				//获取访问的根路径
		        String path = request.getContextPath();
		        //处理post请求乱码
				response.setContentType("application/json; charset=utf-8");
		        //获取用户名
			    String username =request.getParameter("username");
				//获取密码
			    String userpwd = Md5Tool.getMd5(request.getParameter("password"));
			    //通过用户名去查找密码
			    SysUser user = sysUserService.findSysUser(username);
			
			//判断用户名和密码的正确性
			if(user==null||user.equals("")){
				//判断用户不存在
	     		response.sendRedirect(path+"/hbwj/index?param=0");
	     		return;
			}else{
				//密码如果不存在
				if(!userpwd.equals(user.getUser_pwd())){
					//员工管理页
		     		response.sendRedirect(path+"/hbwj/index?param=1");
		     		return;
				}
				//用户名和密码都存在
				if(username.equals(user.getUser_name())&&userpwd.equals(user.getUser_pwd())){
					//通过用户名查询用户所对应的权限					
					List <String> list =sysUserService.findRoles(username);
					HttpSession session =request.getSession();
					user.setUser_pwd("");
					//将用户信息存入session中
					session.setAttribute("user", user);
					//将用户的角色存入到session中
			     	session.setAttribute("roles", list);
			     	if(list.contains("ROLE_COMAdmin")){
			     		//公司管理员页面	     		
			     		response.sendRedirect(path+"/hbwj/enter/admin");
			     		return ;
			     	}
			     	if(list.contains("ROLE_COMEmp")){
			     		//员工管理页面
			     		response.sendRedirect(path+"/hbwj/enter/emp");
			     		return ;
			     	}
			     	if(list.contains("ROLE_SHOPAdmin")){
			     		//商家管理员页面  未申请店铺的上家
			     		if(user.getStatus()==1){
			     			//重定向到商家审核页面
			     			response.sendRedirect(path+"/hbwj/shop/Authority");
			     			return ;
			     		}
			     		//商家管理员页面
			     		if(user.getStatus()==2){
			     			//重定向到商家管理页面  已经申请商家店铺
			     			response.sendRedirect(path+"/hbwj/enter/ShopManager");
			     			return ;
			     		}
			     		
			     		//商家提交的商户入驻的资料审核不通过页面
			     		if(user.getStatus()==3){
			     			response.sendRedirect(path+"/hbwj/enter/ShopFail");
			     			return ;
			     		}
			     	}			     	
			     	if(list.contains("ROLE_SHOPEmp")){
			     		if(user.getStatus()==4){
			     			//重定向到商家员工页面
			     			response.sendRedirect(path+"/hbwj/shop/emp");
			     			return ;
			     		}
			     		
			     		if(user.getStatus()==5){
			     			//重定向到商家员工无权限页面
			     			response.sendRedirect(path+"/hbwj/shop/failEmp");
			     			return ;
			     		}
			     		
			     	  }
				  }
			  }

         }
	
	
	//重定向到公司员工页面
	@RequestMapping("enter/emp")
	public String enterEmp(ModelMap map){
			return "companyEmp";
		}
	
		
	//重定向到错误的页面
	@RequestMapping("enter/error")
	public String enterError(ModelMap map){			
			return "error";
		}
   
	//重定向到商家员工页面
	@RequestMapping("shop/emp")
	public String enterShopEmp(ModelMap map){
			return "shopEmp";
		}
}
