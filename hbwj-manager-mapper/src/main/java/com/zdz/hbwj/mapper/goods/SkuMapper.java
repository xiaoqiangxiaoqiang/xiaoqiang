package com.zdz.hbwj.mapper.goods;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.goods.TSku;

public interface SkuMapper {
	//插入sku
	public void insertSku(TSku sku);
	
	//根据spuId 查询出所有的sku的信息
	public  List<TSku> findTSkuList(Map<String,Object> map);
	
}
