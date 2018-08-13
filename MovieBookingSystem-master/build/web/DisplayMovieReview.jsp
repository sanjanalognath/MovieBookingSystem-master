<%--
    Document   : DisplayMovieInfo
    Created on : Nov 10, 2017, 6:09:54 PM
    Author     : Sanjana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Info</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>


    <style type="text/css" media="screen">
        body {
          background-color:#141311;
          color:#d75813;
          padding: 50px; 
       }
       </style>
        <script src="js/Movie.js"></script>
        
    </head>
    <body>
    <div class="container">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Movie Information and Reviews</a>
                </div>
            </div>
        </div>
    </div>
        <br>
        <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="DisplayMovies.jsp">Home</a></li>
            <li style="font-size:150%"><%StringBuffer displayBufMr = new StringBuffer();
                                        HttpSession ses1= request.getSession();
                                        displayBufMr.append("<a  href=\"DisplayReservedMovie.jsp\">My Reservation</a>");
                                      out.println(displayBufMr);%></li>
            
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\"  onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>
            </ul>

        <form  action="DisplayMovieInfo" method="post" >

            <%
                int movieID;
                MovieDetails md = new MovieDetails();
                HttpSession s = request.getSession();
                movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                System.out.println("movieID--->"+movieID);
                ResultSet rs = md.getReviewByMovieID(movieID);
                StringBuffer displayBuf1 = new StringBuffer(); 
                String movieName= s.getAttribute("movieName").toString();
                displayBuf1.append("<input type='hidden' name='screenmovieid' id='screenmovieid' value='" + movieID + "'/>");
                displayBuf1.append("<div class='container'>");   
                displayBuf1.append("<div class='col-sm-12'>");
                displayBuf1.append("<dl>");
                displayBuf1.append("<p>");                    
                displayBuf1.append("<div style='text-align:center'><dd style='font-size:45px;margin:0;'>" 
                                        + movieName
                                        +"</dd></div>");
                //displayBuf1.append("<div style='text-align:center'><dd style='font-size:20px;margin:0;'>" + rs.getString("director")+"</dd></div>");
                while(rs.next()){ 
                    
                    
                                        
                    
                    displayBuf1.append("<br><dt style='font-size:20px;color:#AEA79F'>" + rs.getString("reviewer_name")+"&nbsp");
                    displayBuf1.append("<br><dt style='font-size:20px;'>Rating &nbsp </dt><dd style='font-size:20px;'>" + rs.getInt("rating")+"</dd>");
                    displayBuf1.append("<br><dt style='font-size:20px;'>Comments &nbsp </dt><dd style='font-size:20px;'>" + rs.getString("comments")+"</dd>");
                    
                }
                displayBuf1.append("</p>");
                displayBuf1.append("</dl>");
                displayBuf1.append("<input type='submit' class='btn btn-info pull-right' value='Book seat'>");
                displayBuf1.append("<a class='btn btn-info'type='button'href='DisplayMovieInfo.jsp'>Back</a><br>");
                displayBuf1.append("</div>");
                displayBuf1.append("</div>");
                out.println(displayBuf1);

            %>
        </form>
        </div>
        
    </body>
</html>
