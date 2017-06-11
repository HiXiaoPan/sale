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
	<h1>sku添加模块</h1>
	<h1>${success}</h1>
	<div>
		<form action="sku/sku_manager.do" method="post">
			<div>
				商品分类1:<select id="sku_manager_select_class_1" name="flbh1">
				</select>
			</div>
			<div>
				商品分类2:<select id="sku_manager_select_class_2" name="flbh2">
				</select>
			</div>
			<div>
				商品品牌:<select id="sku_manager_select_tm" name="pp_id">
				</select>
			</div >
			<div>
				商品名称:<select id="sku_manager_select_product" name="shp_id">
				</select>
			</div >
			
			<div id="sku_manager_attr_value">
			
			</div>
			<div >
				sku名称:<input name="sku_mch"/>
			</div>
			<div>
				价格:<input name="jg"/>
				库存:<input name="kc"/>
				
			</div >
			<div>
				库存地址:<input name="kcdz"/>
			</div>
			<div>
				<input type="submit" value="sku发布">
			</div>
		</form>
	</div>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	
/*------------------------------页面加载完成之后↓-------------------------------  */
	$(function(){
		$.getJSON(
				"js/json/class_1.js",
				function(r){
					$(r).each(function(i,n){
						$("#sku_manager_select_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");					
					});
				});
		$("#sku_manager_select_class_1").change(function(){
			var class_1_id = $("#sku_manager_select_class_1 option:selected").val();
			$.getJSON(
					"js/json/class_2_"+class_1_id+".js",
					function(r){
						$("#sku_manager_select_class_2").empty();
						$(r).each(function(i,n){
							$("#sku_manager_select_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");					
						});
					});
		});
		$("#sku_manager_select_class_1").change(function(){
			var class_1_id = $("#sku_manager_select_class_1 option:selected").val();
		
			$.getJSON(
					"js/json/tm_flid_"+class_1_id+".js",
					function(r){
						$("#sku_manager_select_tm").empty();
						$(r).each(function(i,n){
							$("#sku_manager_select_tm").append("<option value="+n.id+">"+n.ppmch+"</option>");					
						});
					});
		});
		$("#sku_manager_select_class_2").change(function(){
			sku_manager_select_attr();
		});
		/* 加载商品 */
		$("#sku_manager_select_tm").change(function(){
			var class_2_id = $("#sku_manager_select_class_2").val();
			var pp_id=$("#sku_manager_select_tm").val();
			$.getJSON(
					"sku/get_product.do",
					{"flbh2":class_2_id,"pp_id":pp_id},
					function(r){
						$("#sku_manager_select_product").empty();
						$(r).each(function(i,n){
							$("#sku_manager_select_product").append("<option value="+n.id+">"+n.shp_mch+"</option>");					
						});
					});
		});
	});
	/* ------------------------------------页面加载完成之后↑-------------------------------------------------- */
	function sku_manager_select_attr(){
		var class_2_id = $("#sku_manager_select_class_2").val();
		
		$.get(
			"sku/get_attr_value.do",
			{"class_2_id":class_2_id},
			function(r){
				$("#sku_manager_attr_value").append(r);
			}
		);
	}
</script>
</body>
</html>