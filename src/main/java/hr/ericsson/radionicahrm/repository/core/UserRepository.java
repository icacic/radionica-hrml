package hr.ericsson.radionicahrm.repository.core;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import hr.ericsson.radionicahrm.domain.core.User;

public interface UserRepository extends CrudRepository<User, Long>,  JpaSpecificationExecutor<User> {

    List<User> findFirst5ByUsername(String username);    
}
