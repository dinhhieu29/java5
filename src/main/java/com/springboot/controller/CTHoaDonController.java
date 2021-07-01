package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.model.Orders;
import com.springboot.model.SearchFrom;
import com.springboot.reponsitory.OrderItemsReponsitory;
import com.springboot.reponsitory.OrderReponsitory;

@Controller
@RequestMapping("chi-tiet")
public class CTHoaDonController {
	@Autowired
	OrderReponsitory orderReponsitory;
	
	@Autowired
	OrderItemsReponsitory orderItemsReponsitory;
	
	private static final int MAX_ITEMS = 5;

	// Danh sách sản phẩm trong Dashboard
	@GetMapping("lichsu")
	public String list(@ModelAttribute(name = "searchForm") SearchFrom sf, Model model) {

		Pageable pagin = PageRequest.of(sf.getTrang(), MAX_ITEMS, sf.getThuTu() ? Direction.ASC : Direction.DESC,
				sf.getXepTheo());
		// lấy sản phẩm
		Page<Orders> orderPage = orderReponsitory.findByNameContainingIgnoreCase(sf.getTen(), pagin);
		model.addAttribute("orders", orderPage.getContent());
		model.addAttribute("maxPage", orderPage.getTotalPages());
		return "lichsu";
	}
	
}
