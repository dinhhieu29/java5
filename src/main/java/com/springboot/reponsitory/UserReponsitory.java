package com.springboot.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springboot.model.Users;

public interface UserReponsitory extends JpaRepository<Users, Integer>{
	@Query(value = "select * from users where user_tendangnhap = :tendangnhap and user_matkhau = :matkhau", nativeQuery = true)
	Users login(@Param(value = "tendangnhap") String tendangnhap, @Param(value = "matkhau") String matkhau);
}
