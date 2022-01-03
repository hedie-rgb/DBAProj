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

import model.TwoWay;
import model.User;

public class TwoWayDao implements Repository<TwoWay, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  

	@Override
	public TwoWay findbyId(Integer id) {
		try {
			return em.find(TwoWay.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TwoWay> findByIDs(Collection<Integer> ids) {
		List<TwoWay> users = new ArrayList<TwoWay>();
		try {
			for(int id : ids) {
				users.add(em.find(TwoWay.class, id));
			}
			return users;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TwoWay> findAll() {
		Query q = em.createQuery("select * from Two_Way");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(TwoWay.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(TwoWay.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public TwoWay save(TwoWay E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(TwoWay.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(TwoWay.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
