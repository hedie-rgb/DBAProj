package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Flight extends Transport{
	private String flightClass;
	private int allowedBaggage; 
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Airport airportOrigin;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Airport airportDestination;
	public String getFlightClass() {
		return flightClass;
	}
	public void setFlightClass(String flightClass) {
		this.flightClass = flightClass;
	}
	public int getAllowedBaggage() {
		return allowedBaggage;
	}
	public void setAllowedBaggage(int allowedBaggage) {
		this.allowedBaggage = allowedBaggage;
	}
}
