package com.bid.pack;

public class BidPost {
	int id;
	String uid;
	String title;
	String subTitle;
	String bidDescription;
	String bidDescriptionShort;
	String game;
	String thumbnail;
	int lbFrom;
	int lbTo;
	String platform;
	float maxBid;
	String bidEnd;
	
//	Bid Post Constructor
	public BidPost(int id, String uname, String title, String subTitle, String bidDescription, String game, int lbFrom, int lbTo,
			String platform, float maxBid, String bidEnd, String thumbnail, String bidDescriptionShort) {
		super();
		this.id = id;
		this.uid = uname;
		this.title = title;
		this.subTitle = subTitle;
		this.bidDescription = bidDescription;
		this.game = game;
		this.thumbnail = thumbnail;
		this.lbFrom = lbFrom;
		this.lbTo = lbTo;
		this.platform = platform;
		this.maxBid = maxBid;
		this.bidEnd = bidEnd;
		this.bidDescriptionShort = bidDescriptionShort;
	}
	
	
//	Bid Post Getters

	public int getId() {
		return id;
	}
	
	public String getUid() {
		return uid;
	}

	public String getTitle() {
		return title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public String getBidDescription() {
		return bidDescription;
	}

	public String getGame() {
		return game;
	}

	public int getLbFrom() {
		return lbFrom;
	}

	public int getLbTo() {
		return lbTo;
	}

	public String getPlatform() {
		return platform;
	}

	public float getMaxBid() {
		return maxBid;
	}

	public String getBidEnd() {
		return bidEnd;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}

	public String getBidDescriptionShort() {
		return bidDescriptionShort;
	}
	
	
}
