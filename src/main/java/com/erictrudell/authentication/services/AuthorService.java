package com.erictrudell.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.authentication.models.Author;

import com.erictrudell.authentication.repositories.AuthorRepository;

@Service
public class AuthorService {
	@Autowired
	private AuthorRepository authorRepo;
	
	public Author create(Author a) {
    	return authorRepo.save(a);
    }
	public List<Author> getAll(){
		return authorRepo.findAll();
	}
	public Author getOne(Long id) {
		Optional<Author> author = authorRepo.findById(id);
    	if(author.isPresent()) {
    		return author.get();
    	}
    	return null;
		
	}
	public Author updateBook(Author e) {
		return authorRepo.save(e);
	}
	public void deleteBook(Long id) {
		authorRepo.deleteById(id);
	}
}
