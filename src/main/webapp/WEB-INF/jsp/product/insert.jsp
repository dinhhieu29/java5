<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thêm mới sản phẩm</title>
<link rel="stylesheet" href="/dasboad/css/style.css">
</head>
<body>
	<div class="container">
	<h1>Thêm sản phẩm</h1>
	<form:form action="insertComplete" class= "product-title-item" method="post" modelAttribute="product">
		<form:input path="id" type="hidden" />
		<br />
		<form:label path="name" class= "product-title-item">Tên: </form:label>
		<form:input path="name" class="product-item"></form:input><br>
		<form:errors cssStyle="color: red; text-indent: 50px; margin-top: 5px" path="name"></form:errors>
		
		<form:label path="price" class= "product-title-item">Giá: </form:label>
		<form:input path="price" class="product-item"></form:input><br>
		<form:errors cssStyle="color: red; text-indent: 50px; margin-top: 5px" path="price"></form:errors>
		
		<label> Hình ảnh: <br> 
	<input type="file" path="picture" class="upload" id="${editProp.prop}_file" placeholder="hình ảnh" accept="image/*"> 
		<form:input path="picture" placeholder="Hình ảnh" type="hidden" cssClass="form-control" id="pictureInput" /> 
		<form:errors path="picture" cssClass="small text-danger" /> 
		<img src="${product.picture}" style="width: 25%" />

	</label>
		<form:label path="category.id" class= "product-title-item">Danh mục: </form:label>
		<form:select class="product-title-item" path="category.id" itemValue="id" itemLabel="name" items="${category}" /><br>
		<form:errors cssStyle="color: red; text-indent: 50px; margin-top: 5px" path="category.id"></form:errors>
		
		<form:label path="description" class= "product-title-item">Mô Tả: </form:label>
		<form:input path="description" class="product-item"></form:input><br>
		<form:errors cssStyle="color: red; text-indent: 50px; margin-top: 5px" path="description"></form:errors>
		
		<%-- <form:label path="createDate" class= "product-title-item">Ngày tạo: </form:label>
		<form:input  path="createDate" class="product-item"></form:input><br>
		<form:errors cssStyle="color: red; text-indent: 50px; margin-top: 5px" path="createDate"></form:errors>
		<br /> --%>
		<div class="product-btn">
	            <form:button class="product-item-btn"><b>Thêm</b></form:button>
	    </div>
	</form:form> 
	</div>
	<script src="/dasboad/js/insert.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$('.upload').change(function() {
	    uploadFile(this);
	});

	uploadFile = async (fileInput) => {
	    let formData = new FormData()
	    formData.append('file', fileInput.files[0]);
	    let uploadOption = {
	        method: 'POST',
	        body: formData
	    };
	    try {
	        let response = await fetch('/upload', uploadOption);
	        if (response.ok) {
	            let uploadResult = await response.json();
	            if (uploadResult.uploaded) {
		            $(fileInput).next().val(uploadResult.url);
		            $(fileInput).prev().val(uploadResult.url);
		            let $img =  $(fileInput).next().next();
		            if ($img.length > 0) {
		                $img.attr('src', uploadResult.url);
		            }
		        } else {
		            alert(uploadResult.messsage);
		        }
	        } else {
	            let error = await response.json();
	            alert(error);
	        }
	    } catch(error) {
	        alert(error);
	    }
	}
	</script>
</body>
</html>