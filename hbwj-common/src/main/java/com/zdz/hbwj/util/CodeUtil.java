package com.zdz.hbwj.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class CodeUtil {

	
	//生成验证码的随机数
	public static String  getRandNum() {
		String randNum =String.valueOf((new Random().nextInt(8999) + 1000));
	    return randNum;
	}
	
	public static String sendSMSCode(String name) throws HttpException, IOException{
		//获取随机验证码
		String code = getRandNum();
		//发送随机验证码的API
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", "aitebao"),new NameValuePair("Key", "8a95b69b9da63bcb1bee"),new NameValuePair("smsMob",name),new NameValuePair("smsText","验证码:"+code)};
		post.setRequestBody(data);
		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
		return code;
	}
	
	
	/*public static void main(String[] args) throws HttpException, IOException {
	       String str =getRandNum();
	       System.out.println(str);
	}*/
	
}
