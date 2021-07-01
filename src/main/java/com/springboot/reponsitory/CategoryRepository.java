package com.springboot.reponsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.springboot.model.category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CategoryRepository extends JpaRepository<category, Integer>{
	Page<category> findByNameContainingIgnoreCase(String Ten, Pageable pager);
}
