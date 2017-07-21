package com.zdz.hbwj.service.sys;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;

public interface SysUserService {

	//注册用户
	public void  addSysUser(SysUser user,UserRole role);
	
	//查询用户
	public SysUser findSysUser(String user_name);
	
	//查询用户所对应的权限信息
	public List<String> findRoles(String user_name);
	
	//更新用户的信息
	public void updateUserInfo(Map<String,Object> map);
}
