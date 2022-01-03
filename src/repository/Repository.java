package repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

public interface Repository<Entity, ID extends Serializable> {
	Entity findbyId(ID id);
	List<Entity> findByIDs(Collection<ID> ids);  
	List<Entity> findAll();  
	Boolean deleteByID(ID id);  
	Boolean DeleteByIDs(Collection<ID> ids);  
	Entity save(Entity E);
}
