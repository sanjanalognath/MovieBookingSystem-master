/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Bean.MovieInfo;
import DAO.Dao;

/**
 *
 * @author JAGADISH
 */
public class UpdateScreeningDetails {
     public Boolean insertScreening(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.InsertSreening(movieInfo);
        return insertStatus;
    }
}
