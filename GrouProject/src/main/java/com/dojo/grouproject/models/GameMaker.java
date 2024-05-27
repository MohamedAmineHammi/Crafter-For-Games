package com.dojo.grouproject.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="game")
public class GameMaker {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Create a title for your game!")
	private String title;
	
	@NotEmpty(message="Provide the language of your game!")
	private String language;
	
	@NotNull(message="Is your game Co-op/Multiplayer?")
	private Boolean multiplayer;
	
	@NotEmpty(message="Choose a genre for your game!")
	private String genre;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	
	@OneToMany(mappedBy="game",fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Comment> comments;
	


	public GameMaker() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Boolean getMultiplayer() {
		return multiplayer;
	}

	public void setMultiplayer(Boolean multiplayer) {
		this.multiplayer = multiplayer;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}
	
	
