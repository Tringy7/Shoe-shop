package com.studio.Design.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "cartDetails")
@Getter
@Setter
@NoArgsConstructor
public class CartDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double price;
    private Long quantity;

    @ManyToOne()
    @JoinColumn(name = "cartId")
    private Cart cart;

    @ManyToOne()
    @JoinColumn(name = "productId")
    private Product product;
}
