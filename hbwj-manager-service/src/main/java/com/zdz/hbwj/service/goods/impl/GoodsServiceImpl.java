package com.zdz.hbwj.service.goods.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zdz.hbwj.mapper.goods.SkuMapper;
import com.zdz.hbwj.mapper.goods.SpuMapper;
import com.zdz.hbwj.pojo.goods.TSku;
import com.zdz.hbwj.pojo.goods.TSpu;
import com.zdz.hbwj.pojo.goods.TSpuInfo;
import com.zdz.hbwj.service.goods.GoodsService;
@Service
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
	public void addShoperInfo(TSpu spu, TSpuInfo spuInfo, List<TSku> list) {
		spuMapper.insertSpu(spu);
		spuMapper.insertSpuInfo(spuInfo);
		for(TSku sku :list){
		  skuMapper.insertSku(sku);
		}
		
	}

	@Override
	public List<TSpu> findTSpuList(Map<String, Object> map) {
		List<TSpu> list = spuMapper.findTSpuList(map);
		return list;
	}

	@Override
	public int findTSpuCount(Map<String, Object> condition) {
		int count = spuMapper.findTSpuListCount(condition);
		return count;
	}}
