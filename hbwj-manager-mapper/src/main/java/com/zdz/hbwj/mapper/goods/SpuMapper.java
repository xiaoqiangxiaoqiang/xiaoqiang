package com.zdz.hbwj.mapper.goods;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;

public interface SpuMapper {
	
	//查询商品属性的模板
	public List<String> findProperties(int proId);
	
	   //插入TSpu
		public void insertSpu(TSpu spu);
		
		//插入TSpuInfo
		public void insertSpuInfo(TSpuInfo spuInfo);
		
		//分页查询spu
		public  List<TSpu> findTSpuList(Map<String,Object> map);
		//分页查询总的条数
		public  int  findTSpuListCount(Map<String,Object> condition);
		
		//查询单个spu的信息
		public  TSpu findTSpu(Map<String,Object> map);
		
		//通过spuId 查询spuInfo信息
		public  TSpuInfo findTSpuInfo(Map<String,Object> map);
		
		//修改spu
		public void updateSpuById(TSpu  spu);
		
		//修改spuInfo
		public void updateSpuInfoById(TSpuInfo spuInfo);
		
		//删除spu
		public void deleteSpuById(Map<String,Object> map);
		
		//删除spuInfo
		public void deleteSpuInfo(Map<String,Object> map);
		
		//通过map去跟新spu
		public void updateSpuByMap(Map<String,Object> map);
}
