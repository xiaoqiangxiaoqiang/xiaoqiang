package com.zdz.hbwj.service.sys;

import java.util.List;

import com.zdz.hbwj.pojo.sys.SysUser;

public interface SysUserService {

	//注册用户
	public void  addSysUser(SysUser user);
	
	//查询用户
	public SysUser findSysUser(String user_name);
	
	//查询用户所对应的权限信息
	public List<String> findRoles(String user_name);
}
