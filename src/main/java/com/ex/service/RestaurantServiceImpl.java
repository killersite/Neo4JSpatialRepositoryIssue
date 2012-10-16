package com.ex.service;

import java.util.ArrayList;
import java.util.List;

import org.neo4j.helpers.collection.IteratorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.conversion.EndResult;

import com.ex.domain.Restaurant;
import com.ex.neorepository.RestaurantNeoRepository;

public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired RestaurantNeoRepository resuaurantNeoRepository;
	
	@Override
	public List<Restaurant> findRestaurantNearMe(double lon, double lat) {
		EndResult<Restaurant> results = resuaurantNeoRepository.findWithinDistance("REST_LOCATION", lat, lon, 10);
		return new ArrayList<Restaurant>(IteratorUtil.asCollection(results));
	}
	
}
