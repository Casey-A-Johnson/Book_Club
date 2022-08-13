package com.caseyjohnson.bookclub1.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.caseyjohnson.bookclub1.models.Book;

public interface BookRepo extends CrudRepository<Book, Long> {
	List<Book> findAll();
}
