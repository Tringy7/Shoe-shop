package com.studio.Design.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.Order;
import com.studio.Design.domain.OrderDetail;
import com.studio.Design.domain.ProductDetail;
import com.studio.Design.domain.User;
import com.studio.Design.repository.OrderRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderService {

    private ModelMapper modelMapper;
    private CartService cartService;
    private CartDetailService cartDetailService;
    private OrderRepository orderRepository;
    private ProductDetailService productDetailService;
    private OrderDetailService orderDetailService;

    @Transactional
    public void handleOrder(Order order, User user, HttpSession session) {
        Order newOrder = modelMapper.map(order, Order.class);
        newOrder.setUser(user);

        Cart cart = this.cartService.getCartByUser(user);
        newOrder.setTotalPrice(cart.getTotalPrice());

        List<CartDetail> cartDetail = cart.getCartDetails();
        List<OrderDetail> orderDetails = new ArrayList<>();
        if (cartDetail != null) {
            newOrder.setStatus("True");
            this.orderRepository.save(newOrder);

            for (CartDetail it : cartDetail) {
                OrderDetail temp = OrderDetail.builder()
                        .quantity(it.getQuantity())
                        .sizeProduct(it.getSizeProduct())
                        .order(newOrder)
                        .product(it.getProduct())
                        .build();
                orderDetails.add(temp);

                List<ProductDetail> products = it.getProduct().getProductDetails();

                for (ProductDetail pr : products) {
                    if (it.getSizeProduct().equals(pr.getSize())) {
                        Long tempo_quantity = pr.getQuantity() - temp.getQuantity();
                        pr.setQuantity(tempo_quantity);
                        pr.setSold(pr.getSold() + temp.getQuantity());
                        this.productDetailService.saveProductDetail(pr);
                    }
                }

                this.cartDetailService.deleteCartDetail(it);

            }
            cart.setSum(0L);
            this.cartService.saveCart(cart);
            session.setAttribute("sum", 0);
        } else {
            newOrder.setStatus("True");
            this.orderRepository.save(newOrder);
        }

        this.orderDetailService.saveOrderDetailList(orderDetails);
    }

    public Page getOrder(User user, Pageable pageable) {
        return this.orderRepository.findByUser(user, pageable);
    }

    public Page getAllOrder(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Order getAOrder(Long id) {
        return this.orderRepository.findById(id).get();
    }

    public void handleDeleteOrder(Long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            if (orderDetails != null) {
                for (OrderDetail it : orderDetails) {
                    this.orderDetailService.handleDeleteOrderDetail(it);
                }
                this.orderRepository.delete(order);
            }
        }
    }
}
