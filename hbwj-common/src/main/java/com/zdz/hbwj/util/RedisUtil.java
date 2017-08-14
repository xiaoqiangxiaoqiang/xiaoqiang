package com.zdz.hbwj.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisUtil {
        
	
	//设置值
	public static void set(String key,String value){
		//测试jedis的连接池
		  //1.创建连接池
		   JedisPool pool = new JedisPool();
		  //2.从连接池中获取jedis的实例
		  	Jedis jedis = pool.getResource();
		  //3.在通过实例来操作redis
		  	jedis.set(key, value);
	}
	
	//取值
    public static String get(String key){
    	//测试jedis的连接池
		  //1.创建连接池
		   JedisPool pool = new JedisPool();
		  //2.从连接池中获取jedis的实例
		  	Jedis jedis = pool.getResource();
		  //3.在通过实例来操作redis
		  String value= jedis.get(key);
		  return value;
    }
    
    //删除某值
    public static void del(String key){
    	//测试jedis的连接池
		  //1.创建连接池
		   JedisPool pool = new JedisPool();
		  //2.从连接池中获取jedis的实例
		  	Jedis jedis = pool.getResource();
		  //3.在通过实例来操作redis
		  jedis.del(key);
    }
    
    //设置Redis的过期时间
    public static void setExpire(String key, int time){
    	//测试jedis的连接池
		  //1.创建连接池
		   JedisPool pool = new JedisPool();
		  //2.从连接池中获取jedis的实例
		  	Jedis jedis = pool.getResource();
		  //3.在通过实例来操作redis
		  jedis.expire(key,time);
    }
	
}
