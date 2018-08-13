/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import DAO.Dao;
import Bean.LoginInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sanjana
 */
public class LoginCredentials {
    
    
    
    public Boolean checkCredentials(LoginInfo loginInfo){
        Dao dao=new Dao();
        ResultSet rs1= dao.validateUser(loginInfo);
        String loginId="";
        String password="";
        try {
        if(rs1.next()){
            if(rs1.getString("Email") != null){
                loginId=rs1.getString("Email");
                password=rs1.getString("password");
                loginInfo.setFirst_name(rs1.getString("F_name"));
                loginInfo.setLast_name(rs1.getString("L_name"));
                loginInfo.setUser_id(rs1.getString("user_id"));
                System.out.println("sql3--->"+loginId+"  "+password);
            }
        } 
        } catch (SQLException ex) {
                Logger.getLogger(LoginCredentials.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("sql2--->"+loginId+" loginInfo--->"+loginInfo.getLogin_id()+"   "+password+" loginInfo.--->   "+loginInfo.getPassword());
        if(loginInfo.getLogin_id().equals(loginId) && loginInfo.getPassword().equals(password) ){
            return true;
        }
        else{
            return false;
        }
    }
    
    public Boolean registerUser(LoginInfo loginInfo){
        Dao dao=new Dao();
        Boolean register= dao.insertUser(loginInfo);
        return register;
    }
    
}
