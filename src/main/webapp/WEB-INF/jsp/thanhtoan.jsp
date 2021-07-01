<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thanh toán</title>
<script src="https://kit.fontawesome.com/1764ccfbfd.js"crossorigin="anonymous"></script>
<link rel='stylesheet' href='css/woocommerce-layout.css' type='text/css'
	media='all' />
<link rel='stylesheet' href='css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='css/woocommerce.css' type='text/css'
	media='all' />
<link rel='stylesheet' href='css/font-awesome.min.css' type='text/css'
	media='all' />
<link rel='stylesheet' href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet' href='css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />
</head>
<style type="text/css">
body {
	width: 1100px;
	margin: 0 auto;
	text-decoration: none;
	list-style: none;
	font-size: 18px;
	line-height: 15px;
	font-family: serif;
}
div.gio-hang{
	width: 1100px;
	min-height: 200px;
	margin: 0 auto;
	position: absolute;
	top: 10;
	
	background: white;
	display: none;
	border: 1px solid #000;
	z-index: 50;
}
button.close {
	float: right;

}
.thesoluong{
	width: 100px;
	align-items:center;
	display: flex;
	margin-left: 100px;
}
.thesoluong button{
	width: 30px;
	height: 30px;
	border-radius: 20px;
}
.thesoluong p{
	margin-left: -3px;
	margin-top: -8px;
}

.nutxoa{
	width: 300px;
	align-items: center;
}
.nutxoa button{
	text-align: center;
	margin-left: 50px !important;
}

</style>
<body
	class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<h1 class="site-title">
						<a href="/index" rel="home">Moschino</a>
					</h1>

				</div>
				<button class="mo-gio-hang" style="font-size: 20px; background:white; color:black; margin-top:5px; 
				width: 150px; float: right;"><i class="fas fa-shopping-cart"></i> Giỏ Hàng</button>
								<div class="gio-hang">
									<button class="close">đóng</button>
									<div id="table-content"></div>
								</div>
				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">Menu</button>
					<a class="skip-link screen-reader-text" href="#content">Skip to
						content</a>
					<div class="menu-menu-1-container">
						<ul id="menu-menu-1" class="menu">
							<li><a href="/index"> <s:message code="lo.index.home" /></a></li>
							<li><a href="about.html"> <s:message code="lo.index.ABOUT" /></a></li>
							
		   					<c:if test="${empty currentUser}">
		   						<li><a href="/login">Đăng nhập</a></li>
		   						<li><a href="/dangky">Đăng ký</a></li>
		   					</c:if>
		   					<c:choose>
								<c:when test="${currentUser != null}">
									<c:if test="${currentUser.getUser_chucvu() eq 'admin'}">
										<a href="/dashboard">DashBoard</a>
									</c:if>
									<li>
									<a  href="#" role="button" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">
											<div>
												<i id="menu-menu-1" class="menu" aria-hidden="true" style="margin-top:-10px; " ></i>
												<div style="float: left; margin-top: 10px">
													<span style="color: balck">${currentUser.getUser_name()} </span>
												</div>
											</div>
									</a>
										<div id="menu-menu-1" class="menu">
											<div >
												<h6 >Xin chào!</h6>
											</div>
											<a href="/thongtinUser" id="menu-menu-1" class="menu" style=" margin-top: 20px; "> 
											<i class="ni ni-single-02"></i> 
											<span>Thông tin của tôi</span>
											</a> 
											<a href="#!" id="menu-menu-1" class="menu" style=" margin-top: 20px; "> 
											<i class="ni ni-single-02"></i> 
											<span>Lịch sử giao dịch</span>
											<div class="dropdow-divider" style=" margin-top: 20px; "></div>
											<a href="/logout" class="dropdow-item" > 
											<i class="ni ni-user-run" ></i> 
											<span >Đăng xuất</span>
											</a>
										</div>
										</li>
								</c:when>
		
							</c:choose>
		   					
							
														
						</ul>
						
					
				</nav>
			</header>
			<table>
		<thead>
			<tr>
				<th style="width: 300px; text-align: center;">Tên</th>
				<th style="width: 400px; text-align: center;">Số lượng</th>
				<th style="width: 300px; text-align: center;">giá bán</th>
				<th style="width: 300px; text-align: center;">giá thành tiền</th>
				<th style="width: 200px; text-align: center;">Thao tác</th>
				
			</tr>
		</thead>
		<tbody>
		<c:set var="total" value="${0}" />
			<c:forEach var="chitiet" items="${gioHang.chiTietGioHang}">
			
				<tr>
					<th style="width: 300px; text-align: center;">${chitiet.key.name}</th>
					<td class="thesoluong"> <button style="position: absolute; margin-left: -10px; margin-top: -30px;" onclick="truSP(event)" id="${chitiet.key.id}" 
						<c:if test="${chitiet.value == 1}">disabled="disabled"</c:if>>  - 
					</button> 
					<p style="margin-left: 40px !important;">${chitiet.value}</p>
					<button style="position: absolute; margin-left: 70px;margin-top: -30px;" onclick="congSP(event)" id="${chitiet.key.id}" 
						<c:if test="${chitiet.value == 10}">disabled="disabled"</c:if>>  + 
					</button> 
					</td>
					<th style="color: red; width: 400px; text-align: center;">
						<fmt:formatNumber type="number" maxFractionDigits="2" value="${chitiet.key.price}"/> VNĐ
					</th>
					<th style="color: green; margin-left: 100px;width: 400px; text-align: center;">
						<fmt:formatNumber type="number" maxFractionDigits="2" value="${chitiet.key.price*chitiet.value}"/> VNĐ
					</th>
					<td class="nutxoa"> <button onclick="xoaSP(event)" id="${chitiet.key.id}"> Xóa </button> </td>
					<c:set var="total" value="${total + (chitiet.key.price*chitiet.value)}"/>
				</tr>
				
			</c:forEach>
			<tr >
				<th class="tongtien" style="color: blue; font-weight: bold; font-size: 20px; ">
					<a>Thành tiền: <fmt:formatNumber type="number" maxFractionDigits="2" value="${total}"/> VNĐ</a>
				</th>
				<c:set var="total" value="${total + (chitiet.key.price*chitiet.value)}"/>
								
			</tr>
			
			
			
		</tbody>
	</table>
			<form:form action="/hoan-thanh-dat-hang" method="post" modelAttribute="order">
				<div class="row">
					<div class="col-50" >
						<h3>Thông tin người Đặt hàng</h3>
						
						<label for="name"><i class="fa fa-user" style=" margin-top: 20px; "></i> Tên</label><br>
						<form:input	type="text" value="${currentUser.getUser_name()}" id="name" path="name" style="margin-left: 10px; margin-top: 10px;"/>
						<form:errors path="name" cssStyle="color: red;" /><br>
						
						<label for="email"><i class="fa fa-envelope" style=" margin-top: 20px; "></i> Email</label><br>
						<form:input	type="email" value="${currentUser.getUser_email()}" id="email" path="email" style="margin-left: 10px; margin-top: 10px;"/> <br>
						
						<label for="address"><i	class="fa fa-address-card-o" style=" margin-top: 20px;"></i> Địa chỉ</label><br>
						<form:input type="text"	id="adr" path="address" style="margin-left: 10px; margin-top: 10px;"/><br>
						
						<label for="phoneNumber" ><i class="fa fa-address-card-o" style=" margin-top: 20px;"></i>Số điện thoại</label> <br>
						<form:input type="text" value="${currentUser.getUser_sdt()}"  path="phoneNumber" style="margin-left: 10px; margin-top: 10px;"/>
					</div>
					<div class="col-50">
						<div class="giatien">
							<span ><i class="fa fa-address-card-o" style=" margin-top: 20px;"></i>Tổng hóa đơn:</span> 
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${total}" />
							VNĐ	
						</div>
						<input type="submit" value="Đặt hàng" class="btn" style=" margin-top: 20px;">
					</div>
				</div>
			</form:form>

			<footer id="colophon" class="site-footer" style="max-width: 100%; margin-top: 50px;">
					<div class="container">
						<div class="site-info">
							<h1
								style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
							<a target="blank" href="/index">&copy; Moschino - © 2021
								Moschino.net</a>
						</div>
					</div>
				</footer>
				<a href="#top" class="smoothup" title="Back to top">
				<span>
					<i class="fas fa-arrow-up"></i>
				</span>
				</a>
			</div>
	<!-- #page -->
	<script src='${pageContext.request.contextPath}/js/jquery.js'></script>
	<script src='${pageContext.request.contextPath}/js/plugins.js'></script>
	<script src='${pageContext.request.contextPath}/js/scripts.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
	<script >
		$('button.close').click(function () {
			$(this).parent().css("display","none");
		});
		$('button.mo-gio-hang').click(function () {
			$('div.gio-hang').css("display","block");
			fetch('/giohang')
			.then(response => response.text())
			.then(data => {
				$('#table-content').html(data);
			});
		});
		
	function truSP(ev) {
		let id = $(ev.target).attr('id');
		fetch('/tru-san-pham/' + id)
		.then(response => response.text())
		.then(data => {
			$('#table-content').html(data);
		});
	}
	function congSP(ev) {
		let id = $(ev.target).attr('id');
		fetch('/cong-san-pham/' + id)
		.then(response => response.text())
		.then(data => {
			$('#table-content').html(data);
		});
	}
	function xoaSP(ev) {
		let id = $(ev.target).attr('id');
		 var r = confirm("bạn có chắc muốn xóa sản phẩm khỏi giỏ hông!");
		 if(r == true){
			 fetch('/xoa-san-pham/' + id)
				.then(response => response.text())
				.then(data => {
					$('#table-content').html(data);
				});
		 }else{
			 fetch('/giohang')
				.then(response => response.text())
				.then(data => {
					$('#table-content').html(data);
				});
		 }
		
	}
	</script>			
</body>
</html>