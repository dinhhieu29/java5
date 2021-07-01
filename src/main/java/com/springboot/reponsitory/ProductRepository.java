package com.springboot.reponsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.model.Product;



public interface ProductRepository  extends JpaRepository<com.springboot.model.Product, Integer>{
	@Query(value = "select * from product where name ~* ?1", nativeQuery = true)
	Page<Product> findByNameContaining(String name, Pageable pager);

	@Query(value = "select * from product order by product_id ASC", nativeQuery = true)
	Page<Product> SortByIdTang(String giatri, Pageable pager);

	@Query(value = "select * from product order by product_id DESC", nativeQuery = true)
	Page<Product> SortByIdGiam(String giatri, Pageable pager);

	@Query(value = "select * from product order by price DESC", nativeQuery = true)
	Page<Product> SortByPriceGiam(String price, Pageable pager);
	 

}
