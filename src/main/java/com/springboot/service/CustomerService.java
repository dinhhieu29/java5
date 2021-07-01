package com.springboot.service;

import com.springboot.controller.GobalController.LAST_PAGE;
import com.springboot.model.Users;

public interface CustomerService {
	Users getUsers();
	boolean dangKy(Users user);
	void dangXuat();
	boolean dangNhap(String tenDangNhap, String matKhau);
	boolean isUserLogin();
	
	void setLastPage(LAST_PAGE lastPage);
	LAST_PAGE getLastPage();
}
