package com.springboot.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Entity(name="users")
public class Users {
	@Id
	@GeneratedValue
	@Column(name = "user_id")
	private int user_id;

	@Size(min = 3, max = 50, message = "Không được để trống! Tối thiểu 3, tối đa 50 ký tự.")
	@Column(name = "user_name")
	private String user_name;
	
	@NotNull
	@Pattern(regexp = "/((09|03|07|08|05)+([0-9]{8})\\b)/g", message = "Sai định dạng số điện thoại, mời nhập lại!")
	@Column(name = "user_sdt")
	private String user_sdt;
	
	@NotNull
	@Size(min = 5, max = 50, message = "Không được để trống! Tối thiểu 5, tối đa 50 ký tự.")
	@Column(name = "user_tendangnhap", unique = true)
	private String user_tendangnhap;
	
	@Null
	//@Pattern(regexp = "")
	@Column(name = "user_email", unique = true)
	private String user_email;
	
	@NotNull
	@Size(min = 3, max = 50, message = "Không được để trống! Tối thiểu 3, tối đa 50 ký tự.")
	@Column(name = "user_matkhau")
	private String user_matkhau;
	
	@Null
	@Column(name = "user_image")
	private String user_image;
	
	@Null
	@Column(name = "user_chucvu")
	private String user_chucvu;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
	private List<Orders> order;
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_sdt() {
		return user_sdt;
	}

	public void setUser_sdt(String user_sdt) {
		this.user_sdt = user_sdt;
	}

	public String getUser_tendangnhap() {
		return user_tendangnhap;
	}

	public void setUser_tendangnhap(String user_tendangnhap) {
		this.user_tendangnhap = user_tendangnhap;
	}

	public String getUser_matkhau() {
		return user_matkhau;
	}

	public void setUser_matkhau(String user_matkhau) {
		this.user_matkhau = user_matkhau;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getUser_chucvu() {
		return user_chucvu;
	}

	public void setUser_chucvu(String user_chucvu) {
		this.user_chucvu = user_chucvu;
	}

	public Users() {
		super();
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	//ORDER
	public List<Orders> getOrder() {
		return order;
	}

	public void setOrder(List<Orders> order) {
		this.order = order;
	}

	public Users(int user_id,
			@Size(min = 3, max = 50, message = "Không được để trống! Tối thiểu 3, tối đa 50 ký tự.") String user_name,
			@NotNull @Pattern(regexp = "/((09|03|07|08|05)+([0-9]{8})\\b)/g", message = "Sai định dạng số điện thoại, mời nhập lại!") String user_sdt,
			@NotNull @Size(min = 5, max = 50, message = "Không được để trống! Tối thiểu 5, tối đa 50 ký tự.") String user_tendangnhap,
			@Null String user_email,
			@NotNull @Size(min = 3, max = 50, message = "Không được để trống! Tối thiểu 3, tối đa 50 ký tự.") String user_matkhau,
			@Null String user_image, @Null String user_chucvu, List<Orders> order) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_sdt = user_sdt;
		this.user_tendangnhap = user_tendangnhap;
		this.user_email = user_email;
		this.user_matkhau = user_matkhau;
		this.user_image = user_image;
		this.user_chucvu = user_chucvu;
		this.order = order;
	}
	
}
