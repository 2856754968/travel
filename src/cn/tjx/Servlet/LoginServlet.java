package cn.tjx.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import cn.tjx.Dao.Md5Util;
import cn.tjx.entity.User;
import cn.tjx.service.UserService;

/**
 * 登录界面以及自动登录
 */
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("username");
		String pwd = null;
		try {
			pwd = Md5Util.encodeByMd5(request.getParameter("password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = request.getParameter("url");
		UserService us = new UserService();
		HttpSession session = request.getSession();
		User user = us.login(name, pwd);
		if (user != null) {// 成功登陆
			if ("Y".equals(user.getStatus())) {// 判断用户是否已经激活
				// 是否勾选了自动登录
				String[] autoLogin = request.getParameterValues("autoLogin");
				if (autoLogin != null) {
					// 用户名和密码保存到Cookie中
					Cookie uid = new Cookie("uid", user.getUid() + "");
					Cookie userName = new Cookie("userName", user.getUsername());
					Cookie passwrod = new Cookie("password", user.getPassword());
					// 设置时效
					uid.setMaxAge(60);
					userName.setMaxAge(60);
					passwrod.setMaxAge(60);
					// 设置cookie的携带路径
					uid.setPath(request.getContextPath());
					userName.setPath(request.getContextPath());
					passwrod.setPath(request.getContextPath());
					// 发送cookie
					response.addCookie(uid);
					response.addCookie(userName);
					response.addCookie(passwrod);
				}
				session.setAttribute("user", user);// 保存到session域对象中 
				response.sendRedirect(url);// 重定向到首页
			} else {
				// 登录失败 转发到登录界面，并给出提示
				request.setAttribute("msg", "该用户还没有激活");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} else {
			// 登录失败 转发到登录界面，并给出提示
			request.setAttribute("msg", "用户名或密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	

}
