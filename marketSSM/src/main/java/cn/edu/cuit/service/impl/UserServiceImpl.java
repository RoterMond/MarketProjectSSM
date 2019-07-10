package cn.edu.cuit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.cuit.dao.UserDao;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Override
	public User login(Map<String, String> map) {
		return userDao.login(map);
	}
	@Override
	public User findUserByName(String name) {
		// TODO Auto-generated method stub
		return userDao.findUserByName(name);
	}
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAllUser();
	}

}
