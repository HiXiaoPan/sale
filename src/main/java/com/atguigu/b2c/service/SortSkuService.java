package com.atguigu.b2c.service;

import java.util.List;

import com.atguigu.b2c.bean.Datas;
import com.atguigu.b2c.bean.UNION_SKU_SHP_TM;



public interface SortSkuService {


	List<UNION_SKU_SHP_TM> get_sku_shp_tm_by_fl2id_attrids_attrValueids(Datas d,String sql);

	List<Integer> get_valueid_by_attrid(Integer integer);

	List<UNION_SKU_SHP_TM> get_sku_by_valueid(Integer integer, Integer flbh2id);

}
