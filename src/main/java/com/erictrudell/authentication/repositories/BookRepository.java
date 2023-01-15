package com.erictrudell.authentication.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.authentication.models.Book;

public interface BookRepository extends CrudRepository<Book, Long>{
	public Optional<Book> findById(Long id);
	public List<Book> findAll();
	public Book save(String u);
	}
