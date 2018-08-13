/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author Sanjana
 */
public class MovieInfo {
    private String movie_name;
    private String director;
    private String cast;
    private String description;
    private String movie_icon;
    private int duration;
    private ResultSet allMovieNamesIcon;
    private ResultSet allScreenNames;
    private Date screeningDate;
    private String screeningTime;
    private String screenName;
    private String screenId;
    private String screeningId;
    private String movieId;
    private String userId;
    private String review;
    private int reviewRating;
    private int seatStatus;
    private String seatValue;
    private int reservationID;
    private String seatID;

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getSeatID() {
        return seatID;
    }

    public void setSeatID(String seatID) {
        this.seatID = seatID;
    }

    
    public int getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(int seatStatus) {
        this.seatStatus = seatStatus;
    }

    
    public String getSeatValue() {
        return seatValue;
    }

    public void setSeatValue(String seatValue) {
        this.seatValue = seatValue;
    }

    
    
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    
    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getReviewRating() {
        return reviewRating;
    }

    public void setReviewRating(int reviewRating) {
        this.reviewRating = reviewRating;
    }

    
    
    public String getScreeningId() {
        return screeningId;
    }

    public void setScreeningId(String screeningId) {
        this.screeningId = screeningId;
    }

    
    
    public Date getScreeningDate() {
        return screeningDate;
    }

    public void setScreeningDate(Date screeningDate) {
        this.screeningDate = screeningDate;
    }

    public String getScreeningTime() {
        return screeningTime;
    }

    public void setScreeningTime(String screeningTime) {
        this.screeningTime = screeningTime;
    }

    
    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getScreenId() {
        return screenId;
    }

    public void setScreenId(String screenId) {
        this.screenId = screenId;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }
    
    
    public ResultSet getAllScreenNames() {
        return allScreenNames;
    }

    public void setAllScreenNames(ResultSet allScreenNames) {
        this.allScreenNames = allScreenNames;
    }
    
    public ResultSet getAllMovieNamesIcon() {
        return allMovieNamesIcon;
    }

    public void setAllMovieNamesIcon(ResultSet allMovieNamesIcon) {
        this.allMovieNamesIcon = allMovieNamesIcon;
    }
    
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    
    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMovie_icon() {
        return movie_icon;
    }

    public void setMovie_icon(String movie_icon) {
        this.movie_icon = movie_icon;
    }
    
}
