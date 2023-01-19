package com.erictrudell.authentication.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erictrudell.authentication.models.Book;
import com.erictrudell.authentication.models.LoginUser;
import com.erictrudell.authentication.models.User;
import com.erictrudell.authentication.services.BookService;
import com.erictrudell.authentication.services.UserService;

@Controller
public class HomeController {
    
    // Add once service is implemented:
	@Autowired
	private UserService userServ;
	@Autowired
	private BookService bookServ;
   
    @GetMapping("/")
    public String index(Model model,
    		HttpSession session) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        session.removeAttribute("userId");
        List<User> allUsers = userServ.getAll();
        model.addAttribute("allUsers", allUsers);
        return "index.jsp";
    }
//    FLASH MESSAGES
    @GetMapping("/createError")
    public String flashMessage(RedirectAttributes redirectAtt) {
    	redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    	return "redirect:/";
    }
    @GetMapping("/home")
    public String home(@ModelAttribute("book_id")Book book,
    		Model model, 
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
//    	first list is for total list of all users
    	List<Book> allBooks = bookServ.getAll();
    	model.addAttribute("allBooks", allBooks);
    	model.addAttribute("borrowed", book);
//    	second list is just no borrower id
//    	List<Book> availBooks = bookServ.getBorrowed() ;
//    	model.addAttribute("someBooks", availBooks);
    	
    	System.out.println(model.getAttribute("borrowed"));
    	if(session.getAttribute("userId") == null) {
//    		use flash message here to deny access
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("userId", userServ.getOneById(userId));
//    	User user = (User) session.getAttribute("userId");
//    	model.addAttribute("user", user);
    	
    	return"home.jsp";
    }
    @GetMapping("/home/{id}")
    public String userPage(@PathVariable("id") Long id,
    		Model model, 
    		HttpSession session) {
//    	pass in two models
    	List<Book> allBooks = bookServ.getAll();
    	model.addAttribute("allBook", allBooks);
    	if(session.getAttribute("userId") == null) {
//    		use flash message here to deny access
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
    	return"home.jsp";
    }
//    easy way
//    @PostMapping("/register")
//    public String register(@Valid @ModelAttribute("newUser") User newUser,
//    		BindingResult result,
//    		Model model,
//    		HttpSession session) {
//    	userServ.register(newUser, result);
//        if(result.hasErrors()) {
//            model.addAttribute("newLogin", new LoginUser());
//            
//            return "index.jsp";
//        }else {
////        add user to db
////        add user id to session
//        User createdUser = userServ.create(newUser);
//        session.setAttribute("userId", createdUser.getId());
//        return "redirect:/home";
//        }
//    }
//    Slick way: keeps most of logic in service not in controller
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
    		BindingResult result,
    		Model model,
    		HttpSession session) {
    	User createdUser = userServ.register(newUser, result);
//    	System.out.println(createdUser);
        if(createdUser == null) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        userServ.create(createdUser);
//        	System.out.println(createdUser);
        session.setAttribute("userId", createdUser.getId());
//        	System.out.println(session.getAttribute("userId"));
        return "redirect:/home";
        
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
             Model model,
             BindingResult result,
             HttpSession session) {
        User loggedUser = userServ.login(newLogin, result);
        if(loggedUser == null) {
        	
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("userId", loggedUser.getId());
        return"redirect:/home";
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
    
        
    }
    @GetMapping("/logout")
    public String leave(HttpSession session) {
    	session.removeAttribute("userId");
//    	session.invalidate();
    	
    	return "redirect:/";
    }
    
    
}