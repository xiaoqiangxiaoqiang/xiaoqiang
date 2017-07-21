package com.zdz.hbwj.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zdz.hbwj.mapper.admin.UserManagerMapper;
import com.zdz.hbwj.pojo.sys.SysUser;
import com.zdz.hbwj.pojo.sys.UserRole;
import com.zdz.hbwj.service.admin.UserManagerService;

@Service
public class UserManagerImpl implements UserManagerService {

	@Autowired
	private UserManagerMapper userMapper;
	//用户的信息
	public List<SysUser> findUserList(Map<String,Object> map) {
		 try {
		List<SysUser> list = userMapper.findUserByCondition(map);
		   return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		   }
		}
	//用户的总条数
	@Override
	public int findUserCount(Map<String,Object> condition) {
		try {
		int count=	userMapper.findUserCount(condition);
		return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	//跟新用户信息
	public void updateSysUserInfo(SysUser user) {
			userMapper.updateSysUser(user);
		
	}
	@Override
	public void deleteSysUser(String user_id) {
			userMapper.deleteSysUser(user_id);
			userMapper.deleteSysRole(user_id);
	}
		

	

		
}
