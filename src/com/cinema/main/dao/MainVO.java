package com.cinema.main.dao;

public class MainVO {
	private String poster;
	private String trailer;
	private int rank;
	private int movieLike;
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getMovieLike() {
		return movieLike;
	}
	public void setMovieLike(int movieLike) {
		this.movieLike = movieLike;
	}	
}
