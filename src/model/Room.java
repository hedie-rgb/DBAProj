package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Room {
	@Id
	private int code;
	private String meal;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Hotel hotel;
	private String type;
	private boolean available;
	private int costPerNight;
	private int bedrooms;
	private int number;
	public String getMeal() {
		return meal;
	}
	public void setMeal(String meal) {
		this.meal = meal;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public int getBedrooms() {
		return bedrooms;
	}
	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}
	public int getCostPerNight() {
		return costPerNight;
	}
	public void setCostPerNight(int costPerNight) {
		this.costPerNight = costPerNight;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
}
