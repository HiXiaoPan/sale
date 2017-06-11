package com.atguigu.b2c.service;

import java.util.List;
import java.util.Map;

import com.atguigu.b2c.bean.LIST_T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.bean.T_MALL_SKU;

public interface SkuService {

	List<T_MALL_PRODUCT> get_product_by_ppid_flan2(Map<String, Object> param);


	void add_sku_and_skuAttrValue(T_MALL_SKU sku, LIST_T_MALL_ATTR_CONTAIN_VALUE attr_value);

}
