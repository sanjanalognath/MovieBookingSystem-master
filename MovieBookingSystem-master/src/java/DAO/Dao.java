/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.LoginInfo;
import Bean.MovieInfo;
import Services.SQLConnector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sanjana
 */
public class Dao {
    //Connection SQLConnector.conn = null;
    Statement myStmt = null;
    ResultSet myRs = null;
    public  Dao(){
        try {
            // Get a connection to database
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Attempting to connect to database. Trying hard!");
            //SQLConnector.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
           // SQLConnector.conn = DriverManager.getConnection("jdbc:mysql://34.238.251.125:3306/mysql", "dbuser", "Login123!");
        }catch (Exception exc) {
            exc.printStackTrace();
        }
        
       
        
    } 
    public Boolean insertUser(LoginInfo loginInfo){
     
        try {
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "INSERT INTO user_dtls(F_name,L_name,Email,Password) VALUES (?,?,?,?)";
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setString(1,loginInfo.getFirst_name());
            statement.setString(2,loginInfo.getLast_name());
            statement.setString(3,loginInfo.getLogin_id());
            statement.setString(4,loginInfo.getPassword());
            System.out.println("statement---"+statement);
            int rows_inserted = statement.executeUpdate();
            System.out.println("rows---"+rows_inserted);
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public ResultSet validateUser(LoginInfo loginInfo){
        System.out.println("usr name--->"+loginInfo.getLogin_id());
       
        System.out.println("usr name2--->"+loginInfo.getLogin_id());
        try {
            myStmt = SQLConnector.conn.createStatement();
            myRs = myStmt.executeQuery("SELECT * FROM user_dtls where Email='"+loginInfo.getLogin_id()+"'");
            
                
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return myRs;
    }
    
    
    public Boolean InsertSreening(MovieInfo movieInfo){
        
       
        
        try {
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            /*java.util.Date screeningDate = new java.util.Date();
            SimpleDateFormat simpDate2=new SimpleDateFormat("dd-MM-yyyy HH:mm");
            String screenDate=simpDate2.format(movieInfo.getScreeningTime());
            
            
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            java.util.Date date = sdf1.parse(screenDate);
             
            java.sql.Timestamp sqlDate = new java.sql.Timestamp(date.getTime());*/
            
            
            java.sql.Date sqlpub_date= new java.sql.Date(movieInfo.getScreeningDate().getTime());
            System.out.println("getScreeningDate--->"+sqlpub_date);
            
            //Insert query to insert values into
            mysql_QueryA = "INSERT INTO screening(screening_date,screening_time ,movie_id,screen_id) VALUES (?,?,?,?)";
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setDate(1, sqlpub_date);
            statement.setString(2,  movieInfo.getScreeningTime());
            statement.setString(3,movieInfo.getMovieId());
            statement.setString(4,movieInfo.getScreenId());
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean insertMovie(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "INSERT INTO movie(name,director,cast,description,duration,icon) VALUES (?,?,?,?,?,?)";
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setString(1,movieInfo.getMovie_name());
            statement.setString(2,movieInfo.getDirector());
            statement.setString(3,movieInfo.getCast());
            statement.setString(4,movieInfo.getDescription());
            statement.setInt(5,movieInfo.getDuration());
            statement.setString(6,movieInfo.getMovie_icon());
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }    
    public Boolean insertMovieReview(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "INSERT INTO review(movie_id,user_id,comments,rating) VALUES (?,?,?,?)";
            
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setString(1,movieInfo.getMovieId());
            statement.setString(2,movieInfo.getUserId());
            statement.setString(3,movieInfo.getReview());
            statement.setInt(4,movieInfo.getReviewRating());
            System.out.println("mysql_QueryA--->"+mysql_QueryA+"--->"+statement);
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean insertSelectedSeat(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA;
            
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select * from seat";
            //mysql_movieDetQuery=mysql_movieDetQuery+ " where movie_id='"+movieInfo.getMovieId()+"' and screening_id='"+movieInfo.getScreeningId()+"'"+" and seat='"+movieInfo.getSeatValue()+"'";
            mysql_movieDetQuery=mysql_movieDetQuery+ " where screening_id='"+movieInfo.getScreeningId()+"'"+" and seat='"+movieInfo.getSeatValue()+"'";
            
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
            if(myRs.next()){
                System.out.println("userid--->"+movieInfo.getUserId()+"--->"+myRs.getString("user_id"));
                if(movieInfo.getUserId().equals(myRs.getString("user_id"))){
                    return updateSelectedSeat(movieInfo);
                }
                else{
                    if(myRs.getInt("status")==1){
                        return false;
                    }
                    else{
                        return updateSelectedSeat(movieInfo);    
                    }
                }
                
                
            }
            else{
                mysql_QueryA = "INSERT INTO seat(User_id,screening_id,seat,status ) VALUES (?,?,?,?)";
                PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
                statement.setString(1,movieInfo.getUserId());
                statement.setString(2,movieInfo.getScreeningId());
                statement.setString(3,movieInfo.getSeatValue());
                statement.setInt(4,movieInfo.getSeatStatus());
                int rows_inserted = statement.executeUpdate();
                if (rows_inserted>0)
                {
                    System.out.println("inserted number of rows: "+rows_inserted);
                    return true;
                }
                else{
                    return false;
                }
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean updateSelectedSeat(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "update seat set status='"+movieInfo.getSeatStatus()+"'";
            
            //mysql_QueryA=mysql_QueryA+ " where movie_id='"+movieInfo.getMovieId()+"' and screening_id='"+movieInfo.getScreeningId()+"'"+" and seat='"+movieInfo.getSeatValue()+"'";
            mysql_QueryA=mysql_QueryA+ " where screening_id='"+movieInfo.getScreeningId()+"'"+" and seat='"+movieInfo.getSeatValue()+"'";
            
            System.out.println("mysql_QueryA---"+mysql_QueryA);
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public ResultSet fetchSelectedSeat(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA;
            
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select * from seat";
            //mysql_movieDetQuery=mysql_movieDetQuery+ " where movie_id='"+movieInfo.getMovieId()+"' and screening_id='"+movieInfo.getScreeningId()+"'";
            mysql_movieDetQuery=mysql_movieDetQuery+ " where screening_id='"+movieInfo.getScreeningId()+"'";
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
            return myRs;
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
    }
    
    public Boolean updateMovieReview(MovieInfo movieInfo){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "update review set comments='"+movieInfo.getReview()+"'";
            
            mysql_QueryA=mysql_QueryA+ " where movie_id='"+movieInfo.getMovieId()+"' and user_id='"+movieInfo.getUserId()+"'";
            System.out.println("mysql_QueryA---"+mysql_QueryA);
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean updateMovie(MovieInfo movieInfo){
        
       
        
        try {
            myStmt = SQLConnector.conn.createStatement();String mysql_QueryA;
            // Update query to update values into .
            mysql_QueryA = "update movie set name='"+movieInfo.getMovie_name()+"', director='"+movieInfo.getDirector()+
            "', cast='"+movieInfo.getCast()+"', description='"+movieInfo.getDescription()+"', duration='"+movieInfo.getDuration()+"'";
            if(movieInfo.getMovie_icon()!=null && movieInfo.getMovie_icon()!=""){
                mysql_QueryA=mysql_QueryA+ ", icon='"+movieInfo.getMovie_icon()+"'";
            }
            mysql_QueryA=mysql_QueryA+ " where id='"+movieInfo.getMovieId()+"'";
            // To execute the query.
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            
            
            System.out.println("statement--->"+statement);
            int rows_inserted = statement.executeUpdate();
            System.out.println("rows--->"+rows_inserted);
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean deleteMovie(MovieInfo movieInfo){
       
        int rows_insertedB=0;
        int rows_insertedC=0;
        int rows_insertedD=0;
        try {
            //SQLConnector.conn.setAutoCommit(false);
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA,mysql_QueryB,mysql_QueryC,mysql_QueryD;
            // Update query to update values into .
            mysql_QueryA = "delete from movie where id="+movieInfo.getMovieId();
            /*if(movieInfo.getScreeningId()!=null && !movieInfo.getScreeningId().equals("")){
                mysql_QueryD = "delete from reservation where screening_id ="+movieInfo.getScreeningId();
                mysql_QueryC = "delete from seat where screening_id ="+movieInfo.getScreeningId();
                mysql_QueryB = "delete from screening where id="+movieInfo.getScreeningId();
                System.out.println("mysql_QueryC--->"+mysql_QueryC+"  "+mysql_QueryB);
                
                PreparedStatement statementD = SQLConnector.conn.prepareStatement(mysql_QueryD);
                PreparedStatement statementC = SQLConnector.conn.prepareStatement(mysql_QueryC);
                PreparedStatement statementB = SQLConnector.conn.prepareStatement(mysql_QueryB);
                
                rows_insertedD = statementD.executeUpdate();
                rows_insertedC = statementC.executeUpdate();
                rows_insertedB = statementB.executeUpdate();
            }    */
            // To execute the query.
            PreparedStatement statementA = SQLConnector.conn.prepareStatement(mysql_QueryA);
            
            
            int rows_insertedA = statementA.executeUpdate();
            
           // SQLConnector.conn.commit();
            //System.out.println("rows--->"+rows_insertedA+"B-->"+rows_insertedB);
            //if ( rows_insertedB>0)
            if (rows_insertedA>0)
            {
                System.out.println("inserted number of rows: "+"B-->"+rows_insertedB);
                return true;
            }
            else{
                SQLConnector.conn.rollback();
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public ResultSet getMovieScreeningInfoDao(int movieID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_movieScrQuery;
            mysql_movieScrQuery = "select m.name movieName, s.name screenName, sg.screen_id screenID, sg.screening_date screeningDate, sg.screening_time screeningTime, sg.id screeningID "
                    + "from movie m, screening sg, screen s "
                    + "where sg.screen_id = s.id and "
                    + "sg.movie_id = m.id and "
                    + "sg.movie_id = " + movieID;
            System.out.println("mysql_movieScrQuery--->"+mysql_movieScrQuery);
            myRs = myStmt.executeQuery(mysql_movieScrQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    public ResultSet getMovieInfoDao(int movieID) {

       
        System.out.println("getMovieInfoDao---<");
        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select name,director,cast,description,duration,icon from movie where id = " + movieID;
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    
    public ResultSet fetchMovieReview(MovieInfo movieInfo) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select * from review where movie_id =" + movieInfo.getMovieId()+" and user_id="+ movieInfo.getUserId();
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    
    public ResultSet getAllMovieNamesIcon() {
    	
    	try {
            myStmt = SQLConnector.conn.createStatement();
            myRs = myStmt.executeQuery("select id,name,icon,avg_rating from movie left join (select movie_id, avg(rating) avg_rating from review group by movie_id) as ip on movie.id=ip.movie_id");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet fetchScreenInfo() {
    	
    	try {
            myStmt = SQLConnector.conn.createStatement();
            myRs = myStmt.executeQuery("select * from screen");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet fetchMovieScreeingDtls() {
    	
    	try {
            myStmt = SQLConnector.conn.createStatement();
            myRs = myStmt.executeQuery("SELECT movie.name movie_name,movie.id movie_id,director,screening_view.name screen_name,no_of_seats,screening_date,screening_time,screening_view.screening_id,screen_id\n" +
                "FROM movie\n" +
                "LEFT JOIN (select name,no_of_seats,screening_date,screening_time,movie_id,screen_id,screening.id screening_id from screen,screening where screen.id = screen_id) as screening_view ON movie.id = movie_id");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet fetchMovieByMovieId(MovieInfo movieInfo) {
    	
    	try {
            myStmt = SQLConnector.conn.createStatement();
            myRs = myStmt.executeQuery("SELECT * from movie where id="+movieInfo.getMovieId());
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet getFoodsDao() {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "select distinct food_name from food";
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }

    public ResultSet getFoodDetailsDao(String foodName) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "select food_id,size,price from food where food_name='" + foodName + "'";
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    public ResultSet getFoodDetailsDao(int foodID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "select food_name,size,price from food where food_id='" + foodID + "'";
            System.out.println(">>>>>>>>>>>>>" + mysql_foodQuery);
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    public ResultSet getreservedMovie(int userID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "SELECT a.reservation_id,a.seat_id,a.price,b.screening_date,b.screening_time,c.name screen_name,b.id screening_id,d.name movie_name,d.duration FROM reservation a,screening b,screen c, movie d where a.screening_id=b.id and b.screen_id=c.id and b.movie_id=d.id and user_id='" + userID + "'";
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    public ResultSet getreservedfood(int reservationID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "select b.food_name,b.Size,a.fCount,a.Price from food_reserved a,food b where a.food_id=b.food_id and a.reservation_id='" + reservationID + "'";
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    public ResultSet getReviewByMovieID(int movieID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_foodQuery;
            mysql_foodQuery = "select a.rating,a.comments, concat(b.F_name,' ',b.L_name) reviewer_name,c.name from review a,user_dtls b,movie c where a.user_id=b.user_id and a.movie_id =c.id and  movie_id='" + movieID + "'";
            myRs = myStmt.executeQuery(mysql_foodQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    
    public Boolean deleteReservedMovie(MovieInfo movieInfo) throws SQLException{
        
       
        try {
            //SQLConnector.conn.setAutoCommit(false);
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA,mysql_QueryB,mysql_QueryC="";
            String seat;
            // Update query to update values into .
           // mysql_QueryA = "delete from food_reserved where reservation_id="+movieInfo.getReservationID();
            mysql_QueryB = "delete from reservation where reservation_id="+movieInfo.getReservationID();
            
            seat=movieInfo.getSeatID();
            mysql_QueryC = "delete from seat where screening_id ="+movieInfo.getScreeningId()+" and seat in("+seat+")";
               
            // To execute the query.
            System.out.println("mysql_QueryC-->"+mysql_QueryC);
            //PreparedStatement statementA = SQLConnector.conn.prepareStatement(mysql_QueryA);
            PreparedStatement statementB = SQLConnector.conn.prepareStatement(mysql_QueryB);
            PreparedStatement statementC = SQLConnector.conn.prepareStatement(mysql_QueryC);
            
            
            //int rows_insertedA = statementA.executeUpdate();
            int rows_insertedB = statementB.executeUpdate();
            int rows_insertedC = statementC.executeUpdate();
            
            //SQLConnector.conn.commit();
            System.out.println("rows--->"+rows_insertedC+"B-->"+rows_insertedB);
            if (rows_insertedB>0 && rows_insertedC>0)
            {
                System.out.println("inserted number of rows: "+rows_insertedC +"B-->"+rows_insertedB);
                return true;
            }
            else{
                SQLConnector.conn.rollback();
                return false;
            }
            
        }
        catch (SQLException ex) {
            SQLConnector.conn.rollback();
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public Boolean deleteReservedSeats(MovieInfo movieInfo){
        
       
        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryC="";
            String seat;
            seat=movieInfo.getSeatID();
            mysql_QueryC = "delete from seat where screening_id ="+movieInfo.getScreeningId()+" and seat in("+seat+")";
               
            // To execute the query.
            System.out.println("mysql_QueryC-->"+mysql_QueryC);
            PreparedStatement statementC = SQLConnector.conn.prepareStatement(mysql_QueryC);
            
            
            int rows_insertedC = statementC.executeUpdate();
            
            SQLConnector.conn.commit();
            System.out.println("rows--->"+rows_insertedC);
            if (rows_insertedC>0)
            {
                System.out.println("inserted number of rows: "+rows_insertedC);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    
    
    
    public ResultSet getScreeningInfoDao(int screeningID) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_screeningQuery;
            mysql_screeningQuery = "select s.name screenName, sg.screening_date screeningDate, sg.screening_time screeningTime "
                    + "from screening sg, screen s "
                    + "where sg.screen_id = s.id and "
                    + "sg.id = " + screeningID;
            //System.out.println(">>>>>>>>>>>>>" + mysql_screeningQuery);
            myRs = myStmt.executeQuery(mysql_screeningQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }

    public Boolean insertFoodReserveDao(int foodID, int reservationID, int foodCount, double price) {

       

        try {

            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA;
            mysql_QueryA = "INSERT INTO food_reserved(food_id,reservation_id,fcount,price) VALUES (?,?,?,?)";
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setInt(1, foodID);
            statement.setInt(2, reservationID);
            statement.setInt(3, foodCount);
            statement.setDouble(4, price);
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted > 0) {
                System.out.println("inserted number of rows: " + rows_inserted);
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public Boolean insertReservationDao(int userID, int screeningID, String seatIDs, double price) {

       

        try {

            myStmt = SQLConnector.conn.createStatement();
            String mysql_resQuery;
            mysql_resQuery = "INSERT INTO reservation(screening_id,seat_id,price,user_id) VALUES ("
                    + screeningID + ",\"" + seatIDs + "\"," + price + "," + userID + ")";
            System.out.println("before>>>>>>" + mysql_resQuery);
            /*PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            statement.setInt(1, screeningID);
            statement.setString(2, seatIDs);
            statement.setDouble(3, price);
            System.out.println("after>>>>>>prep stmt reservation");
            int rows_inserted = statement.executeUpdate();*/
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_resQuery);
            int rows_inserted = statement.executeUpdate();
            System.out.println("after>>>>>>" + mysql_resQuery);
            if (rows_inserted > 0) {
                System.out.println("inserted number of rows: " + rows_inserted);
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ResultSet getReservationIDDao(int screeningID, String seatIDs) {

       

        try {
            myStmt = SQLConnector.conn.createStatement();
            String mysql_resQuery;
            mysql_resQuery = "select reservation_id from reservation where screening_id = " + screeningID + " and seat_id =\"" + seatIDs + "\"";
            System.out.println("resid>>>>>>>" + mysql_resQuery);
            myRs = myStmt.executeQuery(mysql_resQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }

    public Boolean updateReservationPriceDao(int reservationID, double price) {

       

        try {

            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA;
            mysql_QueryA = "update reservation set price=" + price;

            mysql_QueryA = mysql_QueryA + " where reservation_id=" + reservationID;
            System.out.println("mysql_QueryA---" + mysql_QueryA);
            PreparedStatement statement = SQLConnector.conn.prepareStatement(mysql_QueryA);
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted > 0) {
                System.out.println("inserted number of rows: " + rows_inserted);
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }
    
    
    public ResultSet getMovieReview(int movieID){
        
       
        
        try {
            
            myStmt = SQLConnector.conn.createStatement();
            String mysql_QueryA;
            
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select avg(rating) avg_rating from review";
            //mysql_movieDetQuery=mysql_movieDetQuery+ " where movie_id='"+movieInfo.getMovieId()+"' and screening_id='"+movieInfo.getScreeningId()+"'";
            mysql_movieDetQuery=mysql_movieDetQuery+ " where movie_id='"+movieID+"'";
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
            return myRs;
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
    }

}     

