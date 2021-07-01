package com.springboot.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.model.OrderItems;

public interface OrderItemsReponsitory extends JpaRepository<OrderItems, Integer>{

}
