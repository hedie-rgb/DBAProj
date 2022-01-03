package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BetweenTerminals {
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Bus bus;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private BusTerminal busTerminal;
}
