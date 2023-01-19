package com.erictrudell.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.authentication.models.Book;
import com.erictrudell.authentication.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;
	
	public Book create(Book b) {
    	return bookRepo.save(b);
    }
	public List<Book> getAll(){
		return bookRepo.findAll();
	}
	public Book getOne(Long id) {
		Optional<Book> book = bookRepo.findById(id);
    	if(book.isPresent()) {
    		return book.get();
    	}
    	return null;
	}
//	public Book borrow(User u, Book b) {
//		List<User> borrower = b.getBorrowedBy() ;
//		borrower.add(u);
//		b.setBorrowedBy(borrower);
//		return bookRepo.save(b);
//	}
	public Book updateBook(Book e) {
		return bookRepo.save(e);
	}
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
