package com.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.ForeignKey;

@Entity(name="orderItems")
public class OrderItems {
	@Id
	@GeneratedValue
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "productId", nullable = false, foreignKey = @ForeignKey(name = "product_orderitems"))
	Product product;
	
	int amount;
	double total;
	String name;
	double price;
	
	@ManyToOne
	@JoinColumn(name = "order_id", nullable = false, foreignKey = @ForeignKey(name = "order_orderitems"))
	Orders order;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public OrderItems(int id, Product product, int amount, double total, String name, double price, Orders order) {
		super();
		this.id = id;
		this.product = product;
		this.amount = amount;
		this.total = total;
		this.name = name;
		this.price = price;
		this.order = order;
	}

	public OrderItems() {
		super();
	}

	
	
}
