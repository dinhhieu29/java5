<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thêm mới Màu sắc</title>
</head>
<style>
body {
	width: 1100px;
	margin: 0 auto;
	text-decoration: none;
	list-style: none;
	font-size: 18px;
	line-height: 30px;
	font-family: serif;
}
</style>
<body>
	
	<form:form action="insertComplete" method="post" modelAttribute="category">
		<form:input path="id" type="hidden" />
		<br/>
		<form:label path="name">Loại sản phẩm : </form:label>
		<form:input path="name"/>
		<form:errors path="name" cssStyle="color:red"/>
		<br/>
		<input type="submit" value="Thêm mới">
	</form:form>
</body>
</html>