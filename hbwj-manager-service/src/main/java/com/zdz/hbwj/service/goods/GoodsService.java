package com.zdz.hbwj.service.goods;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.goods.TSku;
import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;


public interface GoodsService {

	//查询商品属性模板表
		public List<String> findTProperties(int proId);
	
	//插入商品的信息
	public void  addShoperInfo(TSpu spu, TSpuInfo spuInfo,List<TSku> list);
	
	//分页查询Tspu
	public List<TSpu> findTSpuList(Map<String,Object> map);
	
	//分页查询总条数
    public int findTSpuCount(Map<String,Object> Condition);
}
