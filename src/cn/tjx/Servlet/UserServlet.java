package cn.tjx.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tjx.Dao.MailUtils;
import cn.tjx.Dao.Md5Util;
import cn.tjx.Dao.UUID;
import cn.tjx.entity.User;
import cn.tjx.service.UserService;

public class UserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User u = new User();
		PrintWriter out = response.getWriter();
		u.setUsername(request.getParameter("username"));
		try {
			u.setPassword(Md5Util.encodeByMd5(request.getParameter("password")));
		} catch (Exception e) {
			throw new RuntimeException("加密错误");
		}
		u.setEmail(request.getParameter("email"));
		u.setName(request.getParameter("name"));
		u.setTelephone(request.getParameter("telephone"));
		u.setSex(request.getParameter("sex"));
		u.setBirthday(request.getParameter("birthday"));
		u.setCode(UUID.getUUID());
		u.setStatus("N");
		UserService us = new UserService();
		int add = us.Add(u);
		if (add > 0) {
			out.print(
					"<script type='text/javascript'> alert('恭喜，注册成功！请登录您的注册邮箱进行激活您的账号，激活后才能登录。!'); location.href='/travel/index.jsp';</script>");
		} else {
			out.print("<script type='text/javascript'> alert('添加失败!'); history.back();</script>");
		}
		MailUtils.sendMail(u.getEmail(), "激活码为:" + u.getCode(), "青鸟旅游");
	}

}
