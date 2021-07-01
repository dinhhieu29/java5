<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng ký</title>
<link rel="stylesheet" type="text/css" href="dangky/css/nunito-font.css">
	<!-- Main Style Css -->
<link rel="stylesheet" href="dangky/css/style.css"/>
</head>

<body class="form-v9">
	<div class="page-content">
		<div class="form-v9-content" style="background-image: url('dangky/images/form-v9.jpg')">
			<form class="form-detail" action="#" method="post">
				<h2>Registration Form</h2>
				<div class="form-row-total">
					<div class="form-row">
						<input type="text" name="" id="full-name" class="input-text" placeholder="Họ và tên" required>
					</div>
					<div class="form-row">
						<input type="text" name="your-email" id="your-email" class="input-text" placeholder=" Email" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
					</div>
				</div>
				<div class="form-row-total">
					<div class="form-row">
						<input type="password" name="password" id="password" class="input-text" placeholder=" Password" required>
					</div>
					<div class="form-row">
						<input type="password" name="comfirm-password" id="comfirm-password" class="input-text" placeholder="nhập lại Password" required>
					</div>
				</div>
				<div class="form-row-last">
					<input type="submit" name="register" class="register" value="Đăng ký">
				</div>
			</form>
		</div>
	</div>
</body>
</html>