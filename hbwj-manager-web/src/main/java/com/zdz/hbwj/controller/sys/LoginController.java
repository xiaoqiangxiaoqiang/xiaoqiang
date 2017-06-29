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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

@Controller
@RequestMapping(value="/hbwj")
public class LoginController {
	@Autowired
	private SysUserService sysUserService;
		
	@RequestMapping("/login")
	public void login(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out =  response.getWriter();
				Map< String,Object> map = new  HashMap<String, Object>();
				ObjectMapper mapper = new ObjectMapper();
		        //获取用户名
			String username =request.getParameter("username");
				//获取密码
			String userpwd = Md5Tool.getMd5(request.getParameter("password"));
			SysUser user = sysUserService.findSysUser(username);
			
			//判断用户名和密码的正确性
			if(user==null||user.equals("")){
				map.put("result","0");
				String json = mapper.writeValueAsString(map);
				out.write(json);
			}else{
				
				if(!userpwd.equals(user.getUser_pwd())){
					map.put("result","1");
					String json = mapper.writeValueAsString(map);
					out.write(json);
				}
				if(username.equals(user.getUser_name())&&userpwd.equals(user.getUser_pwd())){
					//通过用户名查询用户所对应的权限					
					List <String> list =sysUserService.findRoles(username);
					HttpSession session =request.getSession();
					user.setUser_pwd("");
					session.setAttribute("user", user);
			     	session.setAttribute("roles", list);
			     	if(list.contains("ROLE_COMAdmin")){
			     		//公司管理员页面	     		
			     		response.sendRedirect("/hbwj/enter/admin");
			     		return ;
			     	}
			     	if(list.contains("ROLE_COMEmp")){
			     		//员工管理页面
			     		response.sendRedirect("/hbwj/enter/emp");
			     		return ;
			     	}
			     	if(list.contains("ROLE_SHOPAdmin")){
			     		//商家管理员页面
			     		if(user.getStatus()==0){
			     			//重定向到商家审核页面
			     			response.sendRedirect("/hbwj/shop/Authority");
			     			return ;
			     		}
			     		//商家管理员页面
			     		if(user.getStatus()==1){
			     			//重定向到商家管理页面
			     			response.sendRedirect("/hbwj/shop/manager");
			     			return ;
			     		}
			     	}			     	
			     	if(list.contains("ROLE_SHOPEmp")){
			     		//重定向到商家管理页面
		     			response.sendRedirect("/hbwj/shop/emp");
		     			return ;
			     	  }
				  }
			  }

         }

	//重定向到管理员页面
	@RequestMapping("/enter/admin")
	public String enterAdmin(ModelMap map){		
		return "companyAdmin";
	}
	
	//重定向到公司员工页面
	@RequestMapping("/enter/emp")
	public String enterEmp(ModelMap map){		
			return "companyEmp";
		}
	//重定向到商家审核页面
	@RequestMapping("/shop/Authority")
	public String enterAuthority(ModelMap map){		
			return "authority";
			}
	//重定向到商家管理员页面
	@RequestMapping("/shop/manager")
		public String enterManager(ModelMap map){		
			return "shopAdmin";
		}
		
	//重定向到错误的页面
	@RequestMapping("/enter/error")
	public String enterError(ModelMap map){			
			return "error";
		}
   
	//重定向到商家员工页面
	@RequestMapping("/shop/emp")
	public String enterShopEmp(ModelMap map){
			return "shopEmp";
		}
}
