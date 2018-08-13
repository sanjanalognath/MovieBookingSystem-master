<%--
    Document   : FoodSelect
    Created on : Nov 18, 2017, 11:43:25 AM
    Author     : Sanjana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Food</title>
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
          padding: 100px; 
       }
       .movie-tile {
          margin-bottom: 20px;
          padding-top: 20px;         
        }
       </style>
    </head>
    <body>
       <div class="container">
            <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
              <div class="container">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#">Food</a>
                </div>
              </div>
            </div>
        </div> 
        <form action="FoodSelect" method="post" class="foodselect-form">
            <%
                MovieDetails md = new MovieDetails();
                HttpSession s = request.getSession();
                String selectedSeats = s.getAttribute("selectedseats").toString();
                int movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                ResultSet rs = md.getFoods();
                StringBuffer displayBuf2 = new StringBuffer();
//                displayBuf2.append("<table>");
                displayBuf2.append("<div class='container'>");   
                displayBuf2.append("<div class='col-sm-12'>");
                displayBuf2.append("<dl>");
                while (rs.next()) {
                    String foodName = rs.getString("food_name");
                    ResultSet rs2 = md.getFoodDetails(foodName);                             
                    
                    displayBuf2.append("<div class='row'>");
                    displayBuf2.append("<div class='movie-tile col-sm-4 text-center'>");
                    displayBuf2.append("<img class='img-thumbnail' src='./images/popcorn.jpg'");
                    displayBuf2.append("<br> <br> <br>");
                    
                    displayBuf2.append("<dt style='font-size:20px;'>" + foodName + "</dt><select class='form-control selectpicker' data-width='100%'name='" + foodName + "' id='" + foodName + "'>");
                    int foodID = 0;
                    displayBuf2.append("<option value='' selected>Select quantity</option>");
//                    displayBuf2.append("<option value='" + foodID + "' selected></option>");
                    while (rs2.next()) {
                        foodID = rs2.getInt("food_id");
                        String foodSize = rs2.getString("size");
                        float foodPrice = rs2.getFloat("price");
                        displayBuf2.append("<option value='" + foodID + "'>" + foodSize + "@ $" + foodPrice + "</option>");
                    }
                    displayBuf2.append("</select>");
                     displayBuf2.append("<br> <br> <br>");
                    displayBuf2.append("<dd style='font-size:17px;'>Count<dd> <input class='form-control input-lg' type=number name='" + foodName + "Count" + "'id='" + foodName + "Count" + "' value='0' step='1' min='0' max='10' placeholder='count'>");
                    displayBuf2.append("</div>");
                }
                    displayBuf2.append("</dl>");
                    displayBuf2.append("</div>");
                    displayBuf2.append("</div>");
//                displayBuf2.append("</table>");
                displayBuf2.append("<button class='btn btn-info pull-right'>Review Order & Pay</button>");
                out.println(displayBuf2);
            %>            
        </form>
    </body>
</html>
