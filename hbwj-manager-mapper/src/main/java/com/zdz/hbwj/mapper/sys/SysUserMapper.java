package com.zdz.hbwj.mapper.sys;

import java.util.List;

import com.zdz.hbwj.pojo.sys.SysUser;

public interface SysUserMapper {

	//用户注册
	public void insertSysUser(SysUser user);
	
	//查找用户
	public SysUser  findUserByName(String user_name);
	
	//通过用户名去查询用户的权限集合
	public List<String> findUserRole(String user_name);
}
