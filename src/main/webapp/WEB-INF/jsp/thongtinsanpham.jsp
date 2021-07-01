<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Trang chi tiết</title>
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
	margin-left: 60px;
}
.thesoluong button{
	width: 50px;
	height: 50px;
	border-radius: 50px;
}
.thesoluong p{
	margin-left: 10px;
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
.activePage {
	background: red;
	color: white;
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
							<li><a href="/index">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li>
		   						<a style="width: 50px; color:red; " href="${requestScope['javax.servlet.forward.request_uri']}?lang=en">
		   							<s:message code="lo.index.en" />
		   						</a>
		   					</li>
		   					<li>
		   						<a href="${requestScope['javax.servlet.forward.request_uri']}?lang=vi">
		   							<s:message code="lo.index.vi" />
		   						</a>
		   					</li>
							
														
						</ul>
						
					</div>
					
				</nav>
			</header>
		
        
            <div class="tong">                               
                <div class="hinh" style="float: left; z-index: 50;">
                	<a>
                	<img src="${spDetail.picture}">
                	</a>
                </div>
                <div class="cctten" style="float:left; margin-left: 100px; margin-top: 100px; 	text-transform: uppercase;">
                    <div class="ten" >
                    	Tên sản phẩm: <a>${spDetail.name}</a>
                    </div>
                    <div class="loai" style="margin-top: 50px;">
                    	Loại sản phẩm: <a>${spDetail.category.name}</a>
                    </div>
                
                
                	<div class="gia-ban" style="margin-top: 50px;">
                		Giá sản phẩm: <fmt:formatNumber type="number" maxFractionDigits="2" value="${spDetail.price}"/> VNĐ
                	</div>
                	<div class="mo-ta" style="margin-top: 50px;">
                		Mô tả: <a>${spDetail.description}</a>
                	</div>
                	<div class="mua" style="margin-top: 70px; ">
                		<button style="width: 200px; color: black;"><a href="/them-vao-gio/${spDetail.id}">Mua</a></button>
                	</div>
                </div>
            </div>
         
        
        
   
			
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- .container -->
		<footer id="colophon" class="site-footer" style="max-width: 100%;">
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
	<script src='${pageContext.request.contextPath}/js/masonry.pkgd.min.js'></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
				<script type="text/javascript">
					$('#searchBt').click(function() {
						$('form #xepTheoInput').val("id");
						$('form #thutuInput').val(true);
						$('form #trangInput').val(0);
						$('form').submit();
					});
					$('.trang').click(function() {
						var trang = $(this).attr('trang');
						$('form #trangInput').val(trang);
						$('form').submit();
					});
					$('.xep').click(function() {
						var xepTheo = $(this).attr('xepTheo');
						var xepTheoInput = $('form #xepTheoInput');
						var thutuInput = $('form #thuTuInput');
						if (xepTheo == xepTheoInput.val()) {
							if (thutuInput.val() == 'true') {
								thutuInput.val(false);
							} else {
								thutuInput.val(true);
							}
						} else {
							thutuInput.val(true);
							xepTheoInput.val(xepTheo);
						}
						$('form #trangInput').val(0);
						$('form').submit();
					});
				</script>
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