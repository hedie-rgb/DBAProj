package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class HotelReservation {
	@Id
	private int id;
	private Date checkin;
	private Date checkout;
	private Date date;
	private int baby;
	private int adult;
	private int child;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private User user;
	@OneToOne
    @JoinColumn(name="id", nullable=false)
	private Room room;
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getBaby() {
		return baby;
	}
	public void setBaby(int baby) {
		this.baby = baby;
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
