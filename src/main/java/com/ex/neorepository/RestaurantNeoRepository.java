package com.ex.neorepository;

import org.springframework.data.neo4j.repository.GraphRepository;
import org.springframework.data.neo4j.repository.SpatialRepository;

import com.ex.domain.Restaurant;

public interface RestaurantNeoRepository extends GraphRepository<Restaurant>, SpatialRepository<Restaurant> {

}
