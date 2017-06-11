package com.atguigu.b2c.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.b2c.bean.Datas;
import com.atguigu.b2c.bean.UNION_SKU_SHP_TM;
import com.atguigu.b2c.dao.SearchDao;
import com.atguigu.b2c.service.SortSkuService;


@Service
public class SortSkuServiceImpl implements SortSkuService {
	@Autowired
	SearchDao searchDao;
	@Override
	public List<UNION_SKU_SHP_TM> get_sku_shp_tm_by_fl2id_attrids_attrValueids(Datas d,String sql) {

		// 动态根据二级分类id和属性和属性值id拼接sku_id子查询的sql语句
		StringBuffer sbf = new StringBuffer();
		sbf.append("");
		List<Map<String,Integer>> attrAndValueids = d.getAttrAndValueids();
		if (attrAndValueids != null && attrAndValueids.size() > 0) {

			sbf.append(" AND a.id IN ");

			sbf.append("(");

			sbf.append(" select sku_0.sku_id from ");

			for (int i = 0; i < attrAndValueids.size(); i++) {
				sbf.append(" (select sku_id from t_mall_sku_attr_value where shxm_id = "
						+ attrAndValueids.get(i).get("shxm_id") + " and shxzh_id = "
						+ attrAndValueids.get(i).get("shxzh_id") + ") sku_" + i);
				if (i != (attrAndValueids.size() - 1)) {
					sbf.append(" , ");
				}
			}

			if (attrAndValueids.size() > 1) {
				sbf.append(" where ");
			}

			for (int i = 0; i < attrAndValueids.size(); i++) {
				if (i < (attrAndValueids.size() - 1) && i > 0) {
					sbf.append(" and ");
				}
				if (i < (attrAndValueids.size() - 1)) {
					sbf.append(" sku_" + i + ".sku_id = sku_" + (i + 1) + ".sku_id ");
				}

			}

			sbf.append(")");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		hashMap.put("class_2_id", d.getFlbh2id());
		
		hashMap.put("attr_value_sql", sbf.toString());
		hashMap.put("sql", sql);

		return searchDao.select_sku_shp_tm_by_fl2id_attrids_attrValueids(hashMap);

	}
	@Override
	public List<Integer> get_valueid_by_attrid(Integer integer) {
		
		return searchDao.select_valueid_by_attrid(integer);
	}
	@Override
	public List<UNION_SKU_SHP_TM> get_sku_by_valueid(Integer integer, Integer flbh2id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("class_2_id", flbh2id);
		hashMap.put("shxzh_id", integer);
		return searchDao.select_sku_shp_tm_by_fl2id_attrids_attrValueids(hashMap);
	}

	

}
