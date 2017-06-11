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

<title>属性管理</title>
</head>
<body>
	<div>
		商品分类1:<select id="index_select_class_1" name="flbh1">
		</select>
	</div>
	<div><!-- this.value 直接拿到被选中的值 -->
		商品分类2:<select id="index_select_class_2" name="flbh2" onchange="get_fl2_attr_value(this.value)">
		</select>
	</div>
	<div id="class_attr_add_fl1shx">
	</div>
	<a href="javascript:goto_attr_add();">添加二级分类属性</a>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
/* -----------------------页面加载完成后👇-------------------------- */
$(function(){
	$.getJSON(
			"js/json/class_1.js",
			function(r){
				$(r).each(function(i,n){
					$("#index_select_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");					
				});
			});
	$("#index_select_class_1").change(function(){
		var class_1_id = $("#index_select_class_1 option:selected").val();
		$.getJSON(
				"js/json/class_2_"+class_1_id+".js",
				function(r){
					$("#index_select_class_2").empty();
					$(r).each(function(i,n){
						$("#index_select_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");					
					});
				});
	});
	
	
	
});
/* ---------------------------页面加载完成👆---------------------------------- */
/* 跳转添加属性页面 */
function goto_attr_add(){
	var class_2_id = $("#index_select_class_2").val();
	var class_2_name = $("#index_select_class_2 option:selected").html();
	if(class_2_id){
		window.open("classAttr/goto_class_attr_add/"+class_2_id+"/"+class_2_name+".htm");
	}else{
		alert("请选择二级分类");
	}
}
/* 加载（查询）二级分类对应的属性 ajax 返回的 data 是一个 html */
function get_fl2_attr_value(class_2_id){
		$.get(
				"classAttr/fl2_attr_value.do",
				{"class_2_id":class_2_id},
				function(data){
					$("#class_attr_add_fl1shx").html(data);
				}
			);
	}
</script>
</body>
</html>