package com.springboot.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ForeignKey;

@Entity(name="orders")
public class Orders {
	@Id
	@GeneratedValue
	private int id;
	
	@NotNull
	private Date created = new Date((new java.util.Date()).getTime());
	
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "user_id"))
	Users user;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderItems> order_items;
	
	@NotNull(message = "Địa chỉ nhận hàng không được để trống!")
	@NotBlank(message = "Địa chỉ nhận hàng không được để trống!")
	private String address;
	
	@NotNull
	@NotBlank(message = "Số điện thoại không được để trống!")
	private String phoneNumber;
	
	@NotBlank(message = "Tên khách hàng không được để trống!")
	@Size(min = 5, max = 50, message = "Tên khách hàng tối thiểu 5, tối đa 50 ký tự!")
	private String name;
	
	//@Pattern(regexp = "")
	@Column(name = "email")
	private String email;
	@Column(name = "total")
	double total;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<OrderItems> getOrder_items() {
		return order_items;
	}

	public void setOrder_items(List<OrderItems> order_items) {
		this.order_items = order_items;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Orders() {
		super();
	}

	public String getDateFormat() {
		SimpleDateFormat formatter = new SimpleDateFormat(" dd/MM/yyyy");
        return formatter.format(getCreated());
	}
	
}
