package com.zdz.hbwj.controller.shopInfo;

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
import com.zdz.hbwj.pojo.shop.TShopCat;
import com.zdz.hbwj.pojo.shop.TShopReview;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.shop.ShopService;
import com.zdz.hbwj.service.sys.SysUserService;
import com.zdz.hbwj.util.FtpUtil;
import com.zdz.hbwj.util.IDUtils;
import com.zdz.hbwj.util.PictureResult;


/***
 * 
 * @author Administrator
 *商家店铺申请审核页面的控制器
 */
@Controller
@RequestMapping(value="/hbwj/shop/")
public class ShopReviewController {
	private static String host = "192.168.40.134";
	private static Integer port =21;
	private static String username ="admin";
	private static String password ="admin";
	private static String  basePath="/home/admin/images";
	
    @Autowired 
    private ShopService shopService;
    @Autowired 
    private SysUserService sysUserService ;
	//进入商家店铺申请页面
	@RequestMapping("Authority")
	public String enterAuthority(HttpServletRequest request,
			HttpServletResponse response){
				HttpSession session =request.getSession();
				SysUser user = (SysUser) session.getAttribute("user");
				request.setAttribute("user", user);
				return "authority";				
				}
		
	//商家店铺信息图片上传
	@RequestMapping("upLoadPicture")
	@ResponseBody
	public PictureResult loadPicture(HttpServletResponse response,
			HttpServletRequest request ,MultipartFile uploadFiles) throws IOException{
		
		String result = null;
		try {
			
			//上传文件的实现
			if(uploadFiles.isEmpty()){
				return null ;
			}
			//上传文件以日期为单位分开存放
			String filepath = "/"+new SimpleDateFormat("yyyy").format(
					new Date())+"/"+new SimpleDateFormat("MM").format(new Date())+"/"
					+ new SimpleDateFormat("dd").format(new Date());
			
			//获取原始文件名
			String originaFileName = uploadFiles.getOriginalFilename();
			
			//扩展新的文件名
			String newFileName = IDUtils.genImageName()+
					originaFileName.substring(originaFileName.lastIndexOf("."));
			
			//将图片存入到ftp服务器上
			FtpUtil.uploadFile(host, port, username, password,
					basePath, filepath,
					newFileName, uploadFiles.getInputStream());
			 result = filepath +"/"+newFileName;
			
			//会显图片
				PictureResult data = new PictureResult(0,"http://"+host+result,"上传成功");
			return data;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}	
	
	//商家店铺选择类型
	@SuppressWarnings({ "unchecked", "rawtypes", "null" })
	@RequestMapping("loadShopCat")
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
	
	
	//商家证件审核
	@RequestMapping("Apply")
	public  void ReviewShop(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out =  response.getWriter();
		Map< String,Object> map = new  HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			//获取商家主键信息
			 String id=	request.getParameter("id");
				//获取店主的姓名
			 String name =	request.getParameter("name");
			 //获取商家省份证号
			 String indentifyId =	request.getParameter("indentifyId");
				//获取店铺名称
			 String shop_name = request.getParameter("name2");
				//获取省份证照片
			 String identifyUrlA =	request.getParameter("identfy");
				//获取地址
			 String shop_addr =	request.getParameter("dizhi");
				//获取上传的商家营业执照照片
			 String certificate_url =	request.getParameter("certificate_url");
				//获取上传的商标授权书照片
			 String shop_identify =	request.getParameter("shop_identify");
				//获取店铺类型
			 int shop_type = Integer.parseInt(request.getParameter("shopType"));
				//获取产品类型
			 String product_type = request.getParameter("shopCate");
				//获取商家联系方式
			 String chat_info = request.getParameter("contact");
				//商家实体门面图
			 String shop_url =	request.getParameter("shop_url");
			 	//营业执照的类型
			 int reserved1 =Integer.parseInt(request.getParameter("reserved1"));
			 //创建实例对象
			 TShopReview review = new TShopReview();
			 
			 review.setId(id);
			 review.setIndentifyId(indentifyId);
			 review.setName(name);
			 review.setShop_name(shop_name);
			 review.setIdentifyUrlA(identifyUrlA);
			 review.setProduct_type(product_type);
			 review.setShop_identify(shop_identify);
			 review.setShop_addr(shop_addr);
			 review.setShop_url(shop_url);
			 review.setCertificate_url(certificate_url);
			 review.setChat_info(chat_info);
			 review.setReserved1(reserved1);
			 review.setShop_type(shop_type);
			 Date date = new Date();
			 //申请时间
			 review.setApplyTime(date);
			 //申请状态 
			 review.setApply_status(1);
			 //将数据插入到数据库中
			 shopService.insertTShopReview(review);
			 //更新商家状态
			 Map<String,Object> map1 = new HashMap<String,Object>();
			 map1.put("user_name", id);
			 map1.put("status",3);
			 sysUserService.updateUserInfo(map1);
			 map.put("result","0");			
	         String json = mapper.writeValueAsString(map);
			 out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
			 map.put("result","1");			
	         String json = mapper.writeValueAsString(map);
			 out.write(json);
		}
		
	}
	
	
	
	
}
