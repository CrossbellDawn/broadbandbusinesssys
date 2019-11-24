package edu.jwj439.dao;

import org.springframework.stereotype.Repository;

import edu.jwj439.entity.User;
@Repository
public interface UserDao {
	 public User login(User user);
}
