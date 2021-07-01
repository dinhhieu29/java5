package com.springboot.service;

import com.springboot.model.GioHang;

public interface GioHangService {
	public GioHang getGioHang();
	public double getTotal();
	public void themSanPham(int productId);
	public void congSanPham(int productId);
	public void truSanPham(int productId);
	public void xoaSanPham(int productId);

}
