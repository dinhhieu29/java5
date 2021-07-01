<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

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
					<p style="margin-left: 50px !important;">${chitiet.value}</p>
					<button style="position: absolute; margin-left: 80px;margin-top: -30px;" onclick="congSP(event)" id="${chitiet.key.id}" 
						<c:if test="${chitiet.value == 10}">disabled="disabled"</c:if>> + 
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
			<tr>
				<th style=" color: blue; font-weight: bold; font-size: 20px; ">
					Thành tiền: <fmt:formatNumber type="number" maxFractionDigits="2" value="${total}"/> VNĐ
				</th>
				<c:set var="total" value="${total + (chitiet.key.price*chitiet.value)}"/>
				<td > 
					 
					<a href="/hoan-thanh-dat-hang" style="width: 200px; height:80px; background: red; color: black; margin-top: 20px; " > Hoàn thành đặt mua </a> 
					
				</td>
					
			</tr>
		</tbody>
	</table>
