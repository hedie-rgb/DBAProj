package repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Airport;

public class AirportDao implements Repository<Airport, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager(); 

	@Override
	public Airport findbyId(Integer id) {
		try {
			return em.find(Airport.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Airport> findByIDs(Collection<Integer> ids) {
		List<Airport> airports = new ArrayList<Airport>();
		try {
			for(int id : ids) {
				airports.add(em.find(Airport.class, id));
			}
			return airports;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Airport> findAll() {
		Query q = em.createQuery("select * from Airport");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(Airport.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(Airport.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Airport save(Airport E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(Airport.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(Airport.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		}
	}
	
	private void executeInsideTransaction(Consumer<EntityManager> action) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            action.accept(em);
            tx.commit(); 
        }
        catch (RuntimeException e) {
            tx.rollback();
            throw e;
        }
    }

}
