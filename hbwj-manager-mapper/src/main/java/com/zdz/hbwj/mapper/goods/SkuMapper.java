package com.zdz.hbwj.mapper.goods;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.goods.TSku;

public interface SkuMapper {
	//插入sku
	public void insertSku(TSku sku);
	
	//根据spuId 查询出所有的sku的信息
	public  List<TSku> findTSkuList(Map<String,Object> map);
	
	//修改sku信息
	public void updateSkuById(TSku sku);
	
	//删除sku信息
	public void  deleteSku(Map<String,Object> map);
	
	//跟sku
	public void updateProductNum(Map<String,Object> map);
	
}
