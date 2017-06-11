package com.atguigu.b2c.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.b2c.bean.LIST_T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.bean.T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.bean.T_MALL_SKU;
import com.atguigu.b2c.dao.SkuDao;
import com.atguigu.b2c.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService {
	@Autowired
	SkuDao skuDao;
	
	@Override
	public void add_sku_and_skuAttrValue(T_MALL_SKU sku, LIST_T_MALL_ATTR_CONTAIN_VALUE attr_value) {
		Map<String, Object> param = new HashMap<>();
		//添加 sku
		skuDao.add_sku(sku);
		param.put("sku_id", sku.getId());
		param.put("shp_id", sku.getShp_id());
		List<T_MALL_ATTR_CONTAIN_VALUE> attrValue = attr_value.getAttr_value();
		//添加 skuAttrValue
		for (int i = 0; i < attrValue.size(); i++) {
			if(attrValue.get(i).getId() != null &&
					attrValue.get(i).getValues().get(0).getId() != null) {
				param.put("shxm_id", attrValue.get(i).getId());
				param.put("shxzh_id", attrValue.get(i).getValues().get(0).getId());
				skuDao.add_skuAttrValue(param);
			}
			
		}
		
		
	}
	@Override
	public List<T_MALL_PRODUCT> get_product_by_ppid_flan2(Map<String, Object> param) {
		return skuDao.get_product_by_ppid_flan2(param);
	}

	

}
