/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Bean.MovieInfo;
import DAO.Dao;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAGADISH
 */
public class UpdateMovieDetails {
    
        
    public Boolean insertMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.insertMovie(movieInfo);
        return insertStatus;
    }

    public Boolean updateMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.updateMovie(movieInfo);
        return insertStatus;
    } 

    public Boolean deleteMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean deleteStatus;
        deleteStatus = dao.deleteMovie(movieInfo);
        return deleteStatus;
        
    }
    
    public Boolean insertMovieReview(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.insertMovieReview(movieInfo);
        return insertStatus;
    }
    
    public Boolean updateMovieReview(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean updateStatus=dao.updateMovieReview(movieInfo);
        return updateStatus;
    }
    
    public Boolean insertSelectedSeat(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.insertSelectedSeat(movieInfo);
        return insertStatus;
    }
    
    public Boolean updateSelectedSeat(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean updateStatus=dao.updateSelectedSeat(movieInfo);
        return updateStatus;
    }
    
    public Boolean deleteReservedMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean deleteStatus;
        try {
            deleteStatus = dao.deleteReservedMovie(movieInfo);
            return deleteStatus;
        } catch (SQLException ex) {
            Logger.getLogger(UpdateMovieDetails.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
    public Boolean deleteReservedSeats(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean deleteStatus;
        deleteStatus = dao.deleteReservedSeats(movieInfo);
        return deleteStatus;
        
    }
}
