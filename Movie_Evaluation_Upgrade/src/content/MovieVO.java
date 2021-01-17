package content;

public class MovieVO {
	
	private int movieID;
	private String movieThumbnail;
	private String movieTitle;
	private String movieLength;
	private String moviePremiere;
	private String movieDirector;
	private String movieActor;
	private String movieContent;
	private int movieAvailable;
	private String userID;
	private String uploadDate;
	private int movieRating;
	private String movieShow;

	public String getMovieShow() {
		return movieShow;
	}
	public void setMovieShow(String movieShow) {
		this.movieShow = movieShow;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getMovieThumbnail() {
		return movieThumbnail;
	}
	public void setMovieThumbnail(String movieThumbnail) {
		this.movieThumbnail = movieThumbnail;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(int movieRating) {
		this.movieRating = movieRating;
	}
	public String getMovieLength() {
		return movieLength;
	}
	public void setMovieLength(String movieLength) {
		this.movieLength = movieLength;
	}
	public String getMoviePremiere() {
		return moviePremiere;
	}
	public void setMoviePremiere(String moviePremiere) {
		this.moviePremiere = moviePremiere;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieActor() {
		return movieActor;
	}
	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}
	public String getMovieContent() {
		return movieContent;
	}
	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}
	public int getMovieAvailable() {
		return movieAvailable;
	}
	public void setMovieAvailable(int movieAvailable) {
		this.movieAvailable = movieAvailable;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
}
