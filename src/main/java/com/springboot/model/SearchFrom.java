package com.springboot.model;

public class SearchFrom {
	private String ten;
	private int trang;
	private String xepTheo;
	private boolean thuTu;
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public int getTrang() {
		return trang;
	}
	public void setTrang(int trang) {
		this.trang = trang;
	}
	public String getXepTheo() {
		return xepTheo;
	}
	public void setXepTheo(String xepTheo) {
		this.xepTheo = xepTheo;
	}
	public boolean getThuTu() {
		return thuTu;
	}
	public void setThuTu(boolean thuTu) {
		this.thuTu = thuTu;
	}
	public SearchFrom() {
		super();
		this.ten = "";
		this.trang = 0;
		this.xepTheo = "id";
		this.thuTu = true;
	}

	public SearchFrom(String ten, int trang, String xepTheo, boolean thuTu) {
		super();
		this.ten = ten;
		this.trang = trang;
		this.xepTheo = xepTheo;
		this.thuTu = thuTu;
	}
}
