package com.zdz.hbwj.mapper.shopper;

import java.util.List;
import java.util.Map;

import com.zdz.hbwj.pojo.shop.TShopCat;
import com.zdz.hbwj.pojo.shop.TShopReview;

public interface ShoperMapper {

	//显示商品类目信息
	public List<TShopCat> findTShopCatList(int id);
	
	//添加商家审核信息
	public void insertTShopReview(TShopReview review);
	
	 //分页查询商家申请资料信息
    public List<TShopReview> findReviewByCondition(Map<String,Object> map);
    
    //分页查询商家申请资料信息总条数
    public int findReviewCount(Map<String,Object> condition);
    
    //通过id查询商家申请的审核信息
    public TShopReview findReviewInfo(Map<String,Object> map);
    
    //商家店铺申请成功更新、
    public void updateReviewInfo(Map<String,Object> map);
	
}
