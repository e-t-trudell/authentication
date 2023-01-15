package com.erictrudell.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.authentication.models.Book;
import com.erictrudell.authentication.services.BookService;
import com.erictrudell.authentication.services.UserService;


@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookServ;
	@Autowired
	private UserService userServ;
	@GetMapping("/add")
    public String goToCreate(@ModelAttribute("book")Book book,
    		HttpSession session) {
		if(session.getAttribute("userId") == null) {
//    		use flash message here to deny access
    		return "redirect:/";
    	}
    	return"newBook.jsp";
    }
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("book")Book book,
			BindingResult result,
			HttpSession session, 
			Model model) {
//		if(session.getAttribute("userId") == null) {
////    		use flash message here to deny access
//    		return "redirect:/";
//    	}
		if(result.hasErrors()) {
			return"newBook.jsp";
		}
//		get user id from session
		Long userId = (Long) session.getAttribute("userId");
//		setting user id from session to the user_id for book creation
		book.setUser(userServ.getOneById(userId));
		bookServ.create(book);
		return"redirect:/home";
	}
	@GetMapping("/show/{book_id}")
    public String showMeWhatYouGot(@PathVariable("book_id") Long id,
    		HttpSession session, 
    		Model model) {
		if(session.getAttribute("userId") == null) {
//    		use flash message here to deny access
    		return "redirect:/";
    	}
//		secure user from session to change text on show.jsp
//		for logged in user 
//		Long loggedInUser = (Long) session.getAttribute("userId");
		model.addAttribute("book",bookServ.getOne(id));
    	return"show.jsp";
    }
	@GetMapping("/edit/{book_id}")
	public String edit(@PathVariable("book_id") Long id,
    		HttpSession session, 
    		Model model) {
		if(session.getAttribute("userId") == null) {
//    		use flash message here to deny access
    		return "redirect:/";
    	}
		model.addAttribute("book",bookServ.getOne(id));
		return "edit.jsp";
	}
	@PutMapping("/update/{book_id}")
	public String update(@Valid @ModelAttribute("book")Book book,
			BindingResult result) {
		if(result.hasErrors()) {
			return"edit.jsp";
		}else {
			bookServ.updateBook(book);
			return"redirect:/home";
		}
	}
	@DeleteMapping("/{id}")
	public String destroy(@PathVariable("id") Long id) {
		bookServ.deleteBook(id);
		return"redirect:/home";
	}
}
