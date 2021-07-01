package com.springboot.service;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import com.springboot.controller.GobalController.LAST_PAGE;
import com.springboot.model.Users;

@Component
@SessionScope
public class CustomerSession {
	Users user;
	LAST_PAGE lastPage = LAST_PAGE.INDEX;
	
	public Users getUsers() {
		return user;
	}
	
	public void setUsers(Users user) {
		this.user = user;
	}

	public LAST_PAGE getLastPage() {
		return lastPage;
	}

	public void setLastPage(LAST_PAGE lastPage) {
		this.lastPage = lastPage;
	}
}
