package com.dojo.grouproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.dojo.grouproject.models.Comment;
import com.dojo.grouproject.services.CommentService;
import com.dojo.grouproject.services.GameService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentServ;
	
	@Autowired
	private GameService gServ;
	
	
	//create new comment
	@PostMapping("/games/{game_id}/addcomment")
	public String addComment(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result,Model model, @PathVariable("game_id")Long game_id, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("game",gServ.findById(game_id));
			return "show.jsp";
		}
		commentServ.createComment(newComment);
		return "redirect:/games/view/{game_id}";
	}
		
	//delete comment
		@DeleteMapping("/games/{game_id}/comment/{comment_id}/delete")
		public String deleteComment(@PathVariable("game_id")Long game_id, @PathVariable("comment_id")Long comment_id, HttpSession session, Model model) {
			model.addAttribute("game",gServ.findById(game_id));
			commentServ.deleteComment(comment_id);
			return "redirect:/games/view/{game_id}";
		}
}
