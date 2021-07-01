package com.springboot.reponsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.model.Orders;

public interface OrderReponsitory extends JpaRepository<Orders, Integer> {
	Page<Orders> findByNameContainingIgnoreCase(String name, Pageable pager);
}
