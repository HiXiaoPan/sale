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
<title>添加属性</title>
</head>
<body>
	请给<span style="color:red;">${class_2_name }</span> 添加属性
	<form  action="classAttr/class_attr.htm" method="post" >
		<a href="javascript:class_attr_add_append_name();">添加属性名</a>
		<table id="class_attr_add_table_0" border="1">
			<tr>
				<td>属性名:<input type="text" name="attr_value[0].shxm_mch"></td>
				<td><a href="javascript:class_attr_add_append_value(0);">添加属性值</a></td>
			</tr>
			<tr>
				<td>属性值:<input type="text" name="attr_value[0].values[0].shxzh"></td>
				<td>属性值名称:<input type="text" name="attr_value[0].values[0].shxzh_mch"></td>
				<td>删除</td>
			</tr>
		</table>
		<input type="hidden" name="class_2_id" value="${class_2_id }"/>
		<input type="hidden" name="class_2_name" value="${class_2_name }"/>
		<input type="submit" name="发布属性值">
	</form>
	
<script type="text/javascript">

	var index = 0;
	/* 追加属性值 */
	function class_attr_add_append_value(index){
		var tdIndex = $("#class_attr_add_table_"+index+" tr").length -1;
		var a = '<tr>'
					+'<td>属性值:<input type="text" name="attr_value['+index+'].values['+tdIndex+'].shxzh"></td>'
					+'<td>属性值名称:<input type="text" name="attr_value['+index+'].values['+tdIndex+'].shxzh_mch"></td>'
					+'<td>删除</td>'
				+'</tr>';
		$("#class_attr_add_table_"+index).append(a);
	}
	/* 追加属性名 */
	function class_attr_add_append_name(){
		var a = '<table id="class_attr_add_table_'+(index+1)+'" border="1">'
					+'<tr>'
					+'<td>属性名:<input type="text" name="attr_value['+(index+1)+'].shxm_mch"></td>'
					+'<td><a href="javascript:class_attr_add_append_value('+(index+1)+');">添加属性值</a></td>'
				+'</tr>';
		var b =	'<tr>'
					+'<td>属性值:<input type="text" name="attr_value['+(index+1)+'].values[0].shxzh"></td>'
					+'<td>属性值名称:<input type="text" name="attr_value['+(index+1)+'].values[0].shxzh_mch"></td>'
					+'<td>删除</td>'
				+'</tr>'
				+'</table>';
		$("#class_attr_add_table_"+index).after(a+b);
		index++;
	}
/* -----------------------页面加载完成后👇-------------------------- */
	$(function(){	
	});
/* ---------------------------页面加载完成👆---------------------------------- */

</script>
</body>
</html>