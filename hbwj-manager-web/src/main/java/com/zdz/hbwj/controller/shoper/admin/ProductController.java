package com.zdz.hbwj.controller.shoper.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zdz.hbwj.mapper.goods.SkuMapper;
import com.zdz.hbwj.mapper.goods.SpuMapper;
import com.zdz.hbwj.mapper.shopper.ShoperMapper;
import com.zdz.hbwj.pojo.goods.TSku;
import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;
import com.zdz.hbwj.pojo.shop.TShopCat;
import com.zdz.hbwj.pojo.shop.TShopReview;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.goods.GoodsService;
import com.zdz.hbwj.service.shop.ShopService;
import com.zdz.hbwj.util.FtpUtil;
import com.zdz.hbwj.util.IDUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 商品管理的控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="hbwj/enter/product/")
public class ProductController {

	private static final String host = "39.108.193.149";
	private static final Integer port =21;
	private static final String username ="guest";
	private static final String password ="guest";
	private static final String  basePath="/products";
	
	/*private static final String host = "192.168.40.134";
	private static final Integer port =21;
	private static final String username ="admin";
	private static final String password ="admin";
	private static final String  basePath="/home/admin/images/shoper";*/
	
	@Autowired 
    private ShopService shopService;
	//注入商品添加service
	@Autowired
	private GoodsService goodsService;
	
	//注入查询商家的信息
	@Autowired
	private ShoperMapper shopMapper;
	
	@Autowired
	private  SpuMapper spuMapper;
	@Autowired
	private  SkuMapper skuMapper;
	
	//商家管理员进入商品管理的页面
	@RequestMapping("shoperGoodsManager")
	public String shoperGoodsManager(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session =request.getSession();
		SysUser user = (SysUser) session.getAttribute("user");
		request.setAttribute("user_name", user.getUser_name());
		return "shopAdmin/product/shoperGoodsManager";
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
		return "shopAdmin/product/viewProduct";
		
	}
	
	//进入添加商品页面
	@RequestMapping("lookIframe")
	public String  lookIframe(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session =request.getSession();
		SysUser user = (SysUser) session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", user.getUser_name());
	 	TShopReview review = shopMapper.findReviewInfo(map);
	 	request.setAttribute("review", review);
		return "shopAdmin/product/addProduct";
	}
	
	
	@RequestMapping("loadIframe")
	public String  loadIframe(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session =request.getSession();
		SysUser user = (SysUser) session.getAttribute("user");
		request.setAttribute("user_name", user.getUser_name());
		return "iframe/iframe1";
	}
	
	//修改商品
	@RequestMapping("updateProduct")
	public  String updateProduct(HttpServletRequest request, 
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
		return "shopAdmin/product/updateProduct";
		
	}
	
	//商家店员上传商品图片
	@RequestMapping("upLoadPicture")
	@ResponseBody
	public Map<String,Object> loadPicture(HttpServletResponse response,
			HttpServletRequest request ,MultipartFile file) throws IOException{
		
		Map<String,Object> map = new HashMap<String, Object>();
		String result = null;
		try {
			
			//上传文件的实现
			if(file.isEmpty()){
				return null ;
			}
			String up = request.getParameter("user_name");
			//上传文件以日期为单位分开存放
			String filepath = "/"+up +"/"+new SimpleDateFormat("yyyy").format(
					new Date())+"/"+new SimpleDateFormat("MM").format(new Date())+"/"
					+ new SimpleDateFormat("dd").format(new Date());
			
			//获取原始文件名
			String originaFileName = file.getOriginalFilename();
			
			//扩展新的文件名
			String newFileName = IDUtils.genImageName()+
					originaFileName.substring(originaFileName.lastIndexOf("."));
			
			//将图片存入到ftp服务器上
			FtpUtil.uploadFile(host, port, username, password,
					basePath, filepath,
					newFileName, file.getInputStream());
			 result = "/products"+filepath +"/"+newFileName;
			//会显图片
			map.put("file",newFileName);
			map.put("url","http://"+host+":8080"+result);
			
		} catch (Exception e) {
			map.put("result","1");
			e.printStackTrace();
		}
		return map;
		
		
	}	
		
		
		//商家店铺选择类型
		@SuppressWarnings({ "unchecked", "rawtypes", "null" })
		@RequestMapping("loadShopCategroy")
		@ResponseBody
		public List  loadShopCat(@RequestParam(value="id",defaultValue="0") int parentId){
			
			try {
				List ml = new ArrayList<>();
				List<TShopCat> list = shopService.findShopcatList(parentId);
				if(list!=null || list.size()>0){
					for(TShopCat shop :list){
						Map map = new HashMap<String,Object>();
						map.put("id",shop.getId());
						map.put("text", shop.getName());
						map.put("parentId",shop.getParentId());
						
						List<TShopCat> list1 = 
								shopService.findShopcatList(shop.getId());
						if(list1 !=null){
							if(list1.size()>0){
								map.put("state","closed");
							}else{
								map.put("state", "open");
							}
						}
						ml.add(map);
					}
				}
				return ml;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			
		}	
				
		//通过种类id去插叙相应的商品销售属性的模板
		@RequestMapping("findModal")
		public void findModal(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			ObjectMapper mapper = new ObjectMapper();
			//获取请求参数
		    int catId = Integer.parseInt(request.getParameter("catId"));
		    try {
		    //获取种类属性
		      List<String> list = goodsService.findTProperties(catId);
		      String json = mapper.writeValueAsString(list);
			  out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//商家管理员添加商品
		@RequestMapping("addProduct")
		public void addProduct(HttpServletRequest request,
				 HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			 
			 try {
				 /**
				   * 创建创建spu对象  
				   */
				TSpu spu = new TSpu();
				//商家主键id
				String shop_id = request.getParameter("id");
				spu.setReserved1(shop_id);
				//产品的主键  来源前端生成
				  String spu_id =request.getParameter("spuId");
				  spu.setSpuId(spu_id);
				  
				//产品品牌 来源前端
				  String branch= request.getParameter("pinPai");
				  spu.setBranch(branch);
				  
				//产品名称 来源前端
				  String spu_name =request.getParameter("productName");
				  spu.setSpuName(spu_name);
				  
				//产品分类id 来源前端
				 int cat_id= Integer.parseInt(request.getParameter("typeId"));
				  spu.setCatId(cat_id);
				  
				//销售量通过计算而得的 初始默认值为0; 用户下完订单才跟新数据的
				  spu.setSellAmount(0);
				  
				//商品卖点 来源前端
				  String sell_point= request.getParameter("details");
				  spu.setSellPoint(sell_point);
				  
				//商家主键id
				  
				  
				//产品货号 来源前端
				  String product_num= request.getParameter("huoHao");
				  spu.setProductNum(product_num);
				  
				//产品原价 来源前端
				  Long oriPrice=Long.valueOf(request.getParameter("yuanJia"));
			      spu.setOriprice(oriPrice);
			      
				//产品现价 来源前端
				  Long nowPrice=Long.valueOf(request.getParameter("xianJia"));	
				  spu.setNowprice(nowPrice);
				/**
				 * 各种商品款式图 来源于用户输入销售属性后的统一的各种款式属性的集合不重复的图片
				 */		
				  String product_images = request.getParameter("imgUrl1");
				  spu.setProductImages(product_images);
				//商品排序 后台有功能进行商品的添加排序 将商品放置在哪个地方显示的位置 默认位置为0 依次递增
				  spu.setSort(0);
			  	//产品的状态 初始值添加进去为 0:表示 商家只上传商品 还未提交审核   1:表示待审核 ：2：审核通过 3：审核不通过
				  spu.setStatus(0);
				//上传时间
				  Date date  = new Date();
				  spu.setCreatetime(date);
				  
				  
				  /**
				   * 创建spuInfo 附属信息表 二次加载时所用的表
				   */
				TSpuInfo  spuInfo = new TSpuInfo(); 
				//主键 id插入数自动生成
				
				//spu_id 与TPsu 共用
				spuInfo.setSpuId(spu_id);
				
				//product_info 产品详细图片
				String product_info = request.getParameter("imgUrl2");
				spuInfo.setProductInfo(product_info);
				
				//product_param 商品规格参数 即商品属性详情
				String product_param = request.getParameter("props");
				spuInfo.setProductParam(product_param);
				
				//seller_name 商家店名
				String seller_name = request.getParameter("seller_name");
				spuInfo.setSellerName(seller_name);
				
				//shop_id 商家主键id 即电话号码				
				spuInfo.setShopId(shop_id);
				
				//shoper_name 商家姓名
				String shoper_name = request.getParameter("shoper_name");
				spuInfo.setShoperName(shoper_name);
					
				//sell_properties 产品的销售属性 遍历出来依次填写如property1 2,3 中
				String sell_properties = request.getParameter("sellProps");
				JSONArray jsonPros =JSONArray.fromObject(sell_properties);
							
				if(jsonPros.size() ==2){
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
					//property2 商品属性2
					spuInfo.setProperty2((String)jsonPros.get(1));
				}else if(jsonPros.size() ==1){
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
				}	else{
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
					//property2 商品属性2
					spuInfo.setProperty2((String)jsonPros.get(1));
					//property13商品属性3
					spuInfo.setProperty3((String)jsonPros.get(2));
				}		
				//创建时间
				Date date2 = new Date();
				spuInfo.setCreatetime(date2);
				
				
				/***8888888 sku 部分         **/
							
				//创建一个list集合保存所有的sku对象
				List<TSku> list = new ArrayList<TSku>();
					
				//获取sku
				 String  Tsku =request.getParameter("sku");
				//取出json的值
				 JSONArray json=JSONArray.fromObject(Tsku);
				//定义单个jsonObJect 变量
				 JSONObject jsonOne;
				 for(int i=0;i<json.size();i++){
					 jsonOne= (JSONObject) json.get(i);
					 TSku sku = new TSku();
					//获取skuId 商品id;
				     String skuId= (String) jsonOne.get("skuId");
					 sku.setSkuId(skuId);
					//spuId 产品id
					 sku.setSpuId(spu_id);
					 
					//sku_num 某类商品的库存 //数据来自前端的输入
			         int sku_num = (int) jsonOne.get("kuCun");
					 sku.setSkuNum(sku_num);
					 
					//获取产品的路径
					String reserved1 =  (String)jsonOne.get("url");
					 sku.setReserved1(reserved1);
					
					 //单款销售量 //初始化时为0 下订单完成是更新销售量
					 sku.setSkuAmount(0);
					 //上传商品的时间
					 Date date4 = new Date();
					 sku.setUptime(date4);
			
					 //商品状态 0：表示库存正常 1：卖完
					 sku.setStatus(0);
					 
					 //销售属性1
					 String  property1 = (String) jsonOne.get("property1");
					 sku.setProperty1(property1);
					 
					//销售属性2
					 String  property2 = (String) jsonOne.get("property2");
					 sku.setProperty2(property2);
					 
					//销售属性3
					 String  property3 = (String) jsonOne.get("property3");
					 sku.setProperty3(property3);
					 list.add(sku);
					 
				 }
				 //添加商品信息
				 goodsService.addShoperInfo(spu, spuInfo,list);
				//添加成功提交成功
				  data.put("result", "0");
				  String result = mapper.writeValueAsString(data);
				  out.write(result);
			} catch (Exception e) {
				e.printStackTrace();
				//添加失败
				data.put("result", "1");
				String result = mapper.writeValueAsString(data);
				out.write(result);
			}
			 
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

	
       //修改商品信息
		@RequestMapping("updateProductInfo")
		public  void updateProductInfo(HttpServletRequest request,
					HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			 
			 try {
				 /**
				   * 创建创建spu对象  
				   */
				TSpu spu = new TSpu();
				
				//产品的主键  来源前端生成
				  String spu_id =request.getParameter("spuId");
				  spu.setSpuId(spu_id);
				  
				//产品品牌 来源前端
				  String branch= request.getParameter("pinPai");
				  spu.setBranch(branch);
				  
				//产品名称 来源前端
				  String spu_name =request.getParameter("productName");
				  spu.setSpuName(spu_name);
				  
				//商品卖点 来源前端
				  String sell_point= request.getParameter("details");
				  spu.setSellPoint(sell_point);
				  			
				//产品货号 来源前端
				  String product_num= request.getParameter("huoHao");
				  spu.setProductNum(product_num);
				  
				//产品原价 来源前端
				  Long oriPrice=Long.valueOf(request.getParameter("yuanJia"));
			      spu.setOriprice(oriPrice);
			      
				//产品现价 来源前端
				  Long nowPrice=Long.valueOf(request.getParameter("xianJia"));	
				  spu.setNowprice(nowPrice);
				/**
				 * 各种商品款式图 来源于用户输入销售属性后的统一的各种款式属性的集合不重复的图片
				 */		
				  String product_images = request.getParameter("imgUrl1");
				  spu.setProductImages(product_images);
				//商品排序 后台有功能进行商品的添加排序 将商品放置在哪个地方显示的位置 默认位置为0 依次递增
				  spu.setSort(0);
			  	//产品状态 只要商家修改商品信息 此时商品状态必须要变为初始的0 此时必须要按提价按钮才可以正常通过审核 1:表示待审核 ：2：审核通过 3：审核不通过
				  spu.setStatus(0);
				//上传时间
				  Date date  = new Date();
				  spu.setCreatetime(date);
				  
				  
				  /**
				   * 创建spuInfo 附属信息表 二次加载时所用的表
				   */
				TSpuInfo  spuInfo = new TSpuInfo(); 
				//主键 id插入数自动生成
				
				//spu_id 与TPsu 共用
				spuInfo.setSpuId(spu_id);
				
				//product_info 产品详细图片
				String product_info = request.getParameter("imgUrl2");
				spuInfo.setProductInfo(product_info);
				
				//product_param 商品规格参数 即商品属性详情
				String product_param = request.getParameter("props");
				spuInfo.setProductParam(product_param);
							
				//sell_properties 产品的销售属性 遍历出来依次填写如property1 2,3 中
				String sell_properties = request.getParameter("sellProps");
				JSONArray jsonPros =JSONArray.fromObject(sell_properties);
				
				if(jsonPros.size() ==2){
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
					//property2 商品属性2
					spuInfo.setProperty2((String)jsonPros.get(1));
				}else if(jsonPros.size() ==1){
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
				}	else{
					//property1 商品属性1
					spuInfo.setProperty1((String)jsonPros.get(0));
					//property2 商品属性2
					spuInfo.setProperty2((String)jsonPros.get(1));
					//property13商品属性3
					spuInfo.setProperty3((String)jsonPros.get(2));
				}		
		
				//创建时间
				Date date2 = new Date();
				spuInfo.setCreatetime(date2);
				
				
				/***8888888 sku 部分         **/
				
				//创建一个list集合保存所有的sku对象
				List<TSku> list = new ArrayList<TSku>();
					
				//获取sku
				 String  Tsku =request.getParameter("sku");
				//取出json的值
				 JSONArray json=JSONArray.fromObject(Tsku);
				//定义单个jsonObJect 变量
				 JSONObject jsonOne;
				 for(int i=0;i<json.size();i++){
					 jsonOne= (JSONObject) json.get(i);
					 TSku sku = new TSku();
					//获取skuId 商品id;
				     String skuId= (String) jsonOne.get("skuId");
					 sku.setSkuId(skuId);
					//spuId 产品id
					 sku.setSpuId(spu_id);
					 
					//sku_num 某类商品的库存 //数据来自前端的输入
			         int sku_num = (int) jsonOne.get("kuCun");
					 sku.setSkuNum(sku_num);
					 
					//获取产品的路径
					String reserved1 =  (String)jsonOne.get("url");
					 sku.setReserved1(reserved1);
					
					 //单款销售量 //初始化时为0 下订单完成是更新销售量
					 sku.setSkuAmount(0);
					 //上传商品的时间
					 Date date4 = new Date();
					 sku.setUptime(date4);
			
					 //商品状态 0：表示库存正常 1：卖完
					 sku.setStatus(0);
					 
					 //销售属性1
					 String  property1 = (String) jsonOne.get("property1");
					 sku.setProperty1(property1);
					 
					//销售属性2
					 String  property2 = (String) jsonOne.get("property2");
					 sku.setProperty2(property2);
					 
					//销售属性3
					 String  property3 = (String) jsonOne.get("property3");
					 sku.setProperty3(property3);
					 list.add(sku);
					 
				 }
				 //删除所有sku
				 Map<String,Object> map = new HashMap<String,Object>();
				 map.put("spuId",spu_id);
 				 skuMapper.deleteSku(map);
 				 for(TSku sku:list){
 					skuMapper.insertSku(sku);
 				 }
 				 
				 //添加商品信息
				 goodsService.updateShoperInfo(spu, spuInfo);
				//0:修改成功
				  data.put("result", "0");
			} catch (Exception e) {
				e.printStackTrace();
				//1:修改失败
				data.put("result", "1");
			}
			   String result = mapper.writeValueAsString(data);
			   out.write(result);
		}
		
		//删除商品信息
		@RequestMapping("deleteProduct")
		public void deleteProduct(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			ObjectMapper mapper = new ObjectMapper();
			Map< String,Object> data = new  HashMap<String, Object>();
			Map< String,Object> map = new  HashMap<String, Object>();
			try {
				//通过spuId去删除信息 获取spuId
				  String spu_id =request.getParameter("spuId");
				  map.put("spuId", spu_id);
				  goodsService.deleteTSpu(map);
				  data.put("result", "0");
			} catch (Exception e) {
				e.printStackTrace();
				data.put("result", "1");
			}
			String result = mapper.writeValueAsString(data);
			out.write(result);
			
		}
		
		//提交商品的审核按钮功能
		@RequestMapping("reviewProduct")
		public void reviewProduct(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			Map< String,Object> map = new  HashMap<String, Object>();
			try {
				String spu_id =request.getParameter("spuId");
				map.put("spuId", spu_id);
				map.put("status",1);
				Date date = new Date();
				map.put("updatetime",date);
				goodsService.updateTSpuByMap(map);
				data.put("result", "0");
			} catch (Exception e) {
				e.printStackTrace();
				data.put("result", "1");
			}
			String result = mapper.writeValueAsString(data);
			out.write(result);
		}
		
		//修改库存回调数据
		@RequestMapping("updateProductData")
		@ResponseBody
		public void updateProductData(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			ObjectMapper mapper = new ObjectMapper();
			Map<String,Object> map = new HashMap<String,Object>();
			JSONObject result = new JSONObject();
 			String spuId= request.getParameter("spuId");
 			int catId= Integer.parseInt(request.getParameter("catId"));
			map.put("spu_id", spuId);
			
			//查找属性名
			 List<String> list1 = goodsService.findTProperties(catId);
			//查找属性值
			List<TSku>	list = skuMapper.findTSkuList(map);
			//创建一个json数组
			JSONArray jsonArray = new JSONArray();
			for(int i=0;i<list.size();i++){
				 JSONObject jsonObject = new JSONObject();
				if(list1.size()==1){
					jsonObject.put("property1",list.get(i).getProperty1());
				} else if(list1.size()==2){
					jsonObject.put("property1",list.get(i).getProperty1());
					jsonObject.put("property2",list.get(i).getProperty2());
				}else{
					jsonObject.put("property1",list.get(i).getProperty1());
					jsonObject.put("property2",list.get(i).getProperty2());
					jsonObject.put("property3",list.get(i).getProperty3());
				}				
				 jsonObject.put("kuCun",list.get(i).getSkuNum());
				 jsonObject.put("skuId",list.get(i).getSkuId());
				 jsonArray.add(jsonObject);
			}
			result.put("sellProps", list1);
			result.put("sku", jsonArray);
			String data = mapper.writeValueAsString(result);
			out.write(data);
		}

	
		//修改商品库存
		@RequestMapping("updateProductNum")
		public void updateProductNum(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =  response.getWriter();
			Map< String,Object> data = new  HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			String  spuId =request.getParameter("spuId");
			//获取sku
			 String Tsku =request.getParameter("sku");
			 
			 try {
				//取出json的值
				 JSONArray json=JSONArray.fromObject(Tsku);
				//定义单个jsonObJect 变量
				 JSONObject jsonOne;
				 for(int i=0;i<json.size();i++){
					 Map<String,Object> map = new HashMap<String,Object>();
					 jsonOne= (JSONObject) json.get(i);
					//获取skuId 商品id;
				     String skuId= (String) jsonOne.get("skuId");
				     map.put("skuId", skuId);
				    String kuCun= (String) jsonOne.get("kuCun");
					//sku_num 某类商品的库存 //数据来自前端的输入
			         int sku_num = Integer.parseInt(kuCun);
			         map.put("skuNum", sku_num);
			         map.put("spuId", spuId);
			         list.add(map);
				 }
				 goodsService.updateTSkuInfo(list);
				 data.put("result", "0");
			} catch (Exception e) {
				e.printStackTrace();
				data.put("result", "1");
			}
			 String result = mapper.writeValueAsString(data);
			 out.write(result);
		}
		

}
