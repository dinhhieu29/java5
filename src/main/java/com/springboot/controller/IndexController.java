package com.springboot.controller;

import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.controller.GobalController.LAST_PAGE;
import com.springboot.model.Login;
import com.springboot.model.OrderItems;
import com.springboot.model.Orders;
import com.springboot.model.Product;
import com.springboot.model.SearchFrom;
import com.springboot.reponsitory.OrderItemsReponsitory;
import com.springboot.reponsitory.OrderReponsitory;
import com.springboot.reponsitory.ProductRepository;
import com.springboot.service.CustomerService;
import com.springboot.service.GioHangService;
import com.springboot.service.MailService;


@Controller
public class IndexController {
	 
	@Autowired
	ProductRepository productReponsitory;
	  	
	 
	@Autowired
	GioHangService gioHangService;
	@GetMapping("giohang")
	public void gioHang(Model model) {
		model.addAttribute("gioHang", gioHangService.getGioHang());
	}
	@GetMapping("them-vao-gio/{idSanPham}")
	public String addGioHang(@PathVariable("idSanPham") int idSanPham) {
	gioHangService.themSanPham(idSanPham);
	return "redirect:/index";
	}
	@GetMapping("cong-san-pham/{idSanPham}")
	public String congsanpham(@PathVariable("idSanPham") int idSanPham) {
	gioHangService.congSanPham(idSanPham);
	return "redirect:/giohang";
	}
	@GetMapping("tru-san-pham/{idSanPham}")
	public String truSanPham(@PathVariable("idSanPham") int idSanPham) {
	gioHangService.truSanPham(idSanPham);
	return "redirect:/giohang";
	}
	@GetMapping("xoa-san-pham/{idSanPham}")
	public String xoaSanPham(@PathVariable("idSanPham") int idSanPham) {
	gioHangService.xoaSanPham(idSanPham);
	return "redirect:/giohang";
	}
	//tìm kiếm
	 private static final int TOI_DA_SAN_PHAM = 5;
	  @GetMapping(value = { "index", "/" } )
		public String search( // thông tin form tìm kiếm

				@ModelAttribute(name = "searchForm") SearchFrom sf, Model model) {

			Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM,
					sf.getThuTu() ? Direction.ASC : Direction.DESC, // xếp theo trường nào ví dụ id, name, price
					sf.getXepTheo());
			// lấy sản phẩm
			Page<Product> productPage = productReponsitory.findByNameContaining(sf.getTen(), phanTrang);

			model.addAttribute("product", productPage.getContent());
			model.addAttribute("maxPage", productPage.getTotalPages());
			
			
			model.addAttribute("currentUser", customerService.getUsers());

			return "index"; 
		}
	 
	//gửi mail khi hoàn thành đặt hàng
		@GetMapping("hoan-thanh-dat-hang")
		public String index(Model model) {
			if(!customerService.isUserLogin()) {
				return "redirect:/login";
			}
			model.addAttribute("gioHang", gioHangService.getGioHang());
			
			customerService.setLastPage(LAST_PAGE.CART);
			
			model.addAttribute("currentUser", customerService.getUsers());
			
			model.addAttribute("order",new Orders());
			
			return "thanhtoan";
		}
		
		@Autowired
		MailService mailService;
		
		@Autowired
		OrderReponsitory orderRepository;
		@Autowired
		OrderItemsReponsitory orderItemsRepository;
		@PostMapping("hoan-thanh-dat-hang")
		public String hoanthanhgio(@Valid @ModelAttribute("order") Orders orders, BindingResult result, Model model) {
			if(result.hasErrors()) {
				return "thanhtoan";
			}
			//lưu thông tin user vào order
			orders.setUser(customerService.getUsers());
			orders.setTotal(gioHangService.getTotal());
			orderRepository.save(orders);
			
			//luu chi tiet gio hang
			Map<Product, Integer> listItems = gioHangService.getGioHang().getChiTietGioHang();
			
			for(Product pr:listItems.keySet()) {
				OrderItems item = new OrderItems();
				item.setAmount(listItems.get(pr));
				item.setName(pr.getName());
				item.setOrder(orders);
				item.setPrice(pr.getPrice());
				item.setProduct(pr);
				item.setTotal(listItems.get(pr) * pr.getPrice());
				
				orderItemsRepository.save(item);
			}
			
			mailService.pushMail(orders, listItems);
			
			//lam moi lai gio hang
			gioHangService.getGioHang().getChiTietGioHang().clear();
			return "redirect:/index";
		}
		@GetMapping("chitiet")
		public String chitietsanpham(@RequestParam(name = "cId")int cId, Model model) {
			Optional<Product> productOption = productReponsitory.findById(cId);
			if (productOption.isEmpty())
				return "redirect:index";
			model.addAttribute("spDetail", productOption.get());
			return "thongtinsanpham";
		}
		
		@Autowired
		CustomerService customerService;
		
		//đăng nhập
		@GetMapping("login")
		public String login(Model model) {
			model.addAttribute("dangnhap",new Login());
			return "login";
		}
		
		@PostMapping("login")
		public String loginPostMapping(@Valid @ModelAttribute("dangnhap") Login dangnhap, Model model) {
			if(customerService.dangNhap(dangnhap.getTenDangNhap(), dangnhap.getMatKhau())) {
				if(customerService.getLastPage()==LAST_PAGE.CART){
					
					return "redirect:/hoan-thanh-dat-hang";
				}
					return "redirect:/index";
			}else {
				model.addAttribute("dangnhap", dangnhap);
				model.addAttribute("message", "Tai khoan, mat khau khong chinh xac!");
				return "login";
			}
			
		}
		
		@GetMapping("logout")
		public String logout() {
			customerService.dangXuat();
			return "redirect:/index";
		}		
		
		@GetMapping("dangky")
		public String dangky(Model model) {
			model.addAttribute("gioHang",gioHangService.getGioHang());
			return "dangky";
		}
		  
		 
}
