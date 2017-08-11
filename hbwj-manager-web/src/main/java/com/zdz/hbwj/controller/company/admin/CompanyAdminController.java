package com.zdz.hbwj.controller.company.admin;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;
import com.zdz.hbwj.service.admin.UserManagerService;

import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.Md5Tool;

/**
 * 公司管理员的页面的控制器
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/hbwj/enter/admin/")
public class CompanyAdminController {

	@Autowired
	private UserManagerService userManager;
	@Autowired
	private SysUserService sysUserService;

	// 进入公司管理员首页
	@RequestMapping("index")
	public String enterAdmin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String path = request.getContextPath();
		//获取请求参数
		String user_name =request.getParameter("user_name");
		HttpSession session = request.getSession();
		SysUser user = (SysUser) session.getAttribute(user_name);
		if(user==null || user.equals("")){
			response.sendRedirect(path+"/hbwj/enter/noRight");
		}
		request.setAttribute("user", user);
		return "companyAdmin/companyAdmin";
	}
	
	//进入公司管理员页面的员工管理页面
	@RequestMapping("companyAdminEmp")
	public String companyAdminEmp(HttpServletRequest request, HttpServletResponse response) {
		return "companyAdmin/companyAdminEmp";
	}
	
	//公司管理员进入商家店铺申请资料页面
	@RequestMapping("companyAdminShoper")
	public String companyAdminShoper( HttpServletRequest request, HttpServletResponse response) {
		return "companyAdmin/companyAdminShoper";
	}
	// 分页查询公司员工以及用户的数量
	@RequestMapping("findUserList")
	public void findUserList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> condition = new HashMap<String, Object>();

		try {
			// 获取插叙条件
			String user_name = request.getParameter("user_name");
			map.put("user_name", user_name);
			condition.put("user_name", user_name);
			// 获取dataGrid 的传输的参数的当前页
			String page1 = request.getParameter("page");
			// 获取每页显示多少条数据
			int pageSize = Integer.parseInt(request.getParameter("rows"));

			int start = 0;
			if (page1 == null || page1.equals("")) {
				map.put("start", start);
			} else {
				int page = Integer.parseInt(page1);
				start = (page - 1) * pageSize;
				map.put("start", start);
			}
			map.put("end", pageSize);
			// 用户信息
			List<SysUser> list = userManager.findUserList(map);
			map1.put("rows", list);
			// 用户总条数
			int count = userManager.findUserCount(condition);
			map1.put("total", count);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map1);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加公司员工
	@RequestMapping("addComShop")
	@ResponseBody
	public void addComShop(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		// 请求参数
		String user_name = request.getParameter("username");
		// 通过用户名查询用户是否存在
		SysUser user1 = sysUserService.findSysUser(user_name);
		if (user1 != null) {
			// 0表示用户名已存在
			map.put("result", 0);
			String json = mapper.writeValueAsString(map);
			out.write(json);

		} else {
			String passWord1 = request.getParameter("password");
			String user_pwd = Md5Tool.getMd5(passWord1);
			String uuid = UUID.randomUUID().toString();
			SysUser user = new SysUser();
			try {
				user.setUser_id(uuid);
				user.setUser_name(user_name);
				user.setUser_pwd(user_pwd);
				user.setUser_parent("admin");
				user.setStatus(0);
				Date date = new Date();
				user.setCreateTime(date);
				Date date1 = new Date();
				user.setUpdateTime(date1);
				// 插入员工角色
				UserRole role = new UserRole();
				role.setUser_id(user.getUser_id());
				role.setRole_id(2);
				sysUserService.addSysUser(user,role);				
				// 1:添加用户成功
				map.put("result", 1);
				String json = mapper.writeValueAsString(map);
				out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
				// 添加用户失败
				map.put("result", "2");
				String json = mapper.writeValueAsString(map);
				out.write(json);
			}
		}

	}

	// 修改公司员工密码
	@RequestMapping("updateComShop")
	public void updateSysUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("username");
			String user_pwd = Md5Tool.getMd5(request.getParameter("password"));

			SysUser user = new SysUser();
			user.setUser_id(user_id);
			user.setUser_name(user_name);
			user.setUser_pwd(user_pwd);
			Date date = new Date();
			user.setUpdateTime(date);
			userManager.updateSysUserInfo(user);
			map.put("result", 1);
			String json = mapper.writeValueAsString(map);
			out.write(json);
		} catch (Exception e) {
			map.put("result", 2);
			String json = mapper.writeValueAsString(map);
			out.write(json);
		}

	}

	// 删除公司员工
	@RequestMapping("deleteSysUser")
	public void deleteSysUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			String user_id = request.getParameter("user_id");
			userManager.deleteSysUser(user_id);
			map.put("result", 0);
			String json = mapper.writeValueAsString(map);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", 1);
			String json = mapper.writeValueAsString(map);
			out.write(json);
		}
	}

}
