package com.bid.pack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BidDBUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
//	Insert A Bid Post To DB
	public static boolean insertBidPost(String title, String subTitle, String description, String lbFrom, String lbTo, String platform, String maxBid, String bidEnds,  String uid, String gameId) {
		boolean ret = false;
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO `gametune_db`.`bidposts` VALUES ('0', '"+title+"', '"+subTitle+"', '"+description+"', '"+Integer.parseInt(lbFrom)+"', '"+Integer.parseInt(lbTo)+"', '"+platform+"', '"+Float.parseFloat(maxBid)+"', '"+bidEnds+"', '"+uid+"', '"+gameId+"')";
			int res = stmt.executeUpdate(sql);
			
			if(res > 0) {
				ret = true;
			} else {
				ret = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	
//	Get All Bid Post From DB
	public static ArrayList<BidPost> getBidPosts(){
		ArrayList<BidPost> arr = new ArrayList<BidPost>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from bidposts";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String uid = User.getName(rs.getInt(10));
				String title = rs.getString(2);
				String subTitle = rs.getString(3);
				String bidDescription = rs.getString(4);
				String bidDescriptionShort = rs.getString(4);//.substring(1,150).trim()+"...";
				String game = Game.getGameName(rs.getInt(11));
				String thumbnail = Game.getThumbnail(rs.getInt(11));
				int lbFrom = rs.getInt(5);
				int lbTo = rs.getInt(6);
				String platform = rs.getString(7);
				float maxBid = rs.getFloat(8);
				String bidEnd = rs.getString(9);
				
				BidPost p = new BidPost(id, uid, title, subTitle, bidDescription, game, lbFrom, lbTo, platform, maxBid, bidEnd, thumbnail, bidDescriptionShort);
				arr.add(p);
				System.out.println(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	public static ArrayList<BidPost> getBidPosts(int id){
		ArrayList<BidPost> arr = new ArrayList<BidPost>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from bidposts where id = "+id+";";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int pid = id;
				String uid = User.getName(rs.getInt(10));
				String title = rs.getString(2);
				String subTitle = rs.getString(3);
				String bidDescription = rs.getString(4);
				String bidDescriptionShort = rs.getString(4);//.substring(1,150).trim()+"...";
				String game = Game.getGameName(rs.getInt(11));
				String thumbnail = Game.getThumbnail(rs.getInt(11));
				int lbFrom = rs.getInt(5);
				int lbTo = rs.getInt(6);
				String platform = rs.getString(7);
				float maxBid = rs.getFloat(8);
				String bidEnd = rs.getString(9);
				
				BidPost p = new BidPost(pid, uid, title, subTitle, bidDescription, game, lbFrom, lbTo, platform, maxBid, bidEnd, thumbnail, bidDescriptionShort);
				arr.add(p);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	
	
	
	
	
	public static BidPost getBidAPost(int id){
		BidPost bp = null;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from bidposts where id = "+id+";";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int pid = id;
				String uid = User.getName(rs.getInt(10));
				String title = rs.getString(2);
				String subTitle = rs.getString(3);
				String bidDescription = rs.getString(4);
				String bidDescriptionShort = rs.getString(4);//.substring(1,150).trim()+"...";
				String game = Game.getGameName(rs.getInt(11));
				String thumbnail = Game.getThumbnail(rs.getInt(11));
				int lbFrom = rs.getInt(5);
				int lbTo = rs.getInt(6);
				String platform = rs.getString(7);
				float maxBid = rs.getFloat(8);
				String bidEnd = rs.getString(9);
				
				bp = new BidPost(pid, uid, title, subTitle, bidDescription, game, lbFrom, lbTo, platform, maxBid, bidEnd, thumbnail, bidDescriptionShort);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bp;
	}
	
	
	
	
	public static boolean checkBidPostAvailability(int uid, int pid) {
		boolean r = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM gametune_db.bidposts WHERE id = '"+pid+"' AND uid = '"+uid+"';"; 
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				r = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}


	public static boolean deletePost(int pid) {

		boolean r = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM `gametune_db`.`bidposts` WHERE (`id` = '"+pid+"');";
			int rs = stmt.executeUpdate(sql);
			System.out.println(rs+"=============================================");
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
