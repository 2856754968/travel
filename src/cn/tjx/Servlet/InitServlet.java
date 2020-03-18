package cn.tjx.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tjx.Dao.Initialize;
import cn.tjx.entity.Category;
import cn.tjx.entity.Route;

public class InitServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Initialize init = new Initialize();
		//最新
		List<Route> newest = init.Newest();
		request.setAttribute("newest", newest);
		//人气
		List<Route> tourist = init.PopularTourist();
		request.setAttribute("tourist", tourist);
		//主题
		List<Route> theme = init.theme();
		request.setAttribute("theme", theme);
		//国内游板块
		List<Route> travel = init.DomesticTravel();
		request.setAttribute("travel", travel);
		//导航栏
		List<Category> bar = init.NavigationBar();
		request.setAttribute("bar", bar);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
