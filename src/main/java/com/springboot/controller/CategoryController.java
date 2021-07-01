package com.springboot.controller;
import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.model.Product;
import com.springboot.model.category;
import com.springboot.reponsitory.CategoryRepository;
import com.springboot.reponsitory.ProductRepository;

import java.util.Optional;


@Controller
@RequestMapping("category")
public class CategoryController {
	@GetMapping(path = "insert")
	public String insert(Model model) {
		category cate = new category();
		model.addAttribute("category",cate);
		return "category/insert";
	}
	@Autowired
	CategoryRepository categoryReponsitory;
	@PostMapping(path="insertComplete")
	public String insertComplete(@Valid @ModelAttribute("category") category cate, BindingResult resuilt, Model model) {
		if(resuilt.hasErrors()) {
			return "category/insert";
		}
		categoryReponsitory.save(cate);
		return "redirect:tables";
	}
	
	@GetMapping("tables")
	public String index(Model model) {
		List<category> category = categoryReponsitory.findAll();
		model.addAttribute("category",category);
		return "tables";
	}
	
	//hàm sửa:
	@GetMapping("edit")
	public String index(@RequestParam(name="cId") int cId, Model model) {
		Optional<category> categoryOption = categoryReponsitory.findById(cId);
		if(categoryOption.isEmpty()) return "redirect:tables";
		model.addAttribute("category", categoryOption.get());
		return "category/insert";
	}
	
	@PostMapping("edit")
	public String index(@Valid @ModelAttribute("category") category category, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "category/insert";
		}
		
		Optional<category> categoryOption = categoryReponsitory.findById(category.getId());
		if(categoryOption.isEmpty()) {
			return "redirect:tables";
		}
		category categoryold = categoryOption.get();
		categoryold.setName(category.getName());
		categoryReponsitory.save(categoryold);
		return "redirect:tables";
	}
	
	//hàm xóa
	@Autowired
	ProductRepository productRepository;
	@GetMapping("delete")
	public String delete (@RequestParam(name="cId") int cId) {
		Optional<category> categoryOption = categoryReponsitory.findById(cId);
		if(categoryOption.isEmpty()) {
			return "redirect:tables";
			
		}
		category category = categoryOption.get();
		List<Product> products = category.getProducts();
		for(Product product : products) {
			product.setCategory(null);
		}
		productRepository.saveAll(products);			
		
		categoryReponsitory.delete(categoryOption.get());
		return "redirect:tables";
	}
}
