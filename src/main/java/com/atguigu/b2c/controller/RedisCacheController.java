package com.atguigu.b2c.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.b2c.bean.Datas;
import com.atguigu.b2c.bean.UNION_SKU_SHP_TM;
import com.atguigu.b2c.service.SortSkuService;
import com.atguigu.b2c.utils.JedisPoolUtils;
import com.atguigu.b2c.utils.JsonUtils;

import redis.clients.jedis.Jedis;
@RequestMapping("/cache")
@Controller
public class RedisCacheController {
	@Autowired
	SortSkuService sortSkuServiceImpl;
	
	@ResponseBody
	@RequestMapping(value="redis_class2_attr_refresh.do",method=RequestMethod.POST)
	public int redis_class2_attr_refresh(Datas d) {
		List<Integer> attrValueids = new ArrayList<>();
		List<UNION_SKU_SHP_TM> skus = new ArrayList<>();
		String sku_in_attrvalue = "";
		Jedis jedis = JedisPoolUtils.getJedis();
		int num = 0;
		for (int i = 0; i < d.getAttrids().size(); i++) {
			//List<UNION_SKU_SHP_TM> valueids = sortSkuServiceImpl.get_sku_shp_tm_by_fl2id_attrids_attrValueids(d, null);
			attrValueids = sortSkuServiceImpl.get_valueid_by_attrid(d.getAttrids().get(i));
			for(int j = 0; j < attrValueids.size(); j++) {
				skus = sortSkuServiceImpl.get_sku_by_valueid(attrValueids.get(j),d.getFlbh2id());
				sku_in_attrvalue = "sku_in_attrvalue_" + d.getFlbh2id() + "_" + d.getAttrids().get(i)+"_"+attrValueids.get(j);
				jedis.del(sku_in_attrvalue);
				num++;
				for(int n = 0; n < skus.size(); n++) {
					jedis.zadd(sku_in_attrvalue, skus.get(n).getJg(), JsonUtils.objToJson(skus.get(n)));
				}
			}
		}
		return num;
	}
	
	/**
	 * 将 二级分类对应数据放到 redis 中
	 * @param d
	 * @return 当前 二级分类对应的 sku_shp_tm 信息的数据量 
	 */
	@ResponseBody
	@RequestMapping(value="/redis_class2_refresh.do",method=RequestMethod.POST)
	public int redis_class2_refresh(Datas d) {
		String class2_redis_name = "class2_skuShpTm_redis_" + d.getFlbh2id();
		List<UNION_SKU_SHP_TM> sku_shp_tms = sortSkuServiceImpl.get_sku_shp_tm_by_fl2id_attrids_attrValueids(d, null);
		Jedis jedis = JedisPoolUtils.getJedis();
		int num = 0;
		for (int i = 0; i < sku_shp_tms.size(); i++) {
			String objToJson = JsonUtils.objToJson(sku_shp_tms.get(i));
			jedis.zadd(class2_redis_name, i, objToJson);
			num++;
		}
		return num;
	}
	
}
