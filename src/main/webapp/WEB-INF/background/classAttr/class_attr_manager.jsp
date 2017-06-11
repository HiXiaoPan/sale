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
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',split:false,title:'分类列表'" style="width:200px;padding:10px;">
			<div>
				商品分类1:<select id="index_select_class_1" name="flbh1
				 class="easyui-combobox" style="width:175px;">
				</select>
			</div>
			<div><!-- this.value 直接拿到被选中的值 -->
				商品分类2:<select id="index_select_class_2" name="flbh2" 
				 class="easyui-combobox" style="width:175px;">
				</select>
			</div>
		</div>
		<div data-options="region:'center',title:'属性值列表'">
			<div >
				<table id="class_attr_add_fl1shx" class="easyui-datagrid" title="商品属性表" style="width:525px;height:250px"
						data-options="singleSelect:true,collapsible:true">
					
				</table>
			</div>
			<div style="padding:5px;">
				<a href="javascript:goto_attr_add();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加二级分类属性</a>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
/* -----------------------页面加载完成后👇-------------------------- */
$(function(){
	$('#index_select_class_1').combobox({
		url:'js/json/class_1.js',
		valueField:'id',
		textField:'flmch1',
		onSelect:function(){
			var flbh1_id = $(this).combobox('getValue');/* 此处$(this)是easyui对象 */
			class_attr_manager_load_flbh2(flbh1_id);
			}
	});
	class_attr_manager_load_flbh2(6);
});
/* ---------------------------页面加载完成👆---------------------------------- */
	function class_attr_manager_load_flbh2(flbh1_id){
		$('#index_select_class_2').combobox( {
			url:'js/json/class_2_'+flbh1_id+'.js',
			valueField:'id',
			textField:'flmch2',
			onSelect:function(){
				var flbh2_id = $(this).combobox('getValue');
				get_fl2_attr_value(flbh2_id);
			}
		});
	}
	/* 跳转添加属性页面 */
	function goto_attr_add(){
		var class_2_id = $("#index_select_class_2").combobox('getValue');
		var class_2_name = $("#index_select_class_2").combobox('getText');
		if(class_2_id){
			var url = "classAttr/goto_class_attr_add/"+class_2_id+"/"+class_2_name+".htm";
			$("#fullManager_tabs").tabs('add',{    
			    title:'添加分类属性',       
			    href:url,
			    closable:true
			}); 
		}else{
			alert("请选择二级分类");
		}
	}
	/* 加载（查询）二级分类对应的属性 ajax 返回的 data 是一个 html */
	function get_fl2_attr_value(class_2_id){
			
			$("#class_attr_add_fl1shx").datagrid({
				singleSelect:true,
				collapsible:true,
				url:"classAttr/fl2_attr_value_easyui.do",
				method:'get',
				queryParams:{"class_2_id":class_2_id},
				columns:[[    
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
</script>
</body>
</html>