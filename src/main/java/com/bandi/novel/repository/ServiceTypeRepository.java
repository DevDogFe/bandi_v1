package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.ServiceType;

@Mapper
public interface ServiceTypeRepository {

	List<ServiceType> selectAll();
}
