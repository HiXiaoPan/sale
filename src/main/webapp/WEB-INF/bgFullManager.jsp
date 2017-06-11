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
<title>后台管理页面</title>
<link rel="stylesheet" type="text/css" href="js/easyui-1.3.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui-1.3.5/themes/icon.css">
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		<h3 style="color:red;">东狗后台管理页面</h3>
		<div>${success }</div>
	</div>
	<div data-options="region:'west',split:true,title:'功能列表'" style="width:200px;padding:10px;">
		<ul class="easyui-tree">
			<li >
				<span>后台管理</span>
				<ul>
					<li>
						<!-- <a href="index/goto_spu_manager.htm" target="_blank">添加spu分类信息</a> -->
						<span><a href="javascript:full_manager_add_tabs('index/goto_spu_manager.htm','spu发布');">添加spu分类信息</a></span>
					</li>
					<li>
						<span><a href="javascript:full_manager_add_tabs('index/goto_class_attr_manager.htm','spu分类属性发布');">添加分类属性信息</a></span>
					</li>
					<li>
						<span><a href="javascript:full_manager_add_tabs('index/goto_class_sku_manager.htm','sku发布');">添加sku</a></span>
					</li>
				</ul>
			</li>
			<li >
				<span>缓存管理</span>
				<ul>
					<li>
						<span><a href="javascript:full_manager_add_tabs('index/goto_redis_reflush_class2.htm','二级分类缓存');">二级分类缓存管理</a></span>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'操作列表'">
		<div id="fullManager_tabs" class="easyui-tabs"  data-options="tabWidth:112,fit:true" >
			
		</div>
	</div>
	
	
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript">
	/* 添加分类属性 */
	function full_manager_add_tabs(url,js){
		 if(!$("#fullManager_tabs").tabs('exists',js)){
			$("#fullManager_tabs").tabs('add',{    
			    title:js,       
			    href:url,
			    closable:true
			}); 
		}
		 
	}

</script>
</body>
</html>