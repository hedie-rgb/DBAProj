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

import model.Bus;
import model.User;

public class BusDao implements Repository<Bus, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  

	@Override
	public Bus findbyId(Integer id) {
		try {
			return em.find(Bus.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Bus> findByIDs(Collection<Integer> ids) {
		List<Bus> buses = new ArrayList<Bus>();
		try {
			for(int id : ids) {
				buses.add(em.find(Bus.class, id));
			}
			return buses;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Bus> findAll() {
		Query q = em.createQuery("select * from Bus");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(Bus.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(Bus.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Bus save(Bus E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(Bus.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(Bus.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
