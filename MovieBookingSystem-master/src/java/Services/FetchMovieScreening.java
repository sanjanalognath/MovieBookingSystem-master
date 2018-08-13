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
 * @author JAGADISH
 */
public class FetchMovieScreening {
    
    public ResultSet fetchMovieInfo(){
        Dao dao=new Dao();
        ResultSet rs=dao.fetchMovieScreeingDtls();
        return rs;
    }
    public ResultSet fetchMoviedtls(MovieInfo movieInfo){
        Dao dao=new Dao();
        ResultSet rs=dao.fetchMovieByMovieId(movieInfo);
        return rs;
    }
}
