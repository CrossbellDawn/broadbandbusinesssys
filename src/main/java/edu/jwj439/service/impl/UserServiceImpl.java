package edu.jwj439.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.jwj439.dao.UserDao;
import edu.jwj439.entity.User;
import edu.jwj439.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

}