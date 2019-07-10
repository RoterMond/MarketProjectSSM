package cn.edu.cuit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.cuit.dao.UserDao;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.UserService;

@Controller // 控制器
@RequestMapping("/user") // SpringMVC接受URL为/user的请求
public class UserController {
	@Resource
	private UserService userService;

	@Resource
	private UserDao userDao;

	// 登陆模块
	@RequestMapping("/login") // SpringMVC接受URL为/user/login的请求
	public ModelAndView login(HttpServletRequest request, ModelAndView mv) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_name", request.getParameter("user_name"));
		map.put("user_pass", request.getParameter("user_pass"));
		User user = userService.login(map);
		HttpSession session = request.getSession();
		
		// 查询到user不为空
		if (user != null) {
			session.setAttribute("user", user);
			session.setAttribute("message", "登陆成功！");

			return new ModelAndView("redirect:/goods/toGoodsList");
		} else {
			session.setAttribute("message", "用户名或密码错误，请重新输入！");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping("/toLogin")
	public ModelAndView toLogin(HttpServletRequest request, ModelAndView mv) {

		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("/logout") // SpringMVC接受URL为/user/logout
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv) {

		HttpSession session = request.getSession();
		session.invalidate();
		mv.setViewName("login");

		return mv;
	}
}
