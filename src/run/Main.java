package run;

import model.Country;
import repository.CountryDao;

public class Main {
	public static void main(String args[]) {
		Country c =  new Country();
		c.setName("Iran");
		CountryDao d = new CountryDao();
		d.save(c);
	}
}
