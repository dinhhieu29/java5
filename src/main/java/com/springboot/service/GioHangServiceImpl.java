package com.springboot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.model.GioHang;
import com.springboot.model.OrderItems;
import com.springboot.model.Product;
import com.springboot.reponsitory.ProductRepository;





@Service

public class GioHangServiceImpl implements GioHangService {
	
	@Autowired
	private GioHang gioHang;
	
	public GioHang getGioHang() {
		return gioHang;
	}
	@Autowired
	ProductRepository productRepository;
	
	@Override
	public void themSanPham(int productId) {
	 Product product = productRepository.findById(productId).get();
	 if(gioHang.getChiTietGioHang().containsKey(product)) {
		int count = gioHang.getChiTietGioHang().get(product);
		gioHang.getChiTietGioHang().replace(product, count + 1);
	 } else {
		 gioHang.getChiTietGioHang().put(product, 1);
	 }
	}
	
	@Override
	public void congSanPham(int productId) {
	 Product product = productRepository.findById(productId).get();
	 if(gioHang.getChiTietGioHang().containsKey(product)) {
		int count = gioHang.getChiTietGioHang().get(product);
		gioHang.getChiTietGioHang().replace(product, count + 1);
	 } 
	}
	@Override
	public void truSanPham(int productId) {
	 Product product = productRepository.findById(productId).get();
	 if(gioHang.getChiTietGioHang().containsKey(product)) {
		int count = gioHang.getChiTietGioHang().get(product);
		gioHang.getChiTietGioHang().replace(product, count - 1);
	 } 
	}
	@Override
	public void xoaSanPham(int productId) {
	 Product product = productRepository.findById(productId).get();
	 if(gioHang.getChiTietGioHang().containsKey(product)) {
		gioHang.getChiTietGioHang().remove(product);
	 } 
	}
@Override
public double getTotal() {
	Map<Product, Integer> listItems = gioHang.getChiTietGioHang();
	double hieucho = 0;
	for(Product pr:listItems.keySet()) {
		hieucho += (listItems.get(pr) * pr.getPrice());
	}
	return hieucho;
}
}
