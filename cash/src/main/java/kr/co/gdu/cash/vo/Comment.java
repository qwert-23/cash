package kr.co.gdu.cash.vo;


public class Comment{
	private int commentId;	//댓글번호
	private int noticeId;		//공지번호 
	private String commentContent; //댓글내용
	private String commentDate; //댓글 날짜 
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", noticeId=" + noticeId 
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	
	

	
}
