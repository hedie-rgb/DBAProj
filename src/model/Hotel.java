package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Hotel {
	@Id
	private int id;
	private String name;
	private String about;
	private int stars;
	private String accomondationType;
	private String rules;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private City city;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getAccomondationType() {
		return accomondationType;
	}
	public void setAccomondationType(String accomondationType) {
		this.accomondationType = accomondationType;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
}
