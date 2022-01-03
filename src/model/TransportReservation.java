package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class TransportReservation {
	@Id
	private int id;
	private String rules;
	private Date date;
	private int adult;
	private int child;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private User user;
	@OneToOne
    @JoinColumn(name="code", nullable=false)
	private Ticket seat;
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
}
