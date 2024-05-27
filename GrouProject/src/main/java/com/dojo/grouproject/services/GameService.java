package com.dojo.grouproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dojo.grouproject.models.GameMaker;
import com.dojo.grouproject.models.User;
import com.dojo.grouproject.repositories.GameRepository;

@Service
public class GameService {
	@Autowired
	private GameRepository gRepo;
	
	public GameMaker findById(Long id) {
		Optional<GameMaker> result = gRepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public List<GameMaker> allGames(){
		return gRepo.findAll();
	}
	public GameMaker create(GameMaker game, User user) {
		game.setUser(user);
		return gRepo.save(game);
	}
	public GameMaker update(GameMaker game) {
		return gRepo.save(game);
	}
	
	public void delete(Long id) {
		gRepo.deleteById(id);
	}
	
}
