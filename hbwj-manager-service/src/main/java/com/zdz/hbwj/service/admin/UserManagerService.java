package com.zdz.hbwj.service.admin;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.sys.SysUser;
public interface UserManagerService {

	//查询用户的信息
	public  List<SysUser> findUserList(Map<String,Object> map);
	
	//查询商品的总条数
	public int findUserCount(Map<String,Object> condition);
	//跟新公司员工信息
	public  void  updateSysUserInfo(SysUser user);
	
	//删除用户信息
	public void  deleteSysUser(String user_id);
}
