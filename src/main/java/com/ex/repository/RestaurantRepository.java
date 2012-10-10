package com.ex.repository;

import com.ex.domain.Restaurant;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Restaurant.class)
public interface RestaurantRepository {
}
