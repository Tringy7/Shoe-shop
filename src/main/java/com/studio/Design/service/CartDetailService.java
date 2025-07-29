package com.studio.Design.service;

import com.studio.Design.domain.CartDetail;
import com.studio.Design.repository.CartDetailRepository;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@AllArgsConstructor
public class CartDetailService {

    private CartDetailRepository cartDetailRepository;

    @Transactional
    public void saveCartDetail(CartDetail cartDetail){
        this.cartDetailRepository.save(cartDetail);
    }
}
