package com.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springboot.model.Product;
import com.springboot.reponsitory.ProductRepository;



@Controller
public class DashboardController {
	
	@GetMapping(path = "dashboards")
	public String index(Model model) {
		return "dashboards";
	}

	@GetMapping(path = "tables") 
	public String insert(Model model) { 
		return "tables"; }
	 
	@GetMapping(path = "sanpham")
	public String insert1(Model model) {
		return "sanpham";
	}
	
	  @GetMapping(path = "lichsu") 
	  public String lichsu(Model model) { 
		  return "lichsu"; 
	}
	 
}
