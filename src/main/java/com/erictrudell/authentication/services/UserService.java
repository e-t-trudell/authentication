package com.erictrudell.authentication.services;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.erictrudell.authentication.models.LoginUser;
import com.erictrudell.authentication.models.User;
import com.erictrudell.authentication.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    
    public User create(User u) {
    	return userRepo.save(u);
    }
    public User getOneById(Long id) {
    	Optional<User> user = userRepo.findById(id);
    	if(user.empty() != null) {
    		return user.get();
    	}
    	return null;
    	
    }
    public List<User> getAll() {
    	return userRepo.findAll();
    }
//register #1
//    public User register(User newUser, BindingResult result) {
//    	
//    	if(newUser.getPassword().equals(newUser.getConfirm())) {
//    		return newUser;
//    	}
//    	else {
//    		result.rejectValue("confirm", "werewolf", "Passwords don't match!");
//    		return null;
//    	}
//        
//    }
//    short sweet elegant register: checks if pass and confirm match 
//    if not rejects with new error message
//    register #2
//    public void register(User newUser, BindingResult result){
//    	if(newUser.getPassword().equals(newUser.getConfirm())) {
//    		result.rejectValue("confirm", "werewolf", "Passwords don't match!");
//    	}
//    	
//    
//    } 
//    Slick way. compare passwords if non match add error message
//    else if no errors exist then create new user
    public User register(User newUser, BindingResult result){
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "werewolf", "Passwords don't match!");
    	}else {
    		if(result.hasErrors()) {
//    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    			return null;
    		}
    		
    	}return this.create(newUser);
 
    } 
    public User login(LoginUser newLogin,
    		BindingResult result) {
    	Optional<User> user = userRepo.findByEmail(newLogin.getEmail());
//    	String hashed = BCrypt.hashpw(newLogin.getPassword(), BCrypt.gensalt());
    	if(user.isPresent() && newLogin.getPassword().equals(user.get().getPassword())) {
    		return user.get();
    	}
//    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
//    	    result.rejectValue("password", "Matches", "Invalid Password!");
//    	}
    	result.rejectValue("password", "Werewolf", "Invalid credentials");
    	return null;
    }
}