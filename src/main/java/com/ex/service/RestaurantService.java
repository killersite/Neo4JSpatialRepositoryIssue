package com.ex.service;

import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import com.ex.domain.Restaurant;

@RooService(domainTypes = { com.ex.domain.Restaurant.class })
public interface RestaurantService {

	List<Restaurant> findRestaurantNearMe(double lon, double lat);

}
