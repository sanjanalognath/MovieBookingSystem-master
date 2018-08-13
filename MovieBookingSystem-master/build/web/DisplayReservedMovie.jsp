<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : Sanjana
--%>

<%@page import="Services.MovieDetails"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.FetchMovieScreening"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <script src="js/Movie.js"></script>
    <style type="text/css" media="screen">
        body {
          padding: 100px;
          background-color:#141311;
          color:#d75813;
        }
        
    </style>
    </head>
    <body>
    <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">My Reservation</a>
        </div>
      </div>
    </div>
    </div>
        
        <br>
	<div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="DisplayMovies.jsp">Home</a></li>
            <li style="font-size:150%"class="active"><%StringBuffer displayBufMr = new StringBuffer();
                                        HttpSession ses1= request.getSession();
                                        displayBufMr.append("<a  href=\"DisplayReservedMovie.jsp\">My Reservation</a>");
                                      out.println(displayBufMr);%></li>
            
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\" onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>
  	  </ul>
        <br>
  
        </div>
            <div class="container">
                            <form action="DisplayMovies.jsp" method="post" class="login-form" enctype="multipart/form-data">
                            <font size="5">
                            <table id="table-control" class="table table-bordered">                                
                                    <tr>
                                      <th>Reservation ID</th>
                                      <th>Movie Name</th> 
                                      <th>Screen Name</th>
                                      <th>Screen Date/Time</th>
                                      <th>Seats</th>
                                      <th>Duration</th>
                                      <th>Snacks</th>
                                      <th>Price</th>
                                      <th>Cancel</th>
                                    </tr>
                                    <%
                                        StringBuffer displayBuf= new StringBuffer();
                                        HttpSession s = request.getSession();
                                        int userID=Integer.parseInt(s.getAttribute("userId").toString() );
                                        MovieDetails ms=new MovieDetails();
                                        System.out.println("userID--->"+userID);
                                        ResultSet rs=ms.getreservedMovie(userID);
                                        int reservationID=0;
                                        String seatID="";
                                        int screening_id=0;
                                        Double totalPrice=0.0;
                                        while(rs.next()){
                                            totalPrice=0.0;
                                            reservationID=rs.getInt("reservation_id");
                                            screening_id=rs.getInt("screening_id");
                                            seatID=rs.getString("seat_id");
                                            String showSeats = seatID.replace("'", "");
                                            displayBuf.append("<tr><td>"+reservationID+"</td>");
                                            displayBuf.append("<td >"+rs.getString("movie_name")+"</td>");
                                            displayBuf.append("<td>"+rs.getString("screen_name")+"</td>");
                                            displayBuf.append("<td>"+rs.getDate("screening_date")+" "+rs.getString("screening_time")+"</td>");
                                            displayBuf.append("<td>"+showSeats+"</td>");
                                            displayBuf.append("<td>"+rs.getString("duration")+"</td>");
                                            totalPrice=totalPrice+rs.getDouble("price");
                                            ResultSet rs2=ms.getreservedfood(reservationID);
                                            String snacks="";
                                            while(rs2.next()){
                                                totalPrice=totalPrice+rs2.getDouble("price");
                                                snacks=snacks+rs2.getString("food_name")+" "+rs2.getString("Size")+" "+rs2.getString("fCount")+", ";
                                            }
                                            displayBuf.append("<td>"+snacks+"</td>");
                                            displayBuf.append("<td>$"+totalPrice+"</td>");
                                            displayBuf.append("<td>"+"<a href=\"/MovieBookingSystem/DeleteReservedMovie?reservationID="+reservationID+"&seatID="+seatID+"&screening_id="+screening_id+"\" onclick=\"return myFunction();\">Cancel</a>"+"</td></tr>");
                                            
                                        }%><%
                                        out.println(displayBuf);
                                    %>    
                                </table>
                                </font>
                            </form>            
    </body>
</html>
