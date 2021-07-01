<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Trang chủ</title>
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
button:active {
  color: yellow;
} 
button:hover {
  color: red;
}
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
				<button class="mo-gio-hang" style="font-size: 18px; background:white; color:black; margin-top:5px; 
				width: 125px; float: right;"><i class="fas fa-shopping-cart"></i>  <s:message code="lo.index.card" /></button>
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
							<li>
		   						<a  href="${requestScope['javax.servlet.forward.request_uri']}?lang=en">
		   							<s:message code="lo.index.en" />
		   						</a>
		   					</li>
		   					<li>
		   						<a href="${requestScope['javax.servlet.forward.request_uri']}?lang=vi">
		   							<s:message code="lo.index.vi" />
		   						</a>
		   					</li>
		   					<c:if test="${empty currentUser}">
		   						<li><a href="/login">Đăng nhập</a></li>
		   						<li><a href="/dangky">Đăng ký</a></li>
		   						
		   					</c:if>
		   					<c:choose>
								<c:when test="${currentUser != null}">
									<c:if test="${currentUser.getUser_chucvu() eq 'admin'}">
										<div style="float: right; margin-right: -100px;"><a href="/dashboards" >DashBoard</a></div>
									</c:if>
									<li>
									<a  href="#" role="button" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">
											<div>
												<i class="fa fa-user-circle-o" aria-hidden="true" style="margin-top: -10px; margin-left: 5px"></i>
												
												<div style="float: left; margin-left: 20px;">
													<span >Xin chào!${currentUser.getUser_name()} </span>
													
												</div>
											</div>
									</a>
										<div id="menu-menu-1" class="menu">											
											<a href="/thongtinUser" id="menu-menu-1" class="menu" style=" margin-top: 20px; "> 
											<i class="ni ni-single-02"></i> 
											<span>Thông tin của tôi</span>
											</a> 
											<a href="/chi-tiet/lichsu" id="menu-menu-1" class="menu" style=" margin-top: 20px; "> 
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
			<!-- #masthead -->
			<div class="collapse navbar-collapse justify-content-end">
				<sf:form modelAttribute="searchForm" acion="sanpham" method="get" class="navbar-form" style=" float: right; ">
					<div class="input-group no-border">
							<sf:input path="ten" placeholder="Tìm kiếm" class="form-control" />
							<sf:input path="xepTheo" id="xepTheoInput" type="hidden" />
							<sf:input path="thuTu" id="thuTuInput" type="hidden" />
							<sf:input path="trang" id="trangInput" type="hidden" />
							<button class="btn btn-white btn-round btn-just-icon" type="submit" value="Tìm kiếm" id="searchBt" 
							style="margin-left: 10px; float: right;background: white; margin-top: 4px; color: black;">
								<i class="fas fa-search"></i>
							<div class="ripple-container"></div>
							</button>
					</div>
				</sf:form>
				
				<br>
				
			</div>
			
			<button xepTheo="id" class="xep" style="float: left; margin-top: -10px; margin-left: 5px; background: white; color: black;">Id
				<c:if test="${searchForm.xepTheo == 'id' }">
					<c:choose>
						<c:when test="${searchForm.thuTu}">&#8593</c:when>
						<c:otherwise>	&#8595</c:otherwise>
					</c:choose>
				</c:if>
			</button>
			<button xepTheo="name" class="xep" style="float: left; margin-top: -10px; margin-left: 50px; background: white; color: black;">Tên
				<c:if test="${searchForm.xepTheo == 'name' }">
					<c:choose>
						<c:when test="${searchForm.thuTu}">&#8593</c:when>
						<c:otherwise>&#8595</c:otherwise>
					</c:choose>
				</c:if>
			</button>
			<button xepTheo="price" class="xep"style="float: left; margin-top: -10px; margin-left: 90px; background: white; color: black;">Giá
				<c:if test="${searchForm.xepTheo == 'price' }">
					<c:choose>
						<c:when test="${searchForm.thuTu}">&#8593</c:when>
						<c:otherwise>&#8595</c:otherwise>
					</c:choose>
				</c:if>
			</button>
			<br>
			<br>
			<h3>Danh mục sản phẩm</h3>
			<ul class="danhmuc">
				<c:forEach var="category" items="${category}">
					<tr>						
						<td>${category.name}</td>						
					</tr>
				</c:forEach>
			</ul>
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
						<div class="grid portfoliogrid">
							<c:forEach var="product" items="${product}">
								<article class="hentry">
									<header class="entry-header">

										<div class="entry-thumbnail">
											<a href="chitiet?cId=${product.id}"><img
												src="${product.picture}"
												class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
												alt="p1" /></a>
										</div>

										<a class='portfoliotype'> ${product.name}</a><br> 
										
										<a class='portfoliotype'>
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${product.price}"/> VNĐ
										</a><br> 
										
										<button><a href="/them-vao-gio/${product.id}">Mua</a></button>
									</header>
								</article>
							</c:forEach>

						</div>

						<!-- .grid -->

						<nav class="pagination " >							
							<c:if test="${maxPage > 1}">			
								<c:forEach var="pageIndex" begin="0" end="${maxPage - 1}">
									<button trang="${pageIndex}" class="trang 
										<c:if test="${pageIndex == searchForm.trang}"> </c:if>" 
										style="background: white;width: 50px; margin-left: 20px; margin-top: 20px;" active>${pageIndex + 1} 
									</button>
								</c:forEach>
							</c:if>
						</nav>
						<br />

					</main>
					<!-- #main -->
				</div>
				<!-- #primary -->
			</div>
			<!-- #content -->
		</div>
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
	<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js">
					
				</script>
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