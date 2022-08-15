package com.caseyjohnson.bookclub1.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.caseyjohnson.bookclub1.models.Book;
import com.caseyjohnson.bookclub1.models.LoginUser;
import com.caseyjohnson.bookclub1.models.User;
import com.caseyjohnson.bookclub1.repo.BookRepo;
import com.caseyjohnson.bookclub1.repo.UserRepo;

@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private BookRepo bookRepo;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		if(optionalUser.isPresent()) {
			result.rejectValue("email", "unique", "This email is already in the database");
		} 
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "Matches", "The confirm password does not match");
		}
		if(result.hasErrors()) {
			return null;
		}
		
		//hash password
		String hasehd= BCrypt.hashpw(newUser.getConfirmPassword(), BCrypt.gensalt());
		newUser.setPassword(hasehd);
		userRepo.save(newUser);
		return userRepo.save(newUser);
	}
	
	public User login(
			LoginUser newLoginObject,
			BindingResult result
			) {
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "The email is not registered");
			return null;
		}
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid password");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	//----Get all books-------
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	//----create a book----
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
	//----find one book------
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	//---update Book
	public Book updateBook(Book book) {
		return bookRepo.save(book);
	}
	
}
