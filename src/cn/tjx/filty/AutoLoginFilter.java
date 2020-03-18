package cn.tjx.filty;
/**
 * 自动登录
 */
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.tjx.entity.User;
import cn.tjx.service.UserService;

public class AutoLoginFilter implements Filter {
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		// 获得cookie中的用户名和密码进行登录操作
		// 定义uid
		String uid = null;
		// 定义username
		String userName = null;
		// 定义password
		String password = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			// 获得名字是username和password还有uid的cookie
			for (Cookie cookie : cookies) {
				if ("uid".equals(cookie.getName())) {
					uid = cookie.getValue();
				}
				if ("userName".equals(cookie.getName())) {
					userName = cookie.getValue();
				}
				if ("password".equals(cookie.getName())) {
					password = cookie.getValue();
				}
			}
		}
		// 判断username和password还有uid是否是null
		if (uid != null && userName != null && password != null) {
			HttpSession session = req.getSession();
			UserService us = new UserService();
			User login = us.login(userName, password);
			// 将登陆的用户存到session中
			if (login != null) {
				session.setAttribute("user", login);
			}
		}
		chain.doFilter(request, response);// 放行
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
