package com.studio.Design.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studio.Design.domain.OrderDetail;
import com.studio.Design.repository.OrderDetailRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderDetailService {

    private OrderDetailRepository orderDetailRepository;

    public void saveOrderDetailList(List<OrderDetail> orderList) {
        this.orderDetailRepository.saveAll(orderList);
    }

    public OrderDetail getOrderDetail(Long id) {
        return this.orderDetailRepository.findById(id).get();
    }

    @Transactional
    public void handleDeleteOrderDetail(OrderDetail orderDetail) {
        this.orderDetailRepository.delete(orderDetail);
    }
}
