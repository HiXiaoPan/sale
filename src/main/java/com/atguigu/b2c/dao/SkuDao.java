package com.atguigu.b2c.dao;

import java.util.List;
import java.util.Map;

import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.bean.T_MALL_SKU;

public interface SkuDao {

	List<T_MALL_PRODUCT> get_product_by_ppid_flan2(Map<String, Object> param);

	void add_sku(T_MALL_SKU sku);

	void add_skuAttrValue(Map<String, Object> param);
}
