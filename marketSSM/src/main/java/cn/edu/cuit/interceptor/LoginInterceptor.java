package cn.edu.cuit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.cuit.entity.*;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取请求的URL
		StringBuffer url = request.getRequestURL();
		// URL:除了login.jsp是可以公开访问的，其余的URL都要进行拦截控制
		if (url.indexOf("/first") > 0 || url.indexOf("/login/login") > 0) {
			return true;
		}
		// 获取session
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("user");
		// 判断session里是不是有登录信息
		if (user != null) {
			return true;
		}
		session.setAttribute("message", "你还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
