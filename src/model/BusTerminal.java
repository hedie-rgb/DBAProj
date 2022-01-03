package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BusTerminal {
	@Id
	private int id;
	private String name;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private City city;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
