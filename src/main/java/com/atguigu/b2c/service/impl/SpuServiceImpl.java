package com.atguigu.b2c.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.dao.SPU_DAO;
import com.atguigu.b2c.service.SpuService;
@Service
public class SpuServiceImpl implements SpuService{
	@Autowired
	SPU_DAO sUP_DAO;
	
	@Override
	public boolean spu_add(List<String> files, T_MALL_PRODUCT product) {
		int fileSize= files.size();
		int productRows= sUP_DAO.insertProduct(product);
		//先插入商品后根据商品 id 插入图片名
		Map<String,Object> param = new HashMap<>();
		param.put("shp_id", product.getId());
		param.put("imgs", files);
		int imageRows = sUP_DAO.insertImages(param);
		//这里需要事务吗？
		
		return productRows == 1 && imageRows == fileSize;
	}

}
