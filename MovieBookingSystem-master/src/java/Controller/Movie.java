/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.MovieInfo;
import Services.UpdateMovieDetails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author JAGADISH
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class Movie extends HttpServlet {

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
        MovieInfo movieInfo=new MovieInfo();
        UpdateMovieDetails uploadMovieDetails=new UpdateMovieDetails();
        
        PrintWriter out = response.getWriter();

        //if(!fileSaveDir.exists()){
        // fileSaveDir.mkdir();
        //}
        
        Part part = request.getPart("file");
        String fileName = extractFileName(part);
        System.out.println("fileName--->"+fileName+"---->"+request.getParameter("file"));
        
        if(fileName!=null && !fileName.equals("")){
            String savePath = "C:\\Users\\JAGADISH\\Documents\\NetBeansProjects\\MovieBookingSystem\\web\\images" + File.separator + fileName;
            System.out.println("savePath--->"+savePath+"--->"+part+"*********");
            File fileSaveDir = new File(savePath);
            part.write(savePath + File.separator);
            movieInfo.setMovie_icon(fileName);
        }
        
        
        
        movieInfo.setMovie_name(request.getParameter("title"));
        movieInfo.setDirector(request.getParameter("director"));
        movieInfo.setCast(request.getParameter("cast"));
        
        String desc=request.getParameter("description");
        String description = desc.replace("'", "");
        movieInfo.setDescription(description);
        movieInfo.setDuration(Integer.parseInt(request.getParameter("duration")));
        
        if(request.getParameter("hidoperation").equals("insert")){
            Boolean insert=uploadMovieDetails.insertMovie(movieInfo);
            if(insert){
               response.sendRedirect("displayMovieScreening.jsp");

            }
            else{
               response.sendRedirect("addMovieDetails.jsp");
            }
        }
        else {
            movieInfo.setMovieId(request.getParameter("hidmovieid"));
            Boolean insert=uploadMovieDetails.updateMovie(movieInfo);
            if(insert){
               response.sendRedirect("displayMovieScreening.jsp");

            }
            else{
               response.sendRedirect("UpdateMovie.jsp");
            }
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
