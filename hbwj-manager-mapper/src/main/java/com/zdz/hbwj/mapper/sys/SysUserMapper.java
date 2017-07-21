package com.zdz.hbwj.mapper.sys;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;

public interface SysUserMapper {

	//用户注册
	public void insertSysUser(SysUser user);
	
	 //添加角色与权限
    public void  insertSysUserRole(UserRole role);
	
	//查找用户
	public SysUser  findUserByName(String user_name);
	
	//通过用户名去查询用户的权限集合
	public List<String> findUserRole(String user_name);
	
	//更新用户的状态信息
	public  void updateSysUserInfo(Map<String,Object> map);
}
