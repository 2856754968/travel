package cn.tjx.Servlet;
/**
 * 验证码验证
 * 用户退出操作
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cn.tjx.service.UserService;

public class VerificationCodeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String code = request.getParameter("check");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if ("register".equals(type)) {// 验证码验证
			String checkCode = session.getAttribute("CHECKCODE_SERVER").toString();
			out.print(checkCode.equals(code));
		} else if ("userCode".equals(type)) {// 激活码验证
			String code1 = request.getParameter("code");
			UserService us = new UserService();
			try {
				out.print(us.activationCodeVerification(code1));
			} catch (Exception e) {
				throw new RuntimeException("激活码异常");
			}
		}else if("exit".equals(type)){
			String url =request.getParameter("url");
			session.removeAttribute("user");
			response.sendRedirect(url);
		}
		out.flush();
		out.close();
	}

}
