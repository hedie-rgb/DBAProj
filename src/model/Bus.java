package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Bus extends Transport{
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private BusTerminal busOriginTerminal;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private BusTerminal busDestinationTerminal;

}
