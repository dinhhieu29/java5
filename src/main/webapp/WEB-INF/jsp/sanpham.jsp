<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon.png">
<link rel="icon" type="image/png" href="/dasboad/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>bảng sản phẩm</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />

<!-- CSS Files -->
<link href="/dasboad/css/material-dashboard.css?v=2.1.2"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/dasboad/demo/demo.css" rel="stylesheet" />
<link href="/dasboad/css/theme.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/1764ccfbfd.js"bcrossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
</head>
<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="/dasboad/img/sidebar-1.jpg">
			<div class="logo">
				<a href="http://www.creative-tim.com"
					class="simple-text logo-normal"> Dashboard Đình Hiếu </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item  "><a class="nav-link" href="/dashboards"
						rel="home"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="/category/tables" rel="home"> <i class="material-icons">content_paste</i>
							<p>Table Loại sản phẩm</p>
					</a></li>
					<li class="nav-item active "><a class="nav-link"
						href="/product/sanpham" rel="home"> <i class="material-icons">content_paste</i>
							<p>Table Sản phẩm</p>
					</a></li>
					<li class="nav-item ">
            <a class="nav-link" href="/chi-tiet/lichsu" rel="home">
              <i class="material-icons">content_paste</i>
              <p>Lịch sử mua hàng</p>
            </a>
          </li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:;">Bảng Sản phẩm</a>
					</div>
					<div class="collapse navbar-collapse justify-content-end">
						<sf:form modelAttribute="searchForm" acion="sanpham" method="get"
							style="display: flex;">
							<sf:input path="ten" placeholder="Tìm kiếm" class="form-control" />
							<sf:input path="xepTheo" id="xepTheoInput" type="hidden" />
							<sf:input path="thuTu" id="thuTuInput" type="hidden" />
							<sf:input path="trang" id="trangInput" type="hidden" />
							<button class="btn btn-white btn-round btn-just-icon"
								type="submit" value="Tìm kiếm" id="searchBt">
								<i class="material-icons">search</i>
							</button>
						</sf:form>
					</div>
				</div>
			</nav>
			<br> <br> <br> <br>
			<!-- End Navbar -->
			<div>
				<button class="au-btn au-btn-icon au-btn--blue">
					<i class="zmdi zmdi-plus"></i> <a href="/product/insert">Thêm</a>
				</button>
			</div>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">

									<h4 class="card-title ">Bảng loại sản phẩm</h4>

								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table">
											<thead class=" text-primary">
												<th>
													<button xepTheo="id" class="xep">
														Id
														<c:if test="${searchForm.xepTheo == 'id' }">
															<c:choose>
																<c:when test="${searchForm.thuTu}">&#8593</c:when>
																<c:otherwise>	&#8595</c:otherwise>
															</c:choose>
														</c:if>
													</button>
												</th>
												<th>
													<button xepTheo="name" class="xep">
														Tên
														<c:if test="${searchForm.xepTheo == 'name' }">
															<c:choose>
																<c:when test="${searchForm.thuTu}">(Tăng dần)</c:when>
																<c:otherwise>(Giảm dần)</c:otherwise>
															</c:choose>
														</c:if>
													</button>
												</th>
												<th>Hình ảnh</th>
												<th>
													<button xepTheo="price" class="xep">
														Giá
														<c:if test="${searchForm.xepTheo == 'price' }">
															<c:choose>
																<c:when test="${searchForm.thuTu}">(Tăng dần)</c:when>
																<c:otherwise>(Giảm dần)</c:otherwise>
															</c:choose>
														</c:if>
													</button>
												</th>

												<th>Loại sản phẩm</th>
												<th>ngày tạo</th>
												<th>mô tả</th>
												<th>thao tác</th>
											</thead>
											<tbody>

												<c:forEach var="product" items="${product}">
													<tr>
														<td>${product.id}</td>
														<td>${product.name}</td>
														<td><img src="${product.picture}"></td>
														<td>${product.price}VnĐ</td>
														<td>${product.category.name}</td>
														<td><fmt:formatDate value="${product.createDate}"
																pattern="dd/MM/yyyy" /></td>
														<td>${product.description}</td>
														<td><a href="/product/edit?cId=${product.id}">
																<i class="fas fa-edit"
																style="font-size: 20px; color: green;"> </i>
														</a> <a href="/product/delete?cId=${product.id}"></a>
															<button type="button"
																style="width: 1px; height: 1px !important; background-color: #EEEEEE; border: none; cursor: pointer; margin-left: 10px; margin-top: -5px;"
																data-bs-toggle="modal"
																data-bs-target="#exampleModal${product.id}">
																<i class="fa fa-trash-alt" aria-hidden="true"
																	style="color: red; position: absolute; font-size: 16px; margin-left: -10px; margin-top: -13px;"></i>
															</button> <!-- Modal -->

															<div class="modal fade"
																id="exampleModal${product.id}" tabindex="-1"
																aria-labelledby="exampleModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">Thông
																				báo</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>

																		<div class="modal-body"
																			style="text-align: center; font-size: 18px;">
																			Xác nhận xóa sản phẩm
																			<p style="color: red">${product.name}</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">Thoát</button>
																			<a
																				href="/product/delete?cId=${product.id}">Xác
																				nhận xóa</a>
																		</div>
																	</div>
																</div>
															</div></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

							</div>
							<nav aria-label="Page navigation example"
								style="position: absolute; z-index: 55; margin-left: -100px; margin-top: 10px;">
								<ul class="pagination justify-content-center">
									<li class="page-item" style="display: flex;">
										<c:if test="${maxPage > 0}">			
											<c:forEach var="pageIndex" begin="0" end="${maxPage - 1}" >
												<button trang="${pageIndex} " class="trang
													<c:if test="${pageIndex == searchForm.trang}"></c:if> ">${pageIndex + 1}
												</button>
											</c:forEach>
										</c:if>
									</li>
								</ul>
							</nav>

						</div>


					</div>
				</div>

				<script src="/dasboad/demo/demo.js"></script>
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
				<script>
					$(document)
							.ready(
									function() {
										$()
												.ready(
														function() {
															$sidebar = $('.sidebar');
															$sidebar_img_container = $sidebar
																	.find('.sidebar-background');
															$full_page = $('.full-page');
															$sidebar_responsive = $('body > .navbar-collapse');
															window_width = $(
																	window)
																	.width();
															fixed_plugin_open = $(
																	'.sidebar .sidebar-wrapper .nav li.active a p')
																	.html();
															if (window_width > 767
																	&& fixed_plugin_open == 'Dashboard') {
																if ($(
																		'.fixed-plugin .dropdown')
																		.hasClass(
																				'show-dropdown')) {
																	$(
																			'.fixed-plugin .dropdown')
																			.addClass(
																					'open');
																}
															}
															$('.fixed-plugin a')
																	.click(
																			function(
																					event) {
																				if ($(
																						this)
																						.hasClass(
																								'switch-trigger')) {
																					if (event.stopPropagation) {
																						event
																								.stopPropagation();
																					} else if (window.event) {
																						window.event.cancelBubble = true;
																					}
																				}
																			});
															$(
																	'.fixed-plugin .active-color span')
																	.click(
																			function() {
																				$full_page_background = $('.full-page-background');
																				$(
																						this)
																						.siblings()
																						.removeClass(
																								'active');
																				$(
																						this)
																						.addClass(
																								'active');
																				var new_color = $(
																						this)
																						.data(
																								'color');
																				if ($sidebar.length != 0) {
																					$sidebar
																							.attr(
																									'data-color',
																									new_color);
																				}
																				if ($full_page.length != 0) {
																					$full_page
																							.attr(
																									'filter-color',
																									new_color);
																				}
																				if ($sidebar_responsive.length != 0) {
																					$sidebar_responsive
																							.attr(
																									'data-color',
																									new_color);
																				}
																			});
															$(
																	'.fixed-plugin .background-color .badge')
																	.click(
																			function() {
																				$(
																						this)
																						.siblings()
																						.removeClass(
																								'active');
																				$(
																						this)
																						.addClass(
																								'active');
																				var new_color = $(
																						this)
																						.data(
																								'background-color');
																				if ($sidebar.length != 0) {
																					$sidebar
																							.attr(
																									'data-background-color',
																									new_color);
																				}
																			});
															$(
																	'.fixed-plugin .img-holder')
																	.click(
																			function() {
																				$full_page_background = $('.full-page-background');
																				$(
																						this)
																						.parent(
																								'li')
																						.siblings()
																						.removeClass(
																								'active');
																				$(
																						this)
																						.parent(
																								'li')
																						.addClass(
																								'active');
																				var new_image = $(
																						this)
																						.find(
																								"img")
																						.attr(
																								'src');
																				if ($sidebar_img_container.length != 0
																						&& $('.switch-sidebar-image input:checked').length != 0) {
																					$sidebar_img_container
																							.fadeOut(
																									'fast',
																									function() {
																										$sidebar_img_container
																												.css(
																														'background-image',
																														'url("'
																																+ new_image
																																+ '")');
																										$sidebar_img_container
																												.fadeIn('fast');
																									});
																				}
																				if ($full_page_background.length != 0
																						&& $('.switch-sidebar-image input:checked').length != 0) {
																					var new_image_full_page = $(
																							'.fixed-plugin li.active .img-holder')
																							.find(
																									'img')
																							.data(
																									'src');
																					$full_page_background
																							.fadeOut(
																									'fast',
																									function() {
																										$full_page_background
																												.css(
																														'background-image',
																														'url("'
																																+ new_image_full_page
																																+ '")');
																										$full_page_background
																												.fadeIn('fast');
																									});
																				}
																				if ($('.switch-sidebar-image input:checked').length == 0) {
																					var new_image = $(
																							'.fixed-plugin li.active .img-holder')
																							.find(
																									"img")
																							.attr(
																									'src');
																					var new_image_full_page = $(
																							'.fixed-plugin li.active .img-holder')
																							.find(
																									'img')
																							.data(
																									'src');
																					$sidebar_img_container
																							.css(
																									'background-image',
																									'url("'
																											+ new_image
																											+ '")');
																					$full_page_background
																							.css(
																									'background-image',
																									'url("'
																											+ new_image_full_page
																											+ '")');
																				}
																				if ($sidebar_responsive.length != 0) {
																					$sidebar_responsive
																							.css(
																									'background-image',
																									'url("'
																											+ new_image
																											+ '")');
																				}
																			});
															$(
																	'.switch-sidebar-image input')
																	.change(
																			function() {
																				$full_page_background = $('.full-page-background');
																				$input = $(this);
																				if ($input
																						.is(':checked')) {
																					if ($sidebar_img_container.length != 0) {
																						$sidebar_img_container
																								.fadeIn('fast');
																						$sidebar
																								.attr(
																										'data-image',
																										'#');
																					}
																					if ($full_page_background.length != 0) {
																						$full_page_background
																								.fadeIn('fast');
																						$full_page
																								.attr(
																										'data-image',
																										'#');
																					}
																					background_image = true;
																				} else {
																					if ($sidebar_img_container.length != 0) {
																						$sidebar
																								.removeAttr('data-image');
																						$sidebar_img_container
																								.fadeOut('fast');
																					}
																					if ($full_page_background.length != 0) {
																						$full_page
																								.removeAttr(
																										'data-image',
																										'#');
																						$full_page_background
																								.fadeOut('fast');
																					}
																					background_image = false;
																				}
																			});
															$(
																	'.switch-sidebar-mini input')
																	.change(
																			function() {
																				$body = $('body');
																				$input = $(this);
																				if (md.misc.sidebar_mini_active == true) {
																					$(
																							'body')
																							.removeClass(
																									'sidebar-mini');
																					md.misc.sidebar_mini_active = false;
																					$(
																							'.sidebar .sidebar-wrapper, .main-panel')
																							.perfectScrollbar();
																				} else {
																					$(
																							'.sidebar .sidebar-wrapper, .main-panel')
																							.perfectScrollbar(
																									'destroy');
																					setTimeout(
																							function() {
																								$(
																										'body')
																										.addClass(
																												'sidebar-mini');
																								md.misc.sidebar_mini_active = true;
																							},
																							300);
																				}
																				var simulateWindowResize = setInterval(
																						function() {
																							window
																									.dispatchEvent(new Event(
																											'resize'));
																						},
																						180);
																				setTimeout(
																						function() {
																							clearInterval(simulateWindowResize);
																						},
																						1000);
																			});
														});
									});
				</script>
</body>
</html>