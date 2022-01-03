package model;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Transport {
	@Id
	private int number;
	private Time time;
	private Date date;
	private Time duration;
	private int capacity;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private City originCity;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private City destinationCity;
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
	public Time getDuration() {
		return duration;
	}
	public void setDuration(Time duration) {
		this.duration = duration;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
