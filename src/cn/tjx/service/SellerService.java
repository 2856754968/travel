package cn.tjx.service;

import cn.tjx.Dao.SellerDao;
import cn.tjx.entity.Seller;

public class SellerService {
	public Seller findAll(int sid){
		SellerDao sd = new SellerDao();
		return sd.findAll(sid);
	}
}
