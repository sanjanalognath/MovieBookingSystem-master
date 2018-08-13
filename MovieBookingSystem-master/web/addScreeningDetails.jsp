<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : Sanjana
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Screening</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
         <script src="js/Movie.js"></script>
    <style type="text/css" media="screen">
        body {
          background-color:#141311;
          color:#d75813;
          padding: 100px; 
       }
        input[type="date"]{
        border-radius:5px;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
    }
        </style>
    </head>
    <body>        
        <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Insert Screening Time</a>
        </div>
      </div>
    </div>
    </div>
        
        <br>
        <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="displayMovieScreening.jsp">Home</a></li>
	    <li style="font-size:150%"><a href="addMovieDetails.jsp">Insert Movies</a></li>
	    <li style="font-size:150%" class="active"><a href="#">Screening Time</a></li>
	    <li style="font-size:150%"><a href="#">Food</a></li>
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\" onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>

  	  </ul>
        <br>
  
        </div>
        <div class="container">
            <div class="form">
                <form id="ScreeningInformation"action="Screening" method="post" class="form-horizontal">                                                
                    <%
                        StringBuffer displayBuf= new StringBuffer();
                        String movieName = "";
                        String movieIcon = "";
                        int movieID;
                        String screenName = "";
                        int screenID;
                        Date date = new Date();
                        SimpleDateFormat simpDate=new SimpleDateFormat("hh:mm:ss a");

                        MovieInfo mi = new MovieInfo();
                        MovieDetails md = new MovieDetails();
                        md.getMovieNamesIcon(mi);
                        md.getScreeningDtls(mi);
                        ResultSet rsMovie = mi.getAllMovieNamesIcon();
                        ResultSet rsScreen = mi.getAllScreenNames();


                        displayBuf.append("<div class='form-group'>");                            
                        displayBuf.append("<div class='col-sm-4'>");
                        displayBuf.append("<label for='movie-name'>Select movie</label>");
                        displayBuf.append("<br>");  
                        displayBuf.append("<select class='form-control selectpicker' data-width='100%' name='movie' id='movie'>");
                        displayBuf.append("<option value='' selected>Select Movie</option>");
                        while (rsMovie.next()) {
                            movieID = rsMovie.getInt("id");
                            movieName = rsMovie.getString("name");
                            movieIcon = rsMovie.getString("icon");
                            //displayBuf.append("<a>" + movieID + "  " + movieName + "  " + movieIcon + "</a><br>");
                            displayBuf.append("<option value='" + movieID + "'>" + movieName + "</option>");
                        }
                        displayBuf.append("</select>");
                        displayBuf.append("</div>");
                        displayBuf.append("</div>");
                        displayBuf.append("<br>");                               
                        displayBuf.append("<div class='form-group'>");                            
                        displayBuf.append("<div class='col-sm-4'>");
                        displayBuf.append("<label for='movie-name'>Select Screen</label>");
                        displayBuf.append("<br>"); 
                        displayBuf.append("<select class='form-control selectpicker' data-width='100%' name='screen' id='screen'>");
                        displayBuf.append("<option value='' selected>Select Screen</option>");
                        while (rsScreen.next()) {
                            screenID = rsScreen.getInt("id");
                            screenName = rsScreen.getString("name");
                            displayBuf.append("<option value='" + screenID + "'>" + screenName + "</option>");
                        }
                        displayBuf.append("</select>");
                        displayBuf.append("</div>");
                        displayBuf.append("</div>");
                        
                        displayBuf.append("<div class='form-group'>");                            
                        displayBuf.append("<div class='col-sm-4'>");
                        displayBuf.append("<label for='movie-name'>Set date</label>");
                        displayBuf.append("<br>");  
                        displayBuf.append("<input type='date' name='screendate' id='screendate'>");
                        displayBuf.append("</div>");
                        displayBuf.append("</div>");
                        
                        displayBuf.append("<div class='form-group'>");                            
                        displayBuf.append("<div class='col-sm-4'>");
                        displayBuf.append("<label for='movie-name'>Set Time</label>");
                        displayBuf.append("<br>"); 
                        displayBuf.append("<select class='form-control selectpicker' data-width='100%' name='time' id='time'>");
                        displayBuf.append("<option value='' selected>Select Time</option>");
                        displayBuf.append("<option value='10:00 AM'>10:00 AM</option>");
                        displayBuf.append("<option value='1:00 PM'>1:00 PM</option>");
                        displayBuf.append("<option value='4:00 PM'>4:00 PM</option>");
                        displayBuf.append("<option value='6:00 PM'>6:00 PM</option>");
                        displayBuf.append("<option value='10:00 PM'>10:00 PM</option>");
                        displayBuf.append("<select/>");
                        displayBuf.append("</div>");
                        displayBuf.append("</div>");
                        
                       displayBuf.append("<input type='submit' readonly  class='btn btn-info'  name='hidoperation' id='hidoperation' value='Submit'/>");
                        //displayBuf.append("<button>Submit</button>");
                        //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");

                        out.println(displayBuf);
                    %>                                
                </form>
              </div>  
            </div>                     
    </body>
</html>
