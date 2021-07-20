package com.bid.pack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Game {

	private int id;
	private String name;
	private String gameDescription;
	private String thumbnail;
	private String path;

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet res = null;
	
	
//	Game Constructor
	public Game(int id, String name, String gameDescription, String thubnail, String path) {
		super();
		this.id = id;
		this.name = name;
		this.gameDescription = gameDescription;
		this.thumbnail = thubnail;
		this.path = path;
	}
	
	
	
//	Getters
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getGameDescription() {
		return gameDescription;
	}

	public String getThubnail() {
		return thumbnail;
	}

	public String getPath() {
		return path;
	}


	
//	Get All Details About All Games
	public static ArrayList<Game> getGames() {
		ArrayList<Game> ret = new ArrayList<Game>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from games";
			
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				int id = res.getInt(1);
				String name = res.getString(2);
				String gameDescription = res.getString(3);
				String thumbnail = res.getString(4);
				String path = res.getString(5);
				
				Game r = new Game(id, name, gameDescription, thumbnail, path);
				ret.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ret;
	}

	
	
//	Get Thumbnail Path Belongs To A Specific Game
	public static String getThumbnail(int id) {
		String r= null;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select thumbnail from gametune_db.games where id = "+id+";";
			
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				r = res.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}


//	Get Game Name Belongs To A Specific Game ID
	public static String getGameName(int id){
		
		String n = null;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select name from gametune_db.games where id = "+id+";";
			
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				n = res.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	
//	Get All Platform Names
	public static ArrayList<String> getPlatforms() {
		ArrayList<String> ret = new ArrayList<String>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT distinct platform FROM gametune_db.game_platforms;";
			
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				String platform = res.getString(1);
				
				ret.add(platform);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ret;
	}
}
