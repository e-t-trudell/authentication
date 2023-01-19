package com.erictrudell.authentication.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.authentication.models.Author;

public interface AuthorRepository extends CrudRepository<Author, Long>{
	public Optional<Author> findById(Long id);
	public List<Author> findAll();
	public Author save(String u);
}
