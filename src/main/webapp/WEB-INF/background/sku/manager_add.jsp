<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>sku新增页面</title>
</head>
<body>
	
	<div class="easyui-layout" data-options="fit:true">
		<h1>${success}</h1>
		<form action="sku/sku_manager.do" method="post">
			<div data-options="region:'west',split:false,title:'分类列表'" style="width:275px;padding:10px;">
				<table>
					<tr>
						<td>商品分类1:</td>
						<td><select id="sku_manager_select_class_1" name="flbh1"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
					<tr>
						<td>商品分类2:</td>
						<td><select id="sku_manager_select_class_2" name="flbh2"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
					<tr>
						<td>商品品牌:</td>
						<td><select id="sku_manager_select_tm" name="pp_id"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
					<tr>
						<td>商品名称:</td>
						<td><select id="sku_manager_select_product" name="shp_id"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div data-options="region:'center',title:'sku属性'">
				<div id="sku_manager_attr_value">
				
				</div>
				<div >
					<span>sku名称:</span><input name="sku_mch"/>
				</div>
				<div>
					<span>价格        :</span><input name="jg"/></br>
					<span>库存	:</span><input name="kc"/>
					
				</div >
				<div>
					<span>库存地址:</span><input name="kcdz"/>
				</div>
				<div>
					<input type="submit" value="sku发布">
				</div>
			</div>
		</form>
	</div>
<script type="text/javascript">
	
/*------------------------------页面加载完成之后↓-------------------------------  */
	$(function(){
	 sku_manager_load_flbh1();
	 });
	/* ------------------------------------页面加载完成之后↑-------------------------------------------------- */
	/* 加分类编号1 */
	function sku_manager_load_flbh1(){
		$('#sku_manager_select_class_1').combobox({
			url:'js/json/class_1.js',
			valueField:'id',
			textField:'flmch1',
			onSelect:function(){
				var flbh1_id = $(this).combobox('getValue');/* 此处$(this)是easyui对象 */
				sku_manager_load_flbh2(flbh1_id);
				sku_manager_load_tm(flbh1_id);
				},
			onLoadSuccess:function(){
				var flbh1_id = $(this).combobox('getValue');
				sku_manager_load_flbh2(flbh1_id);
				sku_manager_load_tm(flbh1_id);
			}
		});
	}
	/* 加分类编号2 */
	function sku_manager_load_flbh2(flbh1_id){
		$('#sku_manager_select_class_2').combobox( {
			url:'js/json/class_2_'+flbh1_id+'.js',
			valueField:'id',
			textField:'flmch2',
			onSelect:function(){
				var flbh2_id = $(this).combobox('getValue');
				sku_manager_select_attr(flbh2_id);
			}
		});
	}
	/* 加商品品牌 */
	function sku_manager_load_tm(flbh1_id){
		$('#sku_manager_select_tm').combobox( {
			url:'js/json/tm_flid_'+flbh1_id+'.js',
			valueField:'id',
			textField:'ppmch',
			onSelect:function(){
				var pp_id = $(this).combobox('getValue');
				var class_2_id =$('#sku_manager_select_class_2').combobox('getValue');
				
				sku_manager_load_priduct(pp_id,class_2_id);
			},
			onLoadSuccess:function(){
				var pp_id = $(this).combobox('getValue');
				var class_2_id =$('#sku_manager_select_class_2').combobox('getValue');
				
				sku_manager_load_priduct(pp_id,class_2_id);
			}
		});
	}
	/* 加载商品系列 */
	function sku_manager_load_priduct(pp_id,class_2_id){
		var url1 = 'sku/get_product.do?pp_id='+pp_id+'&flbh2='+class_2_id;
		$('#sku_manager_select_product').combobox({
			url:url1,
			valueField:'id',
			textField:'shp_mch',
			method:'GET'
			/* loader:function(param,success,error){
				param=paramjson;
			} */
			/* queryParams:{
				'pp_id':pp_id,
				'flbh2':class_2_id
			} */
		});
	}
	
	/* 获取分类属性 */
	function sku_manager_select_attr(class_2_id){
		$.get(
			"sku/get_attr_value.do",
			{"class_2_id":class_2_id},
			function(r){
				$("#sku_manager_attr_value").empty();
				$("#sku_manager_attr_value").append(r);
			}
		);
	}
</script>
</body>
</html>