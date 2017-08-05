package com.zdz.hbwj.controller.company.emp;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.mapper.goods.SkuMapper;
import com.zdz.hbwj.mapper.goods.SpuMapper;
import com.zdz.hbwj.mapper.shopper.ShoperMapper;
import com.zdz.hbwj.pojo.goods.TSku;
import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;
import com.zdz.hbwj.service.goods.GoodsService;

@Controller
@RequestMapping(value="/hbwj/enter/emp/")
public class ProductManagerController {
	
	@Autowired
	private GoodsService goodsService;
	
	//注入查询商家的信息
		@Autowired
		private ShoperMapper shopMapper;
		@Autowired
		private  SpuMapper spuMapper;
		@Autowired
		private  SkuMapper skuMapper;

	//查看商家店铺审核信息
	@RequestMapping("companyEmpProduct")
	public String  companyEmpProduct(HttpServletRequest request,
			HttpServletResponse response){
		return "companyEmp/companyEmpProductManager";
	}
	
   	
	//产品列表显示数据页面
	@RequestMapping("findTSpuList")
	public  void  findProductList(HttpServletRequest request,
		  			HttpServletResponse response) throws IOException{
		        response.setCharacterEncoding("UTF-8");
		        PrintWriter out = response.getWriter();
				Map<String, Object> map = new HashMap<String, Object>();
				Map<String, Object> map1 = new HashMap<String, Object>();
				Map<String, Object> condition = new HashMap<String, Object>();
				try {
					// 获取查询条件 商家id 即注册时的电话号码 此处为reserved1 为商家查询的主键
					String user_name = request.getParameter("reserved1");
					//根据商品的状态去查询商品信息
					String status1 = request.getParameter("status");
					//根据商品的货号
					String product_num = request.getParameter("productNum");
					//根据商品名
					String spu_name = request.getParameter("spu_name");
					
					if(status1==null || status1.equals("")||status1.equals("-1")){
						condition.put("status",null);
						map.put("status",null);
					}else {
					  int status= Integer.parseInt(status1);
					  //根据商品的状态
						map.put("status",status);
						condition.put("status",status);
					}
					
					//产品名称
					map.put("product_num",product_num);
					condition.put("product_num",product_num);
					
					//用户主键
					map.put("reserved1", user_name);
					condition.put("reserved1", user_name);
					
					//根据商品名
					map.put("spu_name", spu_name);
					condition.put("spu_name", spu_name);
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
					List<TSpu> list = goodsService.findTSpuList(map);
					map1.put("rows", list);
					// 用户总条数
					int count = goodsService.findTSpuCount(condition);
					map1.put("total", count);
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(map1);
					out.write(json);
				} catch (Exception e) {
					e.printStackTrace();
				}
		  	}	

	

	//进入查看商品页面
		@RequestMapping("lookProduct")
		public  String lookProduct(HttpServletRequest request, 
				HttpServletResponse response){
			String spuId = request.getParameter("spu_id");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("spu_id", spuId);
			TSpu spu = spuMapper.findTSpu(map);
			TSpuInfo spuInfo = spuMapper.findTSpuInfo(map);
			List<TSku> list = skuMapper.findTSkuList(map);
			//数据传输给查看页面
			request.setAttribute("spu", spu);
			request.setAttribute("spuInfo", spuInfo);
			request.setAttribute("list", list);
			return "companyEmp/viewProduct";
			
		}
		
	   //审核商品页面
		@RequestMapping("authorityProduct")
		public String authorityProduct(HttpServletRequest request, 
				HttpServletResponse response){
			String spuId = request.getParameter("spu_id");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("spu_id", spuId);
			TSpu spu = spuMapper.findTSpu(map);
			TSpuInfo spuInfo = spuMapper.findTSpuInfo(map);
			List<TSku> list = skuMapper.findTSkuList(map);
			//数据传输给查看页面
			request.setAttribute("spu", spu);
			request.setAttribute("spuInfo", spuInfo);
			request.setAttribute("list", list);
			return "companyEmp/reviewProduct";
		}
		
		
		
		//商品审核通过
		@RequestMapping("passReviewProduct")
		@ResponseBody
		public Map<String,Object> passReviewProduct(HttpServletRequest request){
			//创建map去跟新spu的信息
			Map<String,Object> map = new HashMap<>();
			Map<String,Object> result = new HashMap<>();
			//1.获取spu_id 去跟新spu的信息
			String spuId = request.getParameter("spu_id");
			map.put("spuId", spuId);
			//跟新时间
			map.put("updatetime", new Date());
			//获取更新spu的商品状态为2 表示审核通过
			map.put("status",2);
			try {
				goodsService.updateTSpuByMap(map);
				//表示跟新成功
				result.put("result", 0);
			} catch (Exception e) {
				e.printStackTrace();
				//更新失败
				result.put("result", 1);
			}
			
			return result;
			
		}
		
		
		//商品审核不通过
		@RequestMapping("refuseReviewProduct")
		@ResponseBody
		public Map<String,Object> refuseReviewProduct(HttpServletRequest request){
			//创建map去跟新spu的信息
			Map<String,Object> map = new HashMap<>();
			Map<String,Object> result = new HashMap<>();
			//1.获取spu_id 去跟新spu的信息
			String spuId = request.getParameter("spu_id");
			map.put("spuId", spuId);
			//跟新时间
			map.put("updatetime", new Date());
			//审核不通过的原因
			String reserved2 = request.getParameter("reason");
			//获取更新spu的商品状态为3 表示审核不通过
			map.put("status",3);
			map.put("reserved2", reserved2);
			try {
				goodsService.updateTSpuByMap(map);
				//表示跟新成功
				result.put("result", 0);
			} catch (Exception e) {
				e.printStackTrace();
				//更新失败
				result.put("result", 1);
			}
			
			return result;
			
		}
	
	
}
