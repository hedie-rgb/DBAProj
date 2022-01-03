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

import model.BusTerminal;
import model.User;

public class BusTerminalDao implements Repository<BusTerminal, Integer>{

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  
	
	@Override
	public BusTerminal findbyId(Integer id) {
		try {
			return em.find(BusTerminal.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<BusTerminal> findByIDs(Collection<Integer> ids) {
		List<BusTerminal> busTerminals = new ArrayList<BusTerminal>();
		try {
			for(int id : ids) {
				busTerminals.add(em.find(BusTerminal.class, id));
			}
			return busTerminals;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<BusTerminal> findAll() {
		Query q = em.createQuery("select * from Bus_Terminal");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(BusTerminal.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(BusTerminal.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public BusTerminal save(BusTerminal E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(BusTerminal.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(BusTerminal.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
