package com.zdz.hbwj.controller.shoper.emp;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.util.FtpUtil;
import com.zdz.hbwj.util.IDUtils;

@Controller
@RequestMapping(value="/hbwj/enter/shopEmp/")
public class ShoperEmpController {

	private static String host = "192.168.40.134";
	private static Integer port =21;
	private static String username ="admin";
	private static String password ="admin";
	private static String  basePath="/home/admin/images/shoper";
	
	//重定向到商家员工页面
	@RequestMapping("index")
	public String index(HttpServletRequest request,
			HttpServletResponse response){
		return "shopEmp";
	}
	
	//重定向到添加商品页面
	@RequestMapping("addShop")
	public String addShop(HttpServletRequest request,
			HttpServletResponse response){
		return "addShop";
	}
	//重定向到添加商品页面
		@RequestMapping("enterframe")
		public String enterframe(HttpServletRequest request,
				HttpServletResponse response){
			HttpSession session =request.getSession();
			SysUser user = (SysUser) session.getAttribute("user");
			request.setAttribute("user_parent", user.getUser_parent());
			return "iframe";
		}
		
	//商家店员上传商品图片
	@RequestMapping("uploadPicture")
	@ResponseBody
	public Map<String,Object> uploadPicture(HttpServletRequest request,
			HttpServletResponse response, MultipartFile file) throws IOException{
		Map<String,Object> map = new HashMap<String, Object>();
		String result = null;
		try {
			
			//上传文件的实现
			if(file.isEmpty()){
				return null ;
			}
			String up = request.getParameter("user_parent");
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
			 result ="/shoper"+ filepath +"/"+newFileName;
			//会显图片
			map.put("file",newFileName);
			map.put("url","http://"+host+result);
			
		} catch (Exception e) {
			map.put("result","1");
			e.printStackTrace();
		}
		return map;
	}	
}
