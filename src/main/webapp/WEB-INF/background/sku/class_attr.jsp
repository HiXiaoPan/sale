<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用来包含的</title>
</head>
<body>
	
		<c:forEach items="${attr_value}" var="attrAndValue" varStatus="sku_attr" >
			${attrAndValue.shxm_mch }:<input type="checkbox" name="attr_value[${sku_attr.index }].id" value="${attrAndValue.id }"/>
				<c:forEach items="${attrAndValue.values }" var="value" >
					${value.shxzh }${value.shxzh_mch }<input type="radio" name="attr_value[${sku_attr.index }].values[0].id" value="${value.id }"/>
				</c:forEach>
				</br>
		</c:forEach>
		
	</form>
	
</body>
</html>