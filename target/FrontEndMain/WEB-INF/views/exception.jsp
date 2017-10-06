<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="content" style="width: 60%">
		<!-- here the href's value will be used to decide the 
				 controller to be executed on click of this link.
				 here "home" is mapped in spring mvc controller-->
		<a href="${context}/home.obj">Home</a>
		<fieldset>
			<legend>Error occurred</legend>
			${exception }
		</fieldset>
	</div>
	<c:forEach items="${textbookList}" var="a">
	Category Name: ${a.category_level}
	</c:forEach>
</body>
</html>