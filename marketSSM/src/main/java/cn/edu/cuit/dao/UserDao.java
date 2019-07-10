package cn.edu.cuit.dao;

import java.util.List;
import java.util.Map;

import cn.edu.cuit.entity.*;

/**
 * @author PQX
 *
 */
public interface UserDao {
	
	/**
	 * 根据用户名和密码封装成map查询用户表<用做登陆>
	 * @param map
	 * @return User
	 */
	public User login(Map<String, String> map);
	
	/**
	 * 根据用户名查询用户表
	 * @param userName
	 * @return User
	 */
	public User findUserByName(String user_name);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> findAllUser();
}
