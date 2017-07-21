package com.zdz.hbwj.service.shop.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdz.hbwj.mapper.shopper.ShoperMapper;
import com.zdz.hbwj.mapper.sys.SysUserMapper;
import com.zdz.hbwj.pojo.shop.TShopCat;
import com.zdz.hbwj.pojo.shop.TShopReview;
import com.zdz.hbwj.service.shop.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShoperMapper shopMapper;
	@Autowired
	private SysUserMapper sysUserMapper;
	public List<TShopCat> findShopcatList(int id){
			List<TShopCat> list= shopMapper.findTShopCatList(id);
			return list;
	}
	
	public void insertTShopReview(TShopReview review) {
			shopMapper.insertTShopReview(review);
	}

	@Override
	public List<TShopReview> findTShopReviewList(Map<String, Object> map) {
		List<TShopReview> list=	shopMapper.findReviewByCondition(map);
		return list;
	}

	@Override
	public int findTShopReviewCount(Map<String, Object> condition) {
		int count = shopMapper.findReviewCount(condition);
		return count;
	}

	@Override
	public TShopReview findTShopReviewInfo(Map<String,Object> map) {
		TShopReview review = shopMapper.findReviewInfo(map);
		return review;
	}

	@Override
	@Transactional
	public void updateShoperInfo(Map<String, Object> map1 ,
			Map<String, Object> map2) {
		try {
			shopMapper.updateReviewInfo(map1);
			sysUserMapper.updateSysUserInfo(map2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	};

	
	
}
