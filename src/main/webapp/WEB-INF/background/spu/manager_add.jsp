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
	<div class="easyui-layout" data-options="fit:true">
		<form action="spu/manager.htm" method="post" enctype="multipart/form-data">
			<div data-options="region:'west',split:false,title:'分类列表'" style="width:250px;padding:10px;">
				<div>
					商品分类1:<select id="spu_manager_select_class_1" name="flbh1" 
					 class="easyui-combobox" style="width:200px;">
					</select>
				</div>
				<div>
					商品分类2:<select id="spu_manager_select_class_2" name="flbh2" class="easyui-combobox" style="width:200px;">
					</select>
				</div>
				<div>
					商品品牌:<select id="spu_manager_select_tm" name="pp_id" class="easyui-combobox" style="width:200px;">
					</select>
				</div >
			</div>
			<div data-options="region:'center',title:'spu属性'">
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
					<input type="submit" value="spu发布">
				</div>
			</div>	
		</form>
	</div>
<script type="text/javascript">
	/* 根据class1加载 class2 */
	function spu_manager_flbh1_change(flbh1_id){
		$('#spu_manager_select_class_2').combobox({
			url:'js/json/class_2_'+flbh1_id+'.js',
			valueField:'id',
			textField:'flmch2'
		});
	}
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
		/* 加载默认值 */
		$('#spu_manager_select_class_1').combobox({
			url:'js/json/class_1.js',
			valueField:'id',
			textField:'flmch1',
			onSelect:function(){
				var flbh1_id = $(this).combobox('getValue');
				spu_manager_flbh1_change(flbh1_id);
				$('#spu_manager_select_tm').combobox( {
					url:'js/json/tm_flid_'+flbh1_id+'.js',
					valueField:'id',
					textField:'ppmch'
				});
				}
		});
		$('#spu_manager_select_class_2').combobox({
			url:'js/json/class_2_6.js',
			valueField:'id',
			textField:'flmch2'
		});
		$('#spu_manager_select_tm').combobox({
			url:'js/json/tm_flid_6.js',
			valueField:'id',
			textField:'ppmch'
		});
	});
	/* ------------------------------------页面加载完成之后↑-------------------------------------------------- */
	
</script>
</body>
</html>