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

import model.HotelReservation;
import model.User;

public class HotelReservationDao implements Repository<HotelReservation, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  

	@Override
	public HotelReservation findbyId(Integer id) {
		try {
			return em.find(HotelReservation.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<HotelReservation> findByIDs(Collection<Integer> ids) {
		List<HotelReservation> users = new ArrayList<HotelReservation>();
		try {
			for(int id : ids) {
				users.add(em.find(HotelReservation.class, id));
			}
			return users;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<HotelReservation> findAll() {
		Query q = em.createQuery("select * from Hotel_Reservation");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(HotelReservation.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(HotelReservation.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public HotelReservation  save(HotelReservation E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(HotelReservation.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(HotelReservation.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
