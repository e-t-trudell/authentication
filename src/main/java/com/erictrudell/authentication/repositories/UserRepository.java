package com.erictrudell.authentication.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.authentication.models.User;

//do not need to create a repository for loginuser as we are not saving that in the datavase
public interface UserRepository extends CrudRepository<User, Long> {
	public Optional<User> findByEmail(String email);
	public List<User> findAll();
	public User save(String u);
	
}
