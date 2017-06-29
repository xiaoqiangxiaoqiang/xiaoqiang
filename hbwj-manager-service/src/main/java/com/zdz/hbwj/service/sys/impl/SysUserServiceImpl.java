package com.zdz.hbwj.service.sys.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zdz.hbwj.mapper.sys.SysUserMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.service.sys.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService{

	@Autowired
	private SysUserMapper sysUserMapper;
	@Override
	public void addSysUser(SysUser user) {
		
		try {
			sysUserMapper.insertSysUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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

}
