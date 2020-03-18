package cn.tjx.service;

import cn.tjx.Dao.RouteDao;
import cn.tjx.entity.Route;

public class RouteService {
	public Route detailed(String rid) throws Exception{
		RouteDao rd = new RouteDao();
		return rd.detailed(rid);
	}

}
