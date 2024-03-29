package com.ex.domain;

import org.springframework.data.neo4j.annotation.NodeEntity;
import org.springframework.data.neo4j.support.index.IndexType;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@NodeEntity(partial = true)
public class Restaurant {

    private String name;

    @org.springframework.data.neo4j.annotation.Indexed(indexName="REST_LOCATION", indexType=IndexType.POINT)
    private String wktLocation;
    
}
