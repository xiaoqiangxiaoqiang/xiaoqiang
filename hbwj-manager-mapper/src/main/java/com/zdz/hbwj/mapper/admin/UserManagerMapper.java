package com.zdz.hbwj.mapper.admin;

import java.util.List;
import java.util.Map;
import com.zdz.hbwj.pojo.sys.SysUser;
public interface UserManagerMapper {
	
	  //分页查询
     public List<SysUser> findUserByCondition(Map<String,Object> map);
     
     //分页查询总条数
     public int findUserCount(Map<String,Object> condition);
     
     //修改用户信息
     public void  updateSysUser(SysUser user);
     
     //删除用户
     public void deleteSysUser(String user_id);
     
     //删除角色表
     public void  deleteSysRole(String user_id);
     
}
