package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TwoWay {
	@Id
	private int id;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Domestic domestic1;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private OverSea oversea1;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Domestic domestic2;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private OverSea oversea2;
}
