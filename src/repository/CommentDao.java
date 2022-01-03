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

import model.Comment;

public class CommentDao implements Repository<Comment, Integer>{
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory(
			"jdbc:sqlserver://localhost/Alibaba.odb;integratedSecurity=true;");
	private EntityManager em=emf.createEntityManager();  

	@Override
	public Comment findbyId(Integer id) {
		try {
			return em.find(Comment.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Comment> findByIDs(Collection<Integer> ids) {
		List<Comment> comments = new ArrayList<Comment>();
		try {
			for(int id : ids) {
				comments.add(em.find(Comment.class, id));
			}
			return comments;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Comment> findAll() {
		Query q = em.createQuery("select * from Comment");
		return q.getResultList();
	}

	@Override
	public Boolean deleteByID(Integer id) {
		try {
			executeInsideTransaction(entityManager -> em.remove(em.find(Comment.class, id)));
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Boolean DeleteByIDs(Collection<Integer> ids) {
		try {
			for(int id : ids) {
				executeInsideTransaction(entityManager -> em.remove(em.find(Comment.class, id)));
			}
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	@Override
	public Comment save(Comment E) {
		try {
			executeInsideTransaction(entityManager -> entityManager.persist(E));
			return em.find(Comment.class, emf.getPersistenceUnitUtil().getIdentifier(E));
		} catch(Exception e) {
			executeInsideTransaction(entityManager -> entityManager.merge(E));
			return em.find(Comment.class, emf.getPersistenceUnitUtil().getIdentifier(E));
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
