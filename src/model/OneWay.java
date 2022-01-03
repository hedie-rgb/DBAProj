package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OneWay {
	@Id
	private int id;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Domestic domestic;
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private OverSea oversea;
}
