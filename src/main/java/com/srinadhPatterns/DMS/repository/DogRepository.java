package com.srinadhPatterns.DMS.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.srinadhPatterns.DMS.Models.Dog;

public interface DogRepository extends CrudRepository<Dog, Integer>{
	List<Dog> findByName(String name);
}
