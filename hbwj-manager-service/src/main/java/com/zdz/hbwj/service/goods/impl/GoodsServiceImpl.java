package com.zdz.hbwj.service.goods.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdz.hbwj.mapper.goods.SkuMapper;
import com.zdz.hbwj.mapper.goods.SpuMapper;
import com.zdz.hbwj.pojo.goods.TSku;
import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;
import com.zdz.hbwj.service.goods.GoodsService;
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private SpuMapper spuMapper;
	@Autowired 
    private SkuMapper skuMapper;
	//查询商品属性模板表
	public List<String> findTProperties(int proId) {
		List<String> list =spuMapper.findProperties(proId);
		return list;
	}

	//添加商品信息
	@Override
	@Transactional
	public void addShoperInfo(TSpu spu, TSpuInfo spuInfo, List<TSku> list) {
		spuMapper.insertSpu(spu);
		spuMapper.insertSpuInfo(spuInfo);
		for(TSku sku :list){
		  skuMapper.insertSku(sku);
		}
		
	}

	//查询TSpu的列表信息
	public List<TSpu> findTSpuList(Map<String, Object> map) {
		List<TSpu> list = spuMapper.findTSpuList(map);
		return list;
	}

	//查询spu信息
	public int findTSpuCount(Map<String, Object> condition) {
		int count = spuMapper.findTSpuListCount(condition);
		return count;
	}

	//修改商品信息
	@Transactional
	public void updateShoperInfo(TSpu spu, TSpuInfo spuInfo) {
		spuMapper.updateSpuById(spu);
		spuMapper.updateSpuInfoById(spuInfo);
	}

	@Transactional
	public void deleteTSpu(Map<String, Object> map) {
		spuMapper.deleteSpuById(map);
		spuMapper.deleteSpuInfo(map);
		skuMapper.deleteSku(map);
		
	}

	@Transactional
	public void updateTSpuByMap(Map<String, Object> map) {
		spuMapper.updateSpuByMap(map);
	}

	//更新库存信息
	@Transactional
	public void updateTSkuInfo(List<Map<String,Object>> list) {
		
		for(Map<String,Object> map : list){
			skuMapper.updateProductNum( map);
		}
	}
	
}
