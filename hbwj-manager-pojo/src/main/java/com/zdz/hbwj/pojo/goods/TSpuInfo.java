package com.zdz.hbwj.pojo.goods;

import java.util.Date;

public class TSpuInfo {
    private Integer id;

    private String spuId;

    private String productInfo;

    private String productParam;

    private String sellerName;

    private String shopId;

    private Date createtime;

    private String shoperName;

    private Date updatetime;

    private String property1;

    private String property2;

    private String property3;

    private String reserved1;

    private String reserved2;

    private String reserved3;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSpuId() {
        return spuId;
    }

    public void setSpuId(String spuId) {
        this.spuId = spuId == null ? null : spuId.trim();
    }

    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo == null ? null : productInfo.trim();
    }

    public String getProductParam() {
        return productParam;
    }

    public void setProductParam(String productParam) {
        this.productParam = productParam == null ? null : productParam.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getShoperName() {
        return shoperName;
    }

    public void setShoperName(String shoperName) {
        this.shoperName = shoperName == null ? null : shoperName.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getProperty1() {
        return property1;
    }

    public void setProperty1(String property1) {
        this.property1 = property1 == null ? null : property1.trim();
    }

    public String getProperty2() {
        return property2;
    }

    public void setProperty2(String property2) {
        this.property2 = property2 == null ? null : property2.trim();
    }

    public String getProperty3() {
        return property3;
    }

    public void setProperty3(String property3) {
        this.property3 = property3 == null ? null : property3.trim();
    }

    public String getReserved1() {
        return reserved1;
    }

    public void setReserved1(String reserved1) {
        this.reserved1 = reserved1 == null ? null : reserved1.trim();
    }

    public String getReserved2() {
        return reserved2;
    }

    public void setReserved2(String reserved2) {
        this.reserved2 = reserved2 == null ? null : reserved2.trim();
    }

    public String getReserved3() {
        return reserved3;
    }

    public void setReserved3(String reserved3) {
        this.reserved3 = reserved3 == null ? null : reserved3.trim();
    }
}