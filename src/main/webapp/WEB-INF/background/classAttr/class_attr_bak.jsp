<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用来含的</title>
</head>
<body>
	<c:forEach items="${attr_value}" var="attrAndValue" >
		${attrAndValue.shxm_mch }:
		<c:forEach items="${attrAndValue.values }" var="value">
			${value.shxzh }${value.shxzh_mch }</br>
		</c:forEach>
		</br>
	</c:forEach>
</body>
</html>