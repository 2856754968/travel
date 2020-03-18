package cn.tjx.service;

import java.sql.SQLException;

import cn.tjx.Dao.FavoriteDao;

public class FavoriteService {
	public boolean collect(String rid,String date,String uid) throws SQLException{
		FavoriteDao fd = new FavoriteDao();
		return fd.collect(rid, date, uid);
	}
	
	public boolean count(String uid,String rid) throws SQLException{
		FavoriteDao fd = new FavoriteDao();
		return fd.count(uid, rid);
	}
}
