package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Popularity {
	@Id
	private int id;
	private int score;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private User user;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Hotel hotel;
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
