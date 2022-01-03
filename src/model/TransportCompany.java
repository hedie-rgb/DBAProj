package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TransportCompany {
	@ManyToOne
    @JoinColumn(name="number", nullable=false)
	private Transport transportNumber;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Company companyId;

}
