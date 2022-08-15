package com.caseyjohnson.bookclub1.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caseyjohnson.bookclub1.models.Book;
import com.caseyjohnson.bookclub1.models.LoginUser;
import com.caseyjohnson.bookclub1.models.User;
import com.caseyjohnson.bookclub1.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String index(
			@ModelAttribute("newUser") User newUser, 
			@ModelAttribute("newLogin") LoginUser newLogin
			) {
		return "login.jsp";
	}
	
	@PostMapping("/register")
	public String newUser(
			@Valid
			@ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		userService.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
		session.setAttribute("userId", newUser.getId());
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid
			@ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		User user= userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("userName", user.getUserName());
		return "redirect:/home";
	}
	
	@RequestMapping("/home")
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return"redirect:/login";
		}
		List<Book> allBooks= userService.allBooks();
		model.addAttribute("bookList", allBooks);
		return "home.jsp";
	}
	
	
	@RequestMapping("/create/book")
	public String renderCreateBook(@ModelAttribute("book") Book book) {
		return "createBook.jsp";
	}
	
	@PostMapping("/create/book")
	public String processCreateBook(
			@Valid
			@ModelAttribute("book")Book book,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "createBook.jsp";
		}else {
			userService.createBook(book);
			return "redirect:/home";
		}
	}
	
	@RequestMapping("/book/{id}")
	public String showBook(@PathVariable("id")Long id, Model model, HttpSession session) {
		Book foundBook = userService.oneBook(id);
		model.addAttribute("oneBook",foundBook);
		return"details.jsp";
	}
	
	@RequestMapping("/book/{id}/edit")
	public String editBook(@PathVariable("id")Long id, Model model) {
		model.addAttribute("book", userService.oneBook(id));
		return "editBook.jsp";
	}
	
	@PutMapping("/book/{id}/edit")
	public String processEdit(
			@Valid
			@ModelAttribute("book")Book book,
			BindingResult result,
			HttpSession session
			) {
		if(session.getAttribute("userId")== null) {
			return"redirect:/login";
		}
		if(result.hasErrors()) {
			return "editBook.jsp";
		} else {
			userService.updateBook(book);
			return "redirect:/home";
		}
	}
}
