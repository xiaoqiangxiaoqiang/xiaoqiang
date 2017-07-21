package com.zdz.hbwj.controller.company.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.pojo.shop.TShopReview;
import com.zdz.hbwj.service.shop.ShopService;

/**
 * 公司管理员审核查看商家的controller
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "hbwj/enter/admin/")
public class CompanyAdminReviewController {

	@Autowired
	private ShopService shopService;

	// 进入商家申请店铺页面
	@RequestMapping("reviewShoper")
	public String reviewShoper(HttpServletRequest request, HttpServletResponse response) {
		// 获取审核主键
		String id = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		// 查询相应的主键的信息
		try {
			TShopReview review = shopService.findTShopReviewInfo(map);
			request.setAttribute("review", review);
			return "authorityShoper";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	
	@RequestMapping("findTShopReviewList")
	public void findTShopReviewList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> condition = new HashMap<String, Object>();

		try {
			// 获取查询条件
			String user_name = request.getParameter("user_name");
			String apply_status = request.getParameter("apply_status");
			if(apply_status==null || apply_status.equals("")||apply_status.equals("0")){
				condition.put("apply_status",null);
				map.put("apply_status",null);
			}else {
			  int status= Integer.parseInt(apply_status);
				map.put("apply_status",status);
			}
			
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
			List<TShopReview> list = shopService.findTShopReviewList(map);
			map1.put("rows", list);
			// 用户总条数
			int count = shopService.findTShopReviewCount(condition);
			map1.put("total", count);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map1);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 商家店铺审核通过
	@RequestMapping("reviewApply")
	@Transactional
	public void reviewApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> data = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			// 获取商家审核表的id 和用户的用户名主键id
			String id = request.getParameter("id");
			// 更新商家店铺申请状态和此商家的状态
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("id", id);
			map1.put("apply_status", 2);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("user_name", id);
			map2.put("status", 2);
			shopService.updateShoperInfo(map1, map2);
			// 审核提交成功
			data.put("result", "0");
			String json = mapper.writeValueAsString(data);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
			// 审核提交失败
			data.put("result", "1");
			String json = mapper.writeValueAsString(data);
			out.write(json);
		}

	}

	// 商家审核不通过
	@RequestMapping("refuseAuthority")
	@Transactional
	public void refuseAuthority(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> data = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			// 获取商家审核表的id 和用户的用户名主键id
			String id = request.getParameter("id");
			String reserved2 = request.getParameter("reserved2");
			// 更新商家店铺申请状态和此商家的状态
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("id", id);
			map1.put("apply_status", 3);
			map1.put("reserved2", reserved2);
			Date date = new Date();
			map1.put("passApply", date);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("user_name", id);
			map2.put("status", 3);
			shopService.updateShoperInfo(map1, map2);
			// 审核提交成功
			data.put("result", "0");
			String json = mapper.writeValueAsString(data);
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
			// 审核提交失败
			data.put("result", "1");
			String json = mapper.writeValueAsString(data);
			out.write(json);
		}

	}

}
