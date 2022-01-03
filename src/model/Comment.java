package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	@Id
	private int id;
	private Date date;
	private String advantages; 
	private String disadvantages;
	private String conclusion;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private User user;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Hotel hotel;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getConclusion() {
		return conclusion;
	}
	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	public String getAdvantages() {
		return advantages;
	}
	public void setAdvantages(String advantages) {
		this.advantages = advantages;
	}
	public String getDisadvantages() {
		return disadvantages;
	}
	public void setDisadvantages(String disadvantages) {
		this.disadvantages = disadvantages;
	}
}
