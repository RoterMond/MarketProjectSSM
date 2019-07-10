package cn.edu.cuit.service;

import java.util.List;
import java.util.Map;

import cn.edu.cuit.entity.User;

public interface UserService {
	/**
	 * 登陆
	 * @param map
	 * @return User
	 */
	public User login(Map<String,String> map);
	
	public User findUserByName(String name);
	
	public List<User> findAllUser();
}
