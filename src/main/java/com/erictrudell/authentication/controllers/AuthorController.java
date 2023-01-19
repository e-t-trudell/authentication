package com.erictrudell.authentication.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.authentication.models.Author;
import com.erictrudell.authentication.models.Book;
import com.erictrudell.authentication.services.AuthorService;
import com.erictrudell.authentication.services.BookService;

@Controller
@RequestMapping("/author")
public class AuthorController {
	
	@Autowired
	private BookService bookServ;
	@Autowired
	private AuthorService authorServ;
	
	@GetMapping("/new")
	public String newAuthor(Model model) {
		List<Author> allAuth = authorServ.getAll();
		List<Book> books = bookServ.getAll();
		model.addAttribute("allAuth", allAuth);
		model.addAttribute("author", new Author());
		model.addAttribute("books", books);
		return"newAuthor.jsp";
	}
	@PostMapping("/create")
	public String createNewAuthor(@Valid @ModelAttribute("author")Author author,
			BindingResult result) {
		if(result.hasErrors()) {
			return"newAuthor.jsp";
		}
		authorServ.create(author);
//		List<Author> allAuth = authorServ.getAll();
//		model.addAttribute("allAuth", allAuth);
		return"redirect:/author/new";
	}
}
