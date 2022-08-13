package com.caseyjohnson.bookclub1.repo;


import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.caseyjohnson.bookclub1.models.User;

public interface UserRepo extends CrudRepository<User, Long> {
	//searching by email
	Optional<User> findByEmail(String email);
}
