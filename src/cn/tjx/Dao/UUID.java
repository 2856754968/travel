package cn.tjx.Dao;

public class UUID {

    public static String getUUID(){
        String uuid = java.util.UUID.randomUUID().toString(); 
        return uuid;
    }
}