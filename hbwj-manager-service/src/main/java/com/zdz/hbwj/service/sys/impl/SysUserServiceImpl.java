package com.zdz.hbwj.service.sys.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdz.hbwj.mapper.sys.SysUserMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;
import com.zdz.hbwj.service.sys.SysUserService;

@Service
@Transactional
public class SysUserServiceImpl implements SysUserService{

	@Autowired
	private SysUserMapper sysUserMapper;
	
	
	public void addSysUser(SysUser user,UserRole role) {
			sysUserMapper.insertSysUser(user);
			sysUserMapper.insertSysUserRole(role);
	}
	@Override
	public SysUser findSysUser(String user_name) {
		try {
			SysUser user = sysUserMapper.findUserByName(user_name);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		 
	}
	@Override
	public List<String> findRoles(String user_name) {
		try {
			List <String> list = sysUserMapper.findUserRole(user_name);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	@Override
	@Transactional
	public void updateUserInfo(Map<String, Object> map) {
		try {
			sysUserMapper.updateSysUserInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}

}
