package com.bid.pack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Bid {
	int uid;
	int bid;
	float price;
	String uname;
	String comment;
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet res = null;
	
	public Bid(int uid, int bid, float price, String comment) {
		this.uid = uid;
		this.bid = bid;
		this.price = price;
		this.uname = User.getName(uid);
		this.comment = comment;
	}
	
	public int getUid() {
		return uid;
	}

	public int getBid() {
		return bid;
	}

	public float getPrice() {
		return price;
	}

	public String getUname() {
		return uname;
	}
	
	public String getComment() {
		return comment;
	}



	public static boolean insertBid(int uid, int bid, float price, String comment) {
		
		boolean r = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO `gametune_db`.`users_bidposts` VALUES ('"+uid+"','"+bid+"', '"+price+"', '"+comment+"');"; 
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				r = true;
			} else {
				r = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	
	public static ArrayList<Bid> getBids(int id){
		ArrayList<Bid> arr = new ArrayList<Bid>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM gametune_db.users_bidposts where bid = '"+id+"';";
			
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				int uid = res.getInt(1);
				int bid = res.getInt(2);
				float price = res.getFloat(3);
				String comment = res.getString(4);
				
				Bid p = new Bid(uid, bid, price, comment);
				arr.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	
	public static boolean checkBidAvailability(int uid, int bid) {
		boolean r = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM gametune_db.users_bidposts where uid = '"+uid+"' and bid = '"+bid+"';"; 
			res = stmt.executeQuery(sql);
			
			if(res.next()) {
				r = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}

	public static boolean updateBid(int uid, int bid, float price, String comment) {

		boolean r = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = null;
			
			if(price == 0) {
				sql = "UPDATE `gametune_db`.`users_bidposts` SET `comment` = '"+comment+"' WHERE (`uid` = '"+uid+"') and (`bid` = '"+bid+"');"; 
			} else if (comment == null) {
				sql = "UPDATE `gametune_db`.`users_bidposts` SET `bidprice` = '"+price+"' WHERE (`uid` = '"+uid+"') and (`bid` = '"+bid+"');";
			} else {
				sql = "UPDATE `gametune_db`.`users_bidposts` SET `bidprice` = '"+price+"', `comment` = '"+comment+"' WHERE (`uid` = '"+uid+"') and (`bid` = '"+bid+"');";
			}
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				r = true;
			} else {
				r = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
}
