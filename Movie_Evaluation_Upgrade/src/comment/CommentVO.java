package comment;

public class CommentVO {

	private int commentID;
	private int	movieID;
	private String movieComment;
	private String userID;
	private String commentDate;
	private int commentRating;

	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getMovieComment() {
		return movieComment;
	}
	public void setMovieComment(String movieComment) {
		this.movieComment = movieComment;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentRating() {
		return commentRating;
	}
	public void setCommentRating(int commentRating) {
		this.commentRating = commentRating;
	}
	
}
