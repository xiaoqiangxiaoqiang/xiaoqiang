package com.zdz.hbwj.pojo.shop;

import java.util.Date;

import org.apache.commons.net.ntp.TimeStamp;

public class TShopReview  {

	//审核表的主键 关联用户表
	private String id;
	//商家姓名
	private String name;
	//商家身份号
	private String indentifyId;
	//店铺类型 0:旗舰店 1：专营店 2：专卖店 3:个体店
	private Integer shop_type;
	//商家申请的产品类型
	private String product_type;
	//省份证正反面
	private String identifyUrlA;
	//商标授权书照片
	private String shop_identify;
	//营业执照图片
	private String certificate_url;
	//商家联系方式
	private String chat_info;
	//商家店名
	private String shop_name;
	//商家地址
	private String shop_addr;
	//申请状态
	private Integer apply_status;
	//申请日期
	private Date applyTime;
	//审核通过日期
	private Date passApply;
	//商家门面实体图
	private String shop_url;
	//营业执照类型
	private Integer  reserved1;
	//审核未通过的原因
	private String  reserved2;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIndentifyId() {
		return indentifyId;
	}
	public void setIndentifyId(String indentifyId) {
		this.indentifyId = indentifyId;
	}
	public Integer getShop_type() {
		return shop_type;
	}
	public void setShop_type(Integer shop_type) {
		this.shop_type = shop_type;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getIdentifyUrlA() {
		return identifyUrlA;
	}
	public void setIdentifyUrlA(String identifyUrlA) {
		this.identifyUrlA = identifyUrlA;
	}
	public String getShop_identify() {
		return shop_identify;
	}
	public void setShop_identify(String shop_identify) {
		this.shop_identify = shop_identify;
	}
	public String getCertificate_url() {
		return certificate_url;
	}
	public void setCertificate_url(String certificate_url) {
		this.certificate_url = certificate_url;
	}
	public String getChat_info() {
		return chat_info;
	}
	public void setChat_info(String chat_info) {
		this.chat_info = chat_info;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_addr() {
		return shop_addr;
	}
	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}
	public Integer getApply_status() {
		return apply_status;
	}
	public void setApply_status(Integer apply_status) {
		this.apply_status = apply_status;
	}
	
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getPassApply() {
		return passApply;
	}
	public void setPassApply(Date passApply) {
		this.passApply = passApply;
	}
	public String getShop_url() {
		return shop_url;
	}
	public void setShop_url(String shop_url) {
		this.shop_url = shop_url;
	}
	public Integer getReserved1() {
		return reserved1;
	}
	public void setReserved1(Integer reserved1) {
		this.reserved1 = reserved1;
	}
	public String getReserved2() {
		return reserved2;
	}
	public void setReserved2(String reserved2) {
		this.reserved2 = reserved2;
	}
	
	
	
}
