package model;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cancelation {
	@Id
	private int id;
	private String rules;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private User user;
	private int refund;
	private Date date;
	private Time time;
	@ManyToOne
    @JoinColumn(name="number", nullable=true)
	private Transport transport;
	@ManyToOne
    @JoinColumn(name="id", nullable=true)
	private Hotel hotel;
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
}
