/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.MovieInfo;
import Services.UpdateMovieDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JAGADISH
 */
@WebServlet(name = "UpdateSeatSelection", urlPatterns = {"/UpdateSeatSelection"})
public class UpdateSeatSelection extends HttpServlet {

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
        System.out.println("inside UpdateSeatSelection--->"+request.getParameter("movieID")+"   "+request.getParameter("screeningID"));
        MovieInfo movieInfo=new MovieInfo();
        UpdateMovieDetails uploadMovieDetails=new UpdateMovieDetails();
        HttpSession s = request.getSession();
        String userID = s.getAttribute("userId").toString();
        movieInfo.setUserId(userID);
        movieInfo.setMovieId(request.getParameter("movieID"));
        movieInfo.setScreeningId(request.getParameter("screeningID"));
        movieInfo.setSeatValue(request.getParameter("seatValue"));
        movieInfo.setSeatStatus(Integer.parseInt(request.getParameter("status")));
        Boolean insert=uploadMovieDetails.insertSelectedSeat(movieInfo);
        PrintWriter out = response.getWriter();
        
        if(insert){
            
            out.append("inserted");
            

        }
        else{
            out.append("failed");
        }
        out.close();
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
