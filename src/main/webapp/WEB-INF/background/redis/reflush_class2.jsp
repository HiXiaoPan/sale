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

<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<h1>${success}</h1>
			<div data-options="region:'west',split:false,title:'分类列表'" style="width:275px;padding:10px;">
				<table>
					<tr>
						<td>商品分类1:</td>
						<td><select id="redis_class2_refresh_select_class_1" name="flbh1"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
					<tr>
						<td>商品分类2:</td>
						<td><select id="redis_class2_refresh_select_class_2" name="flbh2"
						 class="easyui-combobox" style="width:175px;">
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div data-options="region:'center',title:'缓存操作'">
				<div >
					<table id="redis_class2_refresh_add_fl1shx" class="easyui-datagrid" title="商品属性表" style="width:525px;height:250px"
							data-options="singleSelect:true,collapsible:true">
						
					</table>
				</div>
				<div style="padding:5px;">
					<a href="javascript:goto_redis_class2_refresh();"  class="easyui-linkbutton" data-options="iconCls:'icon-add'">刷新二级分类sku缓存</a>
				</div>
				<div style="padding:5px;">
					<a href="javascript:goto_redis_class2_attr_refresh();"  class="easyui-linkbutton" data-options="iconCls:'icon-add'">刷新二级分类attr对应sku</a>
				</div>
			</div>
	</div>
<script type="text/javascript">
	$(function(){
	 	redis_class2_refresh_load_flbh1();
	 });
	/* 加分类编号1 */
	function redis_class2_refresh_load_flbh1(){
		$('#redis_class2_refresh_select_class_1').combobox({
			url:'js/json/class_1.js',
			valueField:'id',
			textField:'flmch1',
			onSelect:function(){
				var flbh1_id = $(this).combobox('getValue');/* 此处$(this)是easyui对象 */
				redis_class2_refresh_load_flbh2(flbh1_id);
				},
			onLoadSuccess:function(){
				var flbh1_id = $(this).combobox('getValue');
				redis_class2_refresh_load_flbh2(flbh1_id);
			}
		});
	}
	/* 加分类编号2 */
	function redis_class2_refresh_load_flbh2(flbh1_id){
		$('#redis_class2_refresh_select_class_2').combobox( {
			url:'js/json/class_2_'+flbh1_id+'.js',
			valueField:'id',
			textField:'flmch2',
			onSelect:function(){
				var flbh2_id = $(this).combobox('getValue');
				redis_class2_refresh_select_attr(flbh2_id);
			},
			onLoadSuccess:function(){
				var flbh2_id = $(this).combobox('getValue');
				redis_class2_refresh_select_attr(flbh2_id);
			}
		});
	}
	/* 加载（查询）二级分类对应的属性 ajax 返回的 data 是一个 html */
	function redis_class2_refresh_select_attr(class_2_id){
			
			$("#redis_class2_refresh_add_fl1shx").datagrid({
				singleSelect:false,
				collapsible:true,
				url:"classAttr/fl2_attr_value_easyui.do",
				method:'get',
				queryParams:{"class_2_id":class_2_id},
				columns:[[{field:'id',title:'属性值id',width:150,checkbox:true},    
				          {field:'shxm_mch',title:'商品名名称',width:150},    
				          {field:'chjshj',title:'创建时间',width:175,
				        	  formatter: function(value,row,index){
				        		var d = new Date(value); /* 这是 js 中的对象 */
		    					return d.toLocaleString();
							}
						   },    
				          {field:'values',title:'属性值组',width:200,align:'left',
							   formatter: function(value,row,index){
		    		   				var valuename = "";
		    		   				/* 将参数处理后在返回！！！ */
		    		   				$(value).each(function(i,json){
		    		   					valuename= valuename+json.shxzh+json.shxzh_mch+"/";
		    		   				})
		    		   				return valuename;
		    					}   
				          }    
				      ]] 
			});			
			
		}
	function goto_redis_class2_refresh(){
		var flbh2_id = $("#redis_class2_refresh_select_class_2").combobox('getValue');
		$.post(
			"cache/redis_class2_refresh.do",
			{"flbh2id":flbh2_id},
			function(r){
				alert(r);
			}
		);
	}
	function goto_redis_class2_attr_refresh(){
		var flbh2_id = $("#redis_class2_refresh_select_class_2").combobox('getValue');
		var checkeds = $("#redis_class2_refresh_add_fl1shx").datagrid('getChecked');
		var param ={"flbh2id":flbh2_id};
		$(checkeds).each(function(i,n){
			param["attrids["+i+"]"]=n.id;
		});
		$.post("cache/redis_class2_attr_refresh.do",param,function(r){alert(r);});
	}
</script>
</body>
</html>