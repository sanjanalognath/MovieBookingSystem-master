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
	    <li style="font-size:150%" class="active"><a href="DisplayMovies.jsp">Home</a></li>
            <li style="font-size:150%"><%StringBuffer displayBufMr = new StringBuffer();
                                        HttpSession ses1= request.getSession();
                                        displayBufMr.append("<a  href=\"DisplayReservedMovie.jsp\">My Reservation</a>");
                                      out.println(displayBufMr);%></li>
            
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\" onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>
            </ul>

        <form id='DisplayMovieInfo' action="DisplayMovieInfo" method="post" >

            <%
                int movieID;
                MovieDetails md = new MovieDetails();
                HttpSession s = request.getSession();
                movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                System.out.println("movieID--->"+movieID);
                ResultSet rs = md.getMovieInfo(movieID);
                StringBuffer displayBuf1 = new StringBuffer();   
                displayBuf1.append("<div class='container'>");   
                displayBuf1.append("<div class='col-sm-12'>");
                if(rs.next()){ 
                    String movieName=rs.getString("name");
                    s.setAttribute("movieName",movieName );
                    
                    displayBuf1.append("<dl>");
                    displayBuf1.append("<input type='hidden' name='screenmovieid' id='screenmovieid' value='" + movieID + "'/>");
                    displayBuf1.append("<p>");                    
                    displayBuf1.append("<div style='text-align:center'><dd style='font-size:45px;margin:0;'>" 
                                        + movieName
                                        +"</dd></div>");                    
                    displayBuf1.append("<div style='text-align:center'><dd style='font-size:20px;margin:0;'>" + rs.getString("director")+"</dd></div>");
                    displayBuf1.append("<br><dt style='font-size:20px;'>Cast &nbsp </dt><dd style='font-size:20px;'>" + rs.getString("cast")+"</dd>");
                    displayBuf1.append("<br><dt style='font-size:20px;'>Duration &nbsp </dt><dd style='font-size:20px;'>" + rs.getInt("duration")+" minutes</dd>");
                    displayBuf1.append("<br><dt style='font-size:20px;'>Description &nbsp </dt><dd style='font-size:20px;'>" + rs.getString("description")+"</dd>");
                    displayBuf1.append("</p>");
                    displayBuf1.append("</dl>");
                }
                displayBuf1.append("<input type='button' onclick='form2Submit()' class='btn btn-info pull-right' value='Book seat'>");
                displayBuf1.append("<a class='btn btn-info'type='button'href='DisplayMovies.jsp'>Back</a><br>");
                displayBuf1.append("</div>");
                displayBuf1.append("</div>");
                out.println(displayBuf1);

            %>
        </form>
        </div>
        
        <br>
        <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="#">Reviews</a></li>
            </ul>
        
        <form id='UpdateMovieRev' action="UpdateMovieReview" method="post" >
            <%
                StringBuffer displayBuf2 = new StringBuffer();
                int userID=Integer.parseInt(session.getAttribute("userId").toString() );
                MovieInfo movieInfo=new MovieInfo();
                movieInfo.setMovieId( Integer.toString(movieID));
                movieInfo.setUserId(Integer.toString(userID));
                ResultSet reviewRS = md.getMovieReview(movieInfo);

                displayBuf2.append("<input type='hidden'  name='movieid' id='movieid' value='" + movieID + "'/>");
                displayBuf2.append("<input type='hidden'  name='userid' id='userid' value='" + userID + "'/>");
                if(reviewRS.next()){
                  displayBuf2.append("<input type='hidden'  name='operation' id='operation' value='update'/>");
                    
                    displayBuf2.append("<div class='form-group'>");                            
                    displayBuf2.append("<div class='col-sm-4'>");
                    displayBuf2.append("<label for='movie-name'>Rating</label>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<p>"+reviewRS.getInt("rating")+"</p>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<label for='name'>Comments</label>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<textarea rows='5' class='form-control' type='textarea' placeholder='Comments' name='comments' id='comments'>"+reviewRS.getString("comments")+"</textarea><br>");
                    displayBuf2.append("<a class='btn btn-info' type='link' href='DisplayMovieReview.jsp'>See all reviews</a><br>");
                    displayBuf2.append("</div>");
                    displayBuf2.append("</div>");
                }
                else{
                    displayBuf2.append("<input type='hidden'  name='operation' id='operation' value='insert'/>");
                    
                    displayBuf2.append("<div class='form-group'>");                            
                    displayBuf2.append("<div class='col-sm-4'>");
                    displayBuf2.append("<label for='movie-name'>Rating</label>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<select class='form-control selectpicker' data-width='100%' name='rating' id='rating'>");
                    displayBuf2.append("<option value='' selected>Rating</option>");
                    displayBuf2.append("<option value='1'>1</option>");
                    displayBuf2.append("<option value='2'>2</option>");
                    displayBuf2.append("<option value='3'>3</option>");
                    displayBuf2.append("<option value='4'>4</option>");
                    displayBuf2.append("<option value='5'>5</option>");
                    displayBuf2.append("<select/><br>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<label for='name'>Comments</label>");
                    displayBuf2.append("<br>");
                    displayBuf2.append("<textarea rows='5' class='form-control' type='textarea' placeholder='Comments' name='comments' id='comments'></textarea><br>");
                    displayBuf2.append("<a class='btn btn-info' type='link' href='DisplayMovieReview.jsp'>See all reviews</a><br>");
                    displayBuf2.append("</div>");
                    displayBuf2.append("</div>");
                }
                
                displayBuf2.append("<input type='button' onclick='form1Submit()' class='btn btn-info pull-right' value='Submit review'><br>");
                out.println(displayBuf2);
                
            %>
        </form>    
        </div>
        
    </body>
</html>
