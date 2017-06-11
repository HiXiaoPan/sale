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

<title>spu新增页面</title>
</head>
<body>

	<h1>${success}</h1>
	<div>
		<form action="spu/manager.htm" method="post" enctype="multipart/form-data">
			<div>
				商品分类1:<select id="index_select_class_1" name="flbh1">
				</select>
			</div>
			<div>
				商品分类2:<select id="index_select_class_2" name="flbh2">
				</select>
			</div>
			<div>
				商品品牌:<select id="index_select_tm" name="pp_id">
				</select>
			</div >
			<div id="manager_add_file_imgs">
				<img id="manager_add_image_1" onclick="manager_add_uploadFile(1)" alt="" src="small_image/upload_hover.png" 
				style="width:100px;cursor:pointer;" title="点击添加图片">
				<input id="manager_add_file_1" type="file" name="photos" onchange="manager_add_showImage(1)" style="display:none;">
			</div>
				
			<div>
				商品名称:<input type="text" name="shp_mch" />
			</div>
			<div>
				商品描述:<input type="text" name="shp_msh" />
			</div>
			<div>
				提交:<input type="submit" value="spu发布">
			</div>
		</form>
	</div>
<script type="text/javascript">
	/* 点击图片上传文件 */
	function manager_add_uploadFile(index){
		$("#manager_add_file_"+index).click();
	}
	/* 图片回显 */
	function manager_add_showImage(index){
		var files = $("#manager_add_file_"+index);
        var url = window.URL.createObjectURL(files[0].files[0]);
        $("#manager_add_image_"+index).attr("src",url);
        var length = $("#manager_add_file_imgs > img").length;
        
       	if(index < 5 && length <5){
       	  manager_add_append_image(index);
       	}
	}
	/* 动态追加图片 */
	function manager_add_append_image(index){
		$("#manager_add_file_imgs").append('<img id="manager_add_image_'+(index+1)+'" onclick="manager_add_uploadFile('+(index+1)+')" alt="" src="small_image/upload_hover.png" style="width:100px;cursor:pointer;" title="点击添加图片">');
		$("#manager_add_file_imgs").append('<input id="manager_add_file_'+(index+1)+'" type="file" name="photos" onchange="manager_add_showImage('+(index+1)+')" style="display:none;">');
	}
/*------------------------------页面加载完成之后↓-------------------------------  */
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
		$("#index_select_class_1").change(function(){
			var class_1_id = $("#index_select_class_1 option:selected").val();
			$.getJSON(
					"js/json/tm_flid_"+class_1_id+".js",
					function(r){
						$("#index_select_tm").empty();
						$(r).each(function(i,n){
							$("#index_select_tm").append("<option value="+n.id+">"+n.ppmch+"</option>");					
						});
					});
		});
	});
	/* ------------------------------------页面加载完成之后↑-------------------------------------------------- */
	
</script>
</body>
</html>