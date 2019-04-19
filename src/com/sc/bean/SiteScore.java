package com.sc.bean;


public class SiteScore extends BaseBean {
	public SiteScore(){
		
	}
	
	public SiteScore(Integer siteId, Integer viewNum, Integer likeNum,
			Integer shareNum, Integer clickNum, Integer collectNum,
			Integer commentNum) {
		super();
		this.siteId = siteId;
		this.viewNum = viewNum;
		this.likeNum = likeNum;
		this.shareNum = shareNum;
		this.clickNum = clickNum;
		this.collectNum = collectNum;
		this.commentNum = commentNum;
	}
	
	
	
	 public static enum ScoreType {
		VIEW(1, "viewNum"), LIKE(2, "likeNum"), SHARE(1, "shareNum"), CLICK(2,
				"clickNum"), COLLECT(1, "collectNum"), COMMENT(2, "commentNum");
		public int key;
		public String value;

		private ScoreType(int key, String value) {
			this.key = key;
			this.value = value;
		}

		public static ScoreType get(int key) {
			ScoreType[] values = ScoreType.values();
			for (ScoreType object : values) {
				if (object.key == key) {
					return object;
				}
			}
			return null;
		}
	}
	
	
	
}