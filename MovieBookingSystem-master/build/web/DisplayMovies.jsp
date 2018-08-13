<%--
    Document   : displaymovies
    Created on : Nov 7, 2017, 2:40:28 PM
    Author     : Sanjana
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <script src="js/Movie.js"></script>
        <style type="text/css" media="screen">
        body {
          padding-top: 80px;
/*          padding-left: 180px;*/
          background-color:#141311;
          color:#d75813;
        }
        #trailer .modal-dialog {
          margin-top: 200px;
          width: 640px;
          height: 480px;
        }
        .hanging-close {
          position: absolute;
          top: -12px;
          right: -12px;
          z-index: 9001;
        }
        #trailer-video {
          width: 100%;
          height: 100%;
        }
        .movie-tile {
          margin-bottom: 20px;
          padding-top: 20px;

        }
        .movie-tile:hover {
          background-color: #EEE;
          cursor: pointer;

        }
        .scale-media {
          padding-bottom: 56.25%;
          position: relative;
        }
        .scale-media iframe {
          border: none;
          height: 100%;
          position: absolute;
          width: 100%;
          left: 0;
          top: 0;
          background-color: white;
        }
        </style>
    </head>
    <body>
    

  <!-- Main Page Content -->
  <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <%  
                StringBuffer displayBuf1 = new StringBuffer();
                HttpSession ses= request.getSession();
                String userName="";
                if(ses.getAttribute("username")!=null){
                    userName= ses.getAttribute("username").toString();
                }    
                displayBuf1.append("<a class=\"navbar-brand\" href=\"#\">Welcome "+userName+"!</a>");   
                out.println(displayBuf1);
          %>        
        </div>
      </div>
    </div>
  </div>
        
    <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%" class="active"><a href="DisplayMovies.jsp">Home</a></li>
            <li style="font-size:150%"><%StringBuffer displayBufMr = new StringBuffer();
                                        HttpSession ses1= request.getSession();
                                        displayBufMr.append("<a  href=\"DisplayReservedMovie.jsp\">My Reservation</a>");
                                      out.println(displayBufMr);%></li>
            
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\"  onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>
            </ul>
        <br><br><br><br>
     <div class="form">
    <form id='displayMovieForm' action="DisplayMovies" method="post" >    
        
    <%  
    StringBuffer displayBuf2 = new StringBuffer();
    MovieInfo mi = new MovieInfo();
    MovieDetails md = new MovieDetails();
    md.getMovieNamesIcon(mi);
    ResultSet rs = mi.getAllMovieNamesIcon();
    String movieName = "";
    String movieIcon = "";
    int movieID;  
    while (rs.next()) 
    {
        movieID = rs.getInt("id");
        movieName = rs.getString("name");
        movieIcon = rs.getString("icon");
        //String rating = String.valueOf(rs.getDouble("avg_rating"));
        Double rating = rs.getDouble("avg_rating");
        DecimalFormat numberFormat = new DecimalFormat("#.0");
        String temp=numberFormat.format(rating);
        displayBuf2.append("<input type='hidden'  name='hidmovieid' id='hidmovieid' value='register'/>");
        displayBuf2.append("<div class='col-lg-4'movie-tile text-center' data-trailer-youtube-id='x_7YlGv9u1g' data-toggle='modal' data-target='#trailer'>");
        displayBuf2.append("<img class='img-thumbnail' src='images/"+movieIcon+"' ");
        displayBuf2.append("<br> <br> <br>");
        displayBuf2.append("<optgroup>");
        displayBuf2.append("<option name='movie' id='movie' value='" + movieID + "'>" + movieName + "</option>");
        displayBuf2.append("</optgroup>"); 
        if(temp !=null && !temp.equals(".0")){
            //displayBuf2.append("<h3>"+rating+"/5</h3>");
            displayBuf2.append("<h3>"+numberFormat.format(rating)+"/5</h3>");
        }
        else{
            displayBuf2.append("<h3>-/5</h3>");
        }
        displayBuf2.append("<div id='browse_app'>");
        displayBuf2.append("<input type='button' onclick='selectedMovie(\""+movieID+"\")' class='btn btn-info' value='Book Now'>");
        displayBuf2.append("<br> <br> <br> <br>");
        displayBuf2.append("</div>");
        displayBuf2.append("</div>");                                                                           
    }                                        
    out.println(displayBuf2);
    %>
    </form>
</div>
    </div>
    </body>
</html>
