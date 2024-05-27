package com.dojo.grouproject.controllers;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dojo.grouproject.models.Comment;
import com.dojo.grouproject.models.GameMaker;
import com.dojo.grouproject.models.User;
import com.dojo.grouproject.services.GameService;
import com.dojo.grouproject.services.UserService;

@Controller
@RequestMapping("/games")
public class GameController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private GameService gServ;
	
	// Your Games section
	@GetMapping("")
	public String yourGames(HttpSession session, Model model) {
		if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/logout";
    		}
		Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.findById(userId));
    	model.addAttribute("games", gServ.allGames());
		return "/games.jsp";
	}
	
	// New Game
	@GetMapping("/new")
	public String newGame(@ModelAttribute("newGame")GameMaker newGame, Model model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		User user = userServ.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "/new.jsp";
	}
	
	// Create New Game
	@PostMapping("/new/game")
	public String postGame(@Valid @ModelAttribute("newGame")GameMaker newGame, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "/new.jsp";
		}
		
		User user = userServ.findById((Long) session.getAttribute("userId"));
		
		gServ.create(newGame, user);
		return "redirect:/games";
	}
	
	
	// Edit Game
	@GetMapping("/edit/{id}")
	public String editGame(@PathVariable("id")Long id, Model model) {
		GameMaker editGame = gServ.findById(id);
		model.addAttribute("editGame", editGame);
		return "edit.jsp";
	}
	
	// Confirm Edit
	@PutMapping("/edit/{id}")
	public String updateGame(@Valid @ModelAttribute("editGame")GameMaker editGame, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		gServ.update(editGame);
		return "redirect:/games";
	}
	
	// Delete a game
	@RequestMapping("/{id}/delete")
	public String deleteGame(@PathVariable("id")Long id) {
		gServ.delete(id);
		return "redirect:/games";
	}
	
	// Specific Game
	@GetMapping("/view/{id}")
	public String showGame(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("newComment")Comment newComment) {
		if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/logout";
    		}
		GameMaker viewGame = gServ.findById(id);
		model.addAttribute("game", viewGame);
		Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.findById(userId));
		return "show.jsp";
	}
	
	// View Community Games
	@GetMapping("/community")
	public String community(HttpSession session, Model model) {
		if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/";
    		}
		Long userId = (Long)session.getAttribute("userId");
		model.addAttribute("user", userServ.findById(userId));
		model.addAttribute("games", gServ.allGames());
		return "/community.jsp";
	}
	
}
