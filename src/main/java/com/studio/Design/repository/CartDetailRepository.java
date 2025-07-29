package com.studio.Design.repository;

import com.studio.Design.domain.CartDetail;
import com.studio.Design.service.CartDetailService;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
}
