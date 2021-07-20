package com.bid.pack;

public class MyStrings {
//	String shortS;
//
//	public MyStrings(String shortS) {
//		this.shortS = shortS;
//	}
//
//	public String getShortS() {
//		return shortS;
//	}

	public static String shortDescripton(String s) {
		String ret = s.substring(1,150).trim()+"...";
		return ret;
	}
	
}
