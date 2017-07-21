package com.zdz.hbwj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zdz.hbwj.pojo.sys.SysUser;

public class ShopEmpInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		//获取访问的根路径
		 String path = request.getContextPath();
		 //获取请求的路径		
		 HttpSession session =request.getSession();
		 SysUser  user =  (SysUser) session.getAttribute("user");
		 if(user!=null){
			 return true;
		 }else{
			 //如何用户session 超时或者不存在则让其返回到登录页面 			 
			 response.sendRedirect(path+"/hbwj/enter/index");
			 return false;
		 }
	}

}
