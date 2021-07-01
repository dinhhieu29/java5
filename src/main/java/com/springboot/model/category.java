package com.springboot.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import com.sun.istack.NotNull;



@Entity(name="category")
public class category {
	@Id
	@GeneratedValue
	@Column(name = "c_id")
	private int id;
	
	@NotNull
	@Size(min = 3, max = 30)
	@Column(name = "c_name")
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category"/* , cascade = CascadeType.ALL */)
	//xóa danh mục khi có sản phẩm trùng danh mục bằng cascade 
	private List<Product> products;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public category(int id, @Size(min = 3, max = 30) String name, List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.products = products;
	}

	public category() {
		super();
	}

	
}
