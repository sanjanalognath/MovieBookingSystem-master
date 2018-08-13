/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sanjana
 */
public class SQLConnector {
    public static Connection conn;
    
    static {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://34.238.251.125:3306/mysql", "dbuser", "Login123!");
        } catch (SQLException ex) {
            Logger.getLogger(SQLConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

