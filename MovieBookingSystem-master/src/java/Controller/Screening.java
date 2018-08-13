/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.MovieInfo;
import Services.UpdateScreeningDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JAGADISH
 */
public class Screening extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("inside");
            Date screeningDate = new Date();
            //SimpleDateFormat simpDate=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            //SimpleDateFormat simpDate2=new SimpleDateFormat("yyyy/MM/dd HH:mm");
            System.out.println("screendate--->"+request.getParameter("screendate"));
            SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
            screeningDate = df.parse(request.getParameter("screendate"));
            MovieInfo movieInfo=new MovieInfo();
            UpdateScreeningDetails sd=new UpdateScreeningDetails();
            
            movieInfo.setScreenId(request.getParameter("screen"));
            movieInfo.setMovieId(request.getParameter("movie"));
            //screeningDate=simpDate.parse(request.getParameter("screentime"));
            //movieInfo.setScreeningTime(simpDate2.parse(simpDate2.format(screeningDate)));
            movieInfo.setScreeningDate(screeningDate);
            movieInfo.setScreeningTime(request.getParameter("time"));
            Boolean insert=sd.insertScreening(movieInfo);
            if(insert){
                response.sendRedirect("displayMovieScreening.jsp");

            }
            else{
                response.sendRedirect("addScreeningDetails.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(Screening.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
