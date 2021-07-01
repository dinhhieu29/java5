package com.springboot.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import javax.validation.constraints.Size;





@Entity(name = "product")
public class Product {
	@Id
	@GeneratedValue
	private int id;

	@NotBlank(message = "Tên không được để trống")
	@Size(min = 3, max = 30, message = "Tên sản phẩm phải từ 3 - 30 kí tự")
	private String name;

	@NotNull(message = "Giá không được để trống")
	@Min(100000)
	@Max(100000000)
	private long price;	

	@NotNull
	@NotBlank(message = "Ảnh không được để trống")
	private String picture;

	@NotNull
	@NotBlank(message = "Mô tả không được để trống")
	@Size(min = 3, message = "Mô tả phải trên 3 kí tự")
	private String description;

	@NotNull
	private Date createDate = new Date();

	@ManyToOne
	@JoinColumn(name = "c_id", nullable = false, foreignKey = @ForeignKey(name = "c_name"))
	private category category;

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public category getCategory() {
		return category;
	}

	public void setCategory(category category) {
		this.category = category;
	}

	public Product(int id,
			@NotBlank(message = "Tên không được để trống") @Size(min = 3, max = 30, message = "Tên sản phẩm phải từ 3 - 30 kí tự") String name,
			@NotNull(message = "Giá không được để trống") @Min(100000) @Max(100000000) long price,
			@NotNull @NotBlank(message = "Ảnh không được để trống") String picture,
			@NotNull @NotBlank(message = "Mô tả không được để trống") @Size(min = 3, message = "Mô tả phải trên 3 kí tự") String description,
			@NotNull Date createDate, com.springboot.model.category category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.picture = picture;
		this.description = description;
		this.createDate = createDate;
		this.category = category;
	}

	public Product() {
		super();
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Product) {
			return this.id == ((Product) obj).id;
		}
		return false;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.id;
	}
	

}
