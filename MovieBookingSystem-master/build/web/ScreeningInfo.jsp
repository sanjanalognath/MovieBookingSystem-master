<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>
    <body>
       <div class="container">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Movie Information and Screening Information</a>
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
        
        <div class="container">
            <div class="form">
                <form action="ScreeningInfo" method="post" class="screeninginfo-form">
                    <%
                        int movieID;
                        MovieDetails md = new MovieDetails();
                        HttpSession s = request.getSession();
                        String movieName=s.getAttribute("movieName").toString();
                        movieID = Integer.parseInt(s.getAttribute("screenmovieid").toString());
                        ResultSet rs = md.getMovieScreeningInfo(movieID);
                        StringBuffer displayBuf2 = new StringBuffer();
                        displayBuf2.append("<br>");
                        displayBuf2.append("<dl>");
                        displayBuf2.append("<dt style='font-size:20px;'>Movie selected</dt><dd style='font-size:30px;'>"+movieName+"</dd>");
                        displayBuf2.append("</dl>");
                        
                        displayBuf2.append("<div class='form-group'>");                            
                        displayBuf2.append("<div class='col-sm-6'>");
                        displayBuf2.append("<label for='movie-name'>Select Screen and Time</label>");
                        displayBuf2.append("<br>"); 
                        displayBuf2.append("<select class='form-control selectpicker' data-width='100%' name='screening' id='screening'>");
                        displayBuf2.append("<option value='' selected>Select Time</option>");     
                        String screeningTime = "", screeningDate = "", screenName = "";
                        int screeningID;
                        while (rs.next()) {
                            screeningID = rs.getInt("screeningID");
                            screenName = rs.getString("screenName");
                            screeningDate = rs.getString("screeningDate");
                            screeningTime = rs.getString("screeningTime");
                            //movieIcon = rs.getString("icon");     
                                                                             
                            displayBuf2.append(
                                    "<option value='" + screeningID
                                    + "'>"  + screenName
                                    + " | " + screeningDate + " | " + screeningTime
                                    + "</option>"
                            );
                        }
                        displayBuf2.append("</select>");
                        displayBuf2.append("<br>");
                        displayBuf2.append("<br> <br> <br> <br> ");
                        displayBuf2.append("<a class='btn btn-info'type='button'href='DisplayMovieInfo.jsp'>Back</a><br>");
                        displayBuf2.append("</div>");
                        displayBuf2.append("</div>");
//                        displayBuf2.append("<input type='button' onclick=''class='btn btn-info' value='Select seat'>");
                            
                            displayBuf2.append("<br> <br> <br> <br> <br> <br><br>");
                            displayBuf2.append("<button class='btn btn-info'>Book now</button>");
                        
                        out.println(displayBuf2);
                    %>
                </form>
            </div>
               
            </div> 
    </body>
</html>
