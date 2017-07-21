package com.zdz.hbwj.service.shop;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.shop.TShopCat;
import com.zdz.hbwj.pojo.shop.TShopReview;

public interface ShopService {
   
	//查找商品类目
	public List<TShopCat> findShopcatList(int id);
	
	//添加商家审核信息
	public void insertTShopReview(TShopReview review);
	
	//分页查询商家审核信息
	public List<TShopReview> findTShopReviewList(Map<String,Object> map); 
	
	//查询商家审核信息的总条数
	public int findTShopReviewCount(Map<String,Object> condition);
	
	//通过id去查询商户审核信息
	public TShopReview findTShopReviewInfo (Map <String,Object> map);
	
	//更新商家店铺申请状态
	public void updateShoperInfo(Map<String,Object> map1,Map<String,Object> map2);
}
