package model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class HotelPopularPlace {
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private Hotel hotel;
	@ManyToOne
    @JoinColumn(name="id", nullable=false)
	private PopularPlace popularPlace;
}
