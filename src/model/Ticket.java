package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Ticket {
	@Id
	private int code;
	private int seatNumber;
	private int ticketNumber;
	private boolean status;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Transport transport;
	private String type;
	private int cost;
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int number) {
		this.seatNumber = number;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(int ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
}
