package com.zdz.hbwj.controller.shoper.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;
import com.zdz.hbwj.service.admin.UserManagerService;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

/**
 * 
 * @author Administrator 商家管理员控制器
 */
@Controller
@RequestMapping(value = "/hbwj/enter/shoper/")
public class ShoperAdminController {

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private UserManagerService userManager;

	// 进入商家管理员页面
	@RequestMapping("index")
	public String enterManager(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		SysUser user = (SysUser) session.getAttribute("user");
		request.setAttribute("user", user);
		return "shopAdmin";
	}
	
	//分页查询商家所属的员工
		@RequestMapping("findChildEmp")
		public void findChildEmp(HttpServletRequest request,
				  HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> map1 = new HashMap<String,Object>();
			Map<String,Object> condition = new HashMap<String,Object>();
			
			try {
			     //获取插叙条件
			String user_parent = request.getParameter("user_parent");
			map.put("user_parent",user_parent);
			condition.put("user_parent",user_parent);
				//获取dataGrid 的传输的参数的当前页
			String page1 = request.getParameter("page");
			    //获取每页显示多少条数据
			int pageSize = Integer.parseInt(request.getParameter("rows"));
			
			int start = 0;
			if(page1==null|| page1.equals("")){
				map.put("start", start);
			}else{
				int page = Integer.parseInt(page1);
				start=(page-1)*pageSize;
				map.put("start", start);
			}
			map.put("end", pageSize);
			//用户信息
		    List<SysUser>	list = userManager.findUserList(map);
		    map1.put("rows", list);
		    //用户总条数
		    int count = userManager.findUserCount(condition);
		    map1.put("total", count);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map1);
			out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
	
	//添加商家员工
		@RequestMapping("addShopEmp")
		public void addShopEmp(HttpServletRequest request,
				 HttpServletResponse response) throws IOException{
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> map = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
				
			    try {
			    	//请求参数
					String user_name = request.getParameter("username");
			    	String passWord1 =  request.getParameter("password");
			    	String user_parent = request.getParameter("user_parent");
			    	String  uuid = UUID.randomUUID().toString();
			    	SysUser user = new SysUser();
			    	user.setUser_id(uuid);
				    user.setUser_name(user_name);
				    user.setUser_pwd(Md5Tool.getMd5(passWord1));
				    user.setUser_parent(user_parent);
				    user.setStatus(4);
				    Date date = new Date();
				    user.setCreateTime(date);
				    Date date1 = new Date();
				    user.setUpdateTime(date1);
				    
				       //插入员工角色
				    UserRole role = new UserRole();
				    role.setUser_id(uuid); 
					role.setRole_id(4);
					sysUserService.addSysUser(user, role);
						//1:添加用户成功
					map.put("result",1);			
					String json = mapper.writeValueAsString(map);
					out.write(json);
				} catch (Exception e) {
					e.printStackTrace();
					//添加用户失败
					map.put("result", "2");
					String json = mapper.writeValueAsString(map);
					out.write(json);
				}
			}
		
		
		//删除员工
		@RequestMapping("deleteSysUser")
		public void deleteSysUser(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> map = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			try {
				String user_id = request.getParameter("user_id");
				userManager.deleteSysUser(user_id);
				map.put("result",0);			
				String json = mapper.writeValueAsString(map);
				out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result",1);			
				String json = mapper.writeValueAsString(map);
				out.write(json);
			}
		}

		//测试所输入的电话号码是否已经被注册过
		@RequestMapping("testPhone")
		public void testPhone(HttpServletRequest request,
				 HttpServletResponse response) throws IOException{	
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> map = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			//请求参数
			String user_name = request.getParameter("username");
			SysUser  user1 = sysUserService.findSysUser(user_name);
			if(user1!=null){
				//0表示用户名已存在
				map.put("result",0);			
				String json = mapper.writeValueAsString(map);
				out.write(json);
			}
		}

}
