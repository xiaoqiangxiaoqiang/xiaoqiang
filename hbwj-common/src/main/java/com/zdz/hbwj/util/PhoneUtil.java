package com.zdz.hbwj.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * 检验电话号码
 */
public class PhoneUtil {
	
		public static boolean isMobileNO(String mobiles){ 
		        Pattern p =  Pattern.compile("^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\\d{8})?$");       
		        Matcher m = p.matcher(mobiles);      
		        return m.matches();       
		    }
}
