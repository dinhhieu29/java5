package com.springboot.controller;

import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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

import com.springboot.model.SearchFrom;

import java.util.Optional;

@Controller
@RequestMapping("product")
public class Product1Controller {
	// lấy danh sách màu:
	@Autowired
	CategoryRepository categoryRepository;

	@ModelAttribute("category")
	public List<category> getCategories() {
		List<category> categories = categoryRepository.findAll();
		return categories;
	}

	@GetMapping(path = "insert")
	public String insert(Model model) {
		Product category = new Product();
		model.addAttribute("product", category);
		return "product/insert";
	}

	@Autowired
	ProductRepository productReponsitory;

	@PostMapping(path = "insertComplete")
	public String sanpham(@Valid @ModelAttribute("product") Product category, BindingResult resuilt, Model model) {
		if (resuilt.hasErrors()) {
			return "product/insert";
		}
		productReponsitory.save(category);
		return "redirect:sanpham";
	}
// hàm sửa:
	@GetMapping("edit")
	public String index(@RequestParam(name = "cId") int cId, Model model) {
		Optional<Product> productOption = productReponsitory.findById(cId);
		if (productOption.isEmpty())
			return "redirect:sanpham";
		model.addAttribute("product", productOption.get());
		return "product/insert";
	}

	@PostMapping("edit")
	public String index(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "product/insert";
		}

		Optional<Product> productOption = productReponsitory.findById(product.getid());
		if (productOption.isEmpty()) {
			return "redirect:sanpham";
		}
		Product productold = productOption.get();
		productold.setName(product.getName());
		productReponsitory.save(productold);
		return "redirect:sanpham";
	}

	// hàm xóa
	@GetMapping("delete")
	public String delete(@RequestParam(name = "cId") int cId) {
		Optional<Product> productOption = productReponsitory.findById(cId);
		if (productOption.isEmpty()) {
			return "redirect:sanpham";
		}
		productReponsitory.delete(productOption.get());
		return "redirect:sanpham";
	}

	// phân trang
	private static final int TOI_DA_SAN_PHAM = 5;	

	// tìm kiếm

	@GetMapping("sanpham")
	public String search( // thông tin form tìm kiếm

			@ModelAttribute(name = "searchForm") SearchFrom sf, Model model) {

		Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM,
				sf.getThuTu() ? Direction.ASC : Direction.DESC, // xếp theo trường nào ví dụ id, name, price
				sf.getXepTheo());
		// lấy sản phẩm
		Page<Product> productPage = productReponsitory.findByNameContaining(sf.getTen(), phanTrang);

		model.addAttribute("product", productPage.getContent());
		model.addAttribute("maxPage", productPage.getTotalPages());

		return "/sanpham";
	}

	
}
