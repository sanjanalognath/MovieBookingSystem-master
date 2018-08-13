/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Bean.MovieInfo;
import DAO.Dao;
import java.sql.ResultSet;

/**
 *
 * @author Sanjana
 */
public class MovieDetails {
    public void getMovieNamesIcon(MovieInfo mi) {
    	Dao dao = new Dao();
    	mi.setAllMovieNamesIcon(dao.getAllMovieNamesIcon());
    }
    public void getScreeningDtls(MovieInfo mi) {
    	Dao dao = new Dao();
    	mi.setAllScreenNames(dao.fetchScreenInfo());
    }
    public ResultSet getMovieInfo(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getMovieInfoDao(movieID);
        return rs;
    }

    public ResultSet getMovieScreeningInfo(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getMovieScreeningInfoDao(movieID);
        return rs;
    }
    
    public ResultSet getMovieReview(MovieInfo mi) {
        Dao dao = new Dao();
        ResultSet rs = dao.fetchMovieReview(mi);
        return rs;
    }
    
    public ResultSet getSelectedSeat(MovieInfo mi) {
        Dao dao = new Dao();
        ResultSet rs = dao.fetchSelectedSeat(mi);
        return rs;
    }
    
    public ResultSet getFoods() {
        Dao dao = new Dao();
        ResultSet rs = dao.getFoodsDao();
        return rs;
    }

    
    public ResultSet getFoodDetails(String foodName) {
        Dao dao = new Dao();
        ResultSet rs = dao.getFoodDetailsDao(foodName);
        return rs;
    }

    public ResultSet getFoodDetails(int foodID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getFoodDetailsDao(foodID);
        return rs;
    }
    
    public ResultSet getreservedMovie(int userID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getreservedMovie(userID);
        return rs;
    }
    
    public ResultSet getreservedfood(int reservationID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getreservedfood(reservationID);
        return rs;
    }
    
    public ResultSet getReviewByMovieID(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getReviewByMovieID(movieID);
        return rs;
    }
    
    public ResultSet getMovieReview(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getMovieReview(movieID);
        return rs;
    }
    
    
    public void insertReservation(int userID, int screeningID, String seatIDs, double price) {
        Dao dao = new Dao();
        dao.insertReservationDao(userID,screeningID, seatIDs, price);
    }

    public ResultSet getReservationID(int screeningID, String seatIDs) {
        Dao dao = new Dao();
        ResultSet rs = dao.getReservationIDDao(screeningID, seatIDs);
        return rs;
    }

    public void updateReservationPrice(int reservationID, double price) {
        Dao dao = new Dao();
        dao.updateReservationPriceDao(reservationID, price);
    }
    
    public ResultSet getScreeningInfo(int screeningID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getScreeningInfoDao(screeningID);
        return rs;
    }

    public void insertFoodReserve(int foodID, int reservationID, int foodCount, double price) {
        Dao dao = new Dao();
        dao.insertFoodReserveDao(foodID, reservationID, foodCount, price);
    }

   /* public ResultSet getBlockedSeats(int screeningID) {
        Dao dao = new Dao();
        ResultSet rs = dao.GetBlockedSeatsDao(screeningID);
        return rs;
    }*/

}
