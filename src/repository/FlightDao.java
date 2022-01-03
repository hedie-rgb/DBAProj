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

import model.Flight;
import model.User;

public class FlightDao implements Repository<Flight, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  

	@Override
	public Flight findbyId(Integer id) {
		try {
			return em.find(Flight.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Flight> findByIDs(Collection<Integer> ids) {
		List<Flight> users = new ArrayList<Flight>();
		try {
			for(int id : ids) {
				users.add(em.find(Flight.class, id));
			}
			return users;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Flight> findAll() {
		Query q = em.createQuery("select * from Flight");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(Flight.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(Flight.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Flight save(Flight E) {		
		try {
		executeInsideTransaction(entityManager -> entityManager.persist(E));
		return em.find(Flight.class, emf.getPersistenceUnitUtil().getIdentifier(E));
	} catch(Exception e) {
		executeInsideTransaction(entityManager -> entityManager.merge(E));
		return em.find(Flight.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
