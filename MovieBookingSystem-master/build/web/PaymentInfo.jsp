<%--
    Document   : PaymentInfo
    Created on : Nov 18, 2017, 3:12:14 PM
    Author     : Sanjana
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order review & Payment</title>
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
       #st{
           position: absolute;
           top: 456px;
       }
       </style>
    </head>
    <body>
    <div class="container">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Order and Payment Review</a>
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


        
        <form action="PaymentInfo" method="post" class="payment-form">
            <%
                StringBuffer displayBuf2 = new StringBuffer();
                displayBuf2.append("<div class='form-group' style='float:right;'>");
                displayBuf2.append("<h1>Payment Info:</h1><br>");
                displayBuf2.append("<table><tr><td><h3>Card Number</h3></td><td><h3>:</h3></td><td><input class='form-control'type='number' maxlength='16'></td></tr>");
                displayBuf2.append("<tr><td><h3>Card holder's name</h3></td><td><h3>:</h3></td><td><input class='form-control'type='text'></td></tr>");
                displayBuf2.append("<tr><td><h3>Security code</h3></td><td><h3>:</h3></td><td><input class='form-control'type='number' maxlength='3'></td></tr>");
                displayBuf2.append("<tr><td><h3>Zip</h3></td><td><h3>:</h3></td><td><input class='form-control'type='number' maxlength='5'></td></tr>");
                displayBuf2.append("</table>");     
//                displayBuf2.append("<form >");
                displayBuf2.append("<div id='st'><a class='btn btn-info'type='button'href='FoodSelect.jsp'>Back</a></div><br>");
                displayBuf2.append("<button class='btn btn-info pull-right'>Pay<button>");
                displayBuf2.append("</form>");
                displayBuf2.append("</div>"); 

                MovieDetails md = new MovieDetails();
                HttpSession s = request.getSession();
                String selectedSeats = s.getAttribute("selectedseats").toString();
                String food = s.getAttribute("selectedfood").toString();
                int screeningID = Integer.parseInt(s.getAttribute("screeningID").toString());
                int movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                int seatCount = Integer.parseInt(s.getAttribute("seatCount").toString());
                double price = 0;
                price += seatCount * 10;
                String ShowSeats = selectedSeats.replace("'", "");
                ResultSet rs = md.getMovieInfo(movieID);
                rs.next();
                String movieName = rs.getString("name");
                rs = md.getScreeningInfo(screeningID);
                rs.next();
                String screenName = rs.getString("screenName");
                String screenDate = rs.getString("screeningDate");
                String screenTime = rs.getString("screeningTime");
                displayBuf2.append("<table>");
                displayBuf2.append("<h1>Order Information</h1><br>");
                displayBuf2.append("<tr><td><h3>Movie</h3><td><td><h3>:</h3></td><td><h3>" + movieName + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Screen</h3><td><td><h3>:</h3></td><td><h3>" + screenName + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Date</h3><td><td><h3>:</h3></td><td><h3>" + screenDate + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Time</h3><td><td><h3>:</h3></td><td><h3>" + screenTime + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Seats</h3><td><td><h3>:</h3></td><td><h3>" + ShowSeats + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Seat Count</h3><td><td><h3>:</h3></td><td><h3>" + seatCount + "</h3></td></tr>");
                displayBuf2.append("<tr><td><h3>Food</h3><td><td><h3>:</h3></td><td><h3>");
                if (!food.matches("(.*)\\d+>\\d+(.*)")) {
                    displayBuf2.append("None</h3></td></tr>");
                } else {
                    String selectedFood[] = food.split(",");
                    String foodIdCount[];
                    int foodIDnCount[][];
                    int foodIDs[];
                    for (String temp : selectedFood) {
                        if (temp.matches("\\d+>\\d+")) {
                            foodIdCount = temp.split(">");
                            if (Integer.parseInt(foodIdCount[1]) != 0) {
                                int foodID = Integer.parseInt(foodIdCount[0]);
                                int foodCount = Integer.parseInt(foodIdCount[1]);
                                ResultSet fd = md.getFoodDetails(foodID);
                                fd.next();
                                String fName = fd.getString("food_name");
                                String fSize = fd.getString("size");
                                double fPrice = fd.getFloat("price");
                                price += fPrice * foodCount;
                                displayBuf2.append(fName + "&nbsp" + fSize + "&nbsp" + foodCount + " Nos.<br>");
                            }
                        }
                    }
                    //displayBuf2.append("</td></tr><tr><td><h1>Total</h1><td><td><h2>:</h2></td><td><h2>$" + price + "</h2></td></tr>");
                    //displayBuf2.append("</td></tr></table><br>");
                }
                displayBuf2.append("</td></tr><tr><td><h1>Total</h1><td><td><h2>:</h2></td><td><h2>$" + price + "</h2></td></tr>");
                    displayBuf2.append("</td></tr></table><br>");
                
                out.println(displayBuf2);
            %>
<!--            <p class="message">Not registered? <a href="#">Create an account</a></p>-->
        </form>
      
    </body>
</html>
