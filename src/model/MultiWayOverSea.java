package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class MultiWayOverSea extends MultiWay{
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private OverSea oversea;
}
