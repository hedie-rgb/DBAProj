package model;

import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class FlightLeg {
	@Id
	private int code;
	private Time duration;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Airport airport;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private OverSea oversea;
	public Time getDuration() {
		return duration;
	}
	public void setDuration(Time duration) {
		this.duration = duration;
	}
}
