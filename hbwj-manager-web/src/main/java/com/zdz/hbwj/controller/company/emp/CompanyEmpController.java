package com.zdz.hbwj.controller.company.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.shop.TShopReview;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.shop.ShopService;

/**
 * 
 * @author Administrator
 *公司员工页面的控制器
 */
@Controller
@RequestMapping(value="/hbwj/enter/emp/")
public class CompanyEmpController {

	@Autowired
	private ShopService shopService;

	//进入公司管理员首页
	@RequestMapping(value = "index")
	public String enterEmp(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		SysUser user = (SysUser) session.getAttribute("user");
		request.setAttribute("user", user);
		return "companyEmp/companyEmp";
	}
	
		@RequestMapping(value="reviewShoper")
		public String reviewShoper(HttpServletRequest request,
				HttpServletResponse response){
			  //获取审核主键
		      String id =	request.getParameter("id");
		      Map<String,Object> map = new HashMap<String,Object>();
		      map.put("id",id);
		      //查询相应的主键的信息
		      try {
		    	TShopReview review =  shopService.findTShopReviewInfo(map);
		    	request.setAttribute("review",review);
		    	return "authorityShoper";
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		      
		}
		
		
		//公司员工进入商家店铺申请列表页面
		@RequestMapping("companyEmpReview")
		public String  companyEmpReview(){
			return "companyEmp/companyAdminShoper";
		}
		//查询商家审核信息分页数据
		@RequestMapping(value="findTShopReviewList")
		public void findTShopReviewList(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> map1 = new HashMap<String,Object>();
			Map<String,Object> condition = new HashMap<String,Object>();
			
			try {
			     //获取查询条件
			String user_name = request.getParameter("user_name");
			String status = request.getParameter("apply_status");
			if(status==null || status==""){
				map.put("apply_status",null);
			}else {
				map.put("apply_status",status);
			}
			map.put("user_name",user_name);
			condition.put("user_name",user_name);
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
		    List<TShopReview>	list = shopService.findTShopReviewList(map);
		    map1.put("rows", list);
		    //用户总条数
		    int count = shopService.findTShopReviewCount(condition);
		    map1.put("total", count);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map1);
			out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//公司管理员进入商家店铺资料审核页面
		@RequestMapping("ReviewAuthority")
		public String  ReviewAuthority(HttpServletRequest request,
				HttpServletResponse response){
			Map<String, Object> map = new HashMap<String, Object>();
			// 获取审核主键
			String id = request.getParameter("id");
			map.put("id", id);
			// 查询相应的主键的信息
			try {
				TShopReview review = shopService.findTShopReviewInfo(map);
				request.setAttribute("review", review);
				return "companyEmp/authorityShoper";
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			
		}
		
		//商家店铺申请审核通过
		@RequestMapping(value="reviewApply")
		@Transactional
		public void reviewApply(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			try {
			   //获取商家审核表的id 和用户的用户名主键id
			   String id =  request.getParameter("id");
			   //更新商家店铺申请状态和此商家的状态
			   Map<String,Object> map1 = new HashMap<String,Object>();
			   map1.put("id",id);
			   map1.put("apply_status",2);
			   Map<String,Object> map2 = new HashMap<String,Object>();
			   map2.put("user_name",id);
			   map2.put("status",2);
			   shopService.updateShoperInfo(map1, map2);
			   //审核提交成功
			   data.put("result", "0");
			   String json = mapper.writeValueAsString(data);
			   out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
				  //审核提交失败
				   data.put("result", "1");
				   String json = mapper.writeValueAsString(data);
				   out.write(json);
			}
			
		}
		
		//商家店铺审核不通过
		@RequestMapping(value="refuseAuthority")
		@Transactional
		public void refuseAuthority(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			try {
			   //获取商家审核表的id 和用户的用户名主键id
			   String id =  request.getParameter("id");
			   String reserved2 = request.getParameter("reserved2");
			   //更新商家店铺申请状态和此商家的状态
			   Map<String,Object> map1 = new HashMap<String,Object>();
			   map1.put("id",id);
			   map1.put("apply_status",3);
			   map1.put("reserved2",reserved2);
			   Date date  = new Date();
			   map1.put("passApply",date);
			   Map<String,Object> map2 = new HashMap<String,Object>();
			   map2.put("user_name",id);
			   map2.put("status",3);
			   shopService.updateShoperInfo(map1, map2);
			   //审核提交成功
			   data.put("result", "0");
			   String json = mapper.writeValueAsString(data);
			   out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
				  //审核提交失败
				   data.put("result", "1");
				   String json = mapper.writeValueAsString(data);
				   out.write(json);
			}
			
		}
		
		//查看商家店铺审核信息
		@RequestMapping("viewAuthorityInfo")
		public String  viewAuthorityInfo(HttpServletRequest request,
				HttpServletResponse response){
			// 获取审核主键
			String id = request.getParameter("id");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			// 查询相应的主键的信息
			try {
				TShopReview review = shopService.findTShopReviewInfo(map);
				request.setAttribute("review", review);
				return "companyEmp/viewAthority";
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			
		}
	
}
