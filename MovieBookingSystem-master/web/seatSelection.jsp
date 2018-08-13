<%--
    Document   : displaymovies
    Created on : Nov 7, 2017, 2:40:28 PM
    Author     : Sanjana
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Bean.MovieInfo"%>
<%@page import="Services.MovieDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <script src="js/Movie.js"></script>
  <title>Seat Page</title>
  <style type="text/css">
  body
  {
    background-color:#141311;
    color:#d75813;
  }
  * {
    margin: 0;
    padding: 0;

}

.seat {
    float: right;
    display: block;
    margin: 50px 5px 5px 5px;
    background: #808080;
    width: 50px;
    height: 50px;
}

.seat-select {
    display: none;

}
.seat-select-block {
    display: none;

}
.seat-select-block:disabled+.seat{
    background: #0000FF;
}

.seat-select:checked+.seat {
    /*background: #F44336;*/
    background: #4CAF50;
}
.checkbox-grid li {
    display: block;
    float: left;
    width: 10%;
    margin: 10px;
}
  .movie {
  margin: 120px auto;
  max-width: 1000px;
}
 .screen {
   height:60px; 
   position: relative;
   overflow: hidden;
   text-align: center;
   border-bottom: 5px solid #d8d8d8;
   &:before {
     content: "";
     display: block;
     position: absolute;
     top: 0;
     left: 0;
     height: 500px;
     width: 100%;
     border-radius: 50%;
     border-right: 5px solid #d8d8d8;
     border-left: 5px solid #d8d8d8;
   }
   h1 {
     width: 60%;
     margin: 100px auto 35px auto;
   }
 }

 #position{
  margin-top: 100px;
 }
 #submit-button{
  margin: 50px 50px 50px 50px;
  float: right;
 }
 #butt-style{
     margin: 0px;
     position: absolute;
     bottom: 110px;
     left: 1200px;
 }
  </style>

</head>
<body>

 <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Seat Booking</a>
        </div>
      </div>
    </div>
  </div>

    <div class="container">
<div class="movie">
  <div class="screen">
    <h3>Screen here</h3>
  </div>
  <div id="position">
  <ul class="checkbox-grid">
    <form id="reservation" action='ShowSeats' method="post" action=".jsp">
      <section id="seats">
        <%
            int movieID;
            int screeningID;
            StringBuffer displayBuf2 = new StringBuffer();
            MovieDetails md = new MovieDetails();
            MovieInfo movieInfo=new MovieInfo();
            HashMap<String, Integer> hmap = new HashMap<String, Integer>();
            HttpSession s = request.getSession();
            movieID = Integer.parseInt(s.getAttribute("movieID").toString());
            screeningID = Integer.parseInt(s.getAttribute("screeningID").toString());
            


            movieInfo.setMovieId(Integer.toString(movieID));
            movieInfo.setScreeningId(Integer.toString(screeningID));
            ResultSet selectedSeatsRS=md.getSelectedSeat(movieInfo);
            while(selectedSeatsRS.next()){
                hmap.put(selectedSeatsRS.getString("seat"),selectedSeatsRS.getInt("status"));
            }    
            displayBuf2.append("<input type='hidden'  name='hidmovieid' id='hidmovieid' value='"+movieID+"'/>");
            displayBuf2.append("<input type='hidden'  name='hidscreeningid' id='hidscreeningid' value='"+screeningID+"'/>");
            if(hmap.containsKey("A1") && (hmap.get("A1")==1 || hmap.get("A ")==2)){ 
                
                displayBuf2.append("<li><input id='A1' class=\"seat-select-block\" disabled  type='checkbox' value='A1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 1' class=\"seat-select\" onclick='selectseat(\"A 1\")' type='checkbox' value='A1' name='seat[]' />");
            }
            displayBuf2.append("<label for='A 1' class='seat'>A 1</label></li>");
            if(hmap.containsKey("A 2") && (hmap.get("A 2")==1 || hmap.get("A 2")==2)){ 
                
                displayBuf2.append("<li><input id='A 2' class=\"seat-select-block\" disabled  type='checkbox' value='A 2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 2' class=\"seat-select\" onclick='selectseat(\"A 2\")' type='checkbox' value='A 2' name='seat' />");
            }
            displayBuf2.append("<label for='A 2' class='seat'>A 2</label></li>");
            if(hmap.containsKey("A 3") && (hmap.get("A 3")==1 || hmap.get("A 3")==2)){ 
                
                displayBuf2.append("<li><input id='A 3' class=\"seat-select-block\" disabled  type='checkbox' value='A 3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 3' class=\"seat-select\" onclick='selectseat(\"A 3\")' type='checkbox' value='A 3' name='seat' />");
            }
            displayBuf2.append("<label for='A 3' class='seat'>A 3</label></li>");
            if(hmap.containsKey("A 4") && (hmap.get("A 4")==1 || hmap.get("A 4")==2)){ 
                
                displayBuf2.append("<li><input id='A 4' class=\"seat-select-block\" disabled  type='checkbox' value='A 4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 4' class=\"seat-select\" onclick='selectseat(\"A 4\")' type='checkbox' value='A 4' name='seat' />");
            }
            displayBuf2.append("<label for='A 4' class='seat'>A 4</label></li>");
            if(hmap.containsKey("A 5") && (hmap.get("A 5")==1 || hmap.get("A 5")==2)){ 
                
                displayBuf2.append("<li><input id='A 5' class=\"seat-select-block\" disabled  type='checkbox' value='A 5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 5' class=\"seat-select\" onclick='selectseat(\"A 5\")' type='checkbox' value='A 5' name='seat' />");
            }
            displayBuf2.append("<label for='A 5' class='seat'>A 5</label></li>");
            if(hmap.containsKey("A 6") && (hmap.get("A 6")==1 || hmap.get("A 6")==2)){ 
                
                displayBuf2.append("<li><input id='A 6' class=\"seat-select-block\" disabled  type='checkbox' value='A 6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 6' class=\"seat-select\" onclick='selectseat(\"A 6\")' type='checkbox' value='A 6' name='seat' />");
            }
            displayBuf2.append("<label for='A 6' class='seat'>A 6</label></li>");
            if(hmap.containsKey("A 7") && (hmap.get("A 7")==1 || hmap.get("A 7")==2)){ 
                
                displayBuf2.append("<li><input id='A 7' class=\"seat-select-block\" disabled  type='checkbox' value='A 7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 7' class=\"seat-select\" onclick='selectseat(\"A 7\")' type='checkbox' value='A 7' name='seat' />");
            }
            displayBuf2.append("<label for='A 7' class='seat'>A 7</label></li>");
            if(hmap.containsKey("A 8") && (hmap.get("A 8")==1 || hmap.get("A 8")==2)){ 
                
                displayBuf2.append("<li><input id='A 8' class=\"seat-select-block\" disabled  type='checkbox' value='A 8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A 8' class=\"seat-select\" onclick='selectseat(\"A 8\")' type='checkbox' value='A 8' name='seat' />");
            }
            displayBuf2.append("<label for='A 8' class='seat'>A 8</label></li>");
            
            
            
            if(hmap.containsKey("B 1") && (hmap.get("B 1")==1 || hmap.get("B 1")==2)){ 
                
                displayBuf2.append("<li><input id='B 1' class=\"seat-select-block\" disabled  type='checkbox' value='B 1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 1' class=\"seat-select\" onclick='selectseat(\"B 1\")' type='checkbox' value='B 1' name='seat[]' />");
            }
            displayBuf2.append("<label for='B 1' class='seat'>B 1</label></li>");
            if(hmap.containsKey("B 2") && (hmap.get("B 2")==1 || hmap.get("B 2")==2)){ 
                
                displayBuf2.append("<li><input id='B 2' class=\"seat-select-block\" disabled  type='checkbox' value='B 2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 2' class=\"seat-select\" onclick='selectseat(\"B 2\")' type='checkbox' value='B 2' name='seat' />");
            }
            displayBuf2.append("<label for='B 2' class='seat'>B 2</label></li>");
            if(hmap.containsKey("B 3") && (hmap.get("B 3")==1 || hmap.get("B 3")==2)){ 
                
                displayBuf2.append("<li><input id='B 3' class=\"seat-select-block\" disabled  type='checkbox' value='B 3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 3' class=\"seat-select\" onclick='selectseat(\"B 3\")' type='checkbox' value='B 3' name='seat' />");
            }
            displayBuf2.append("<label for='B 3' class='seat'>B 3</label></li>");
            if(hmap.containsKey("B 4") && (hmap.get("B 4")==1 || hmap.get("B 4")==2)){ 
                
                displayBuf2.append("<li><input id='B 4' class=\"seat-select-block\" disabled  type='checkbox' value='B 4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 4' class=\"seat-select\" onclick='selectseat(\"B 4\")' type='checkbox' value='B 4' name='seat' />");
            }
            displayBuf2.append("<label for='B 4' class='seat'>B 4</label></li>");
            if(hmap.containsKey("B 5") && (hmap.get("B 5")==1 || hmap.get("B 5")==2)){ 
                
                displayBuf2.append("<li><input id='B 5' class=\"seat-select-block\" disabled  type='checkbox' value='B 5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 5' class=\"seat-select\" onclick='selectseat(\"B 5\")' type='checkbox' value='B 5' name='seat' />");
            }
            displayBuf2.append("<label for='B 5' class='seat'>B 5</label></li>");
            if(hmap.containsKey("B 6") && (hmap.get("B 6")==1 || hmap.get("B 6")==2)){ 
                
                displayBuf2.append("<li><input id='B 6' class=\"seat-select-block\" disabled  type='checkbox' value='B 6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 6' class=\"seat-select\" onclick='selectseat(\"B 6\")' type='checkbox' value='B 6' name='seat' />");
            }
            displayBuf2.append("<label for='B 6' class='seat'>B 6</label></li>");
            if(hmap.containsKey("B 7") && (hmap.get("B 7")==1 || hmap.get("B 7")==2)){ 
                
                displayBuf2.append("<li><input id='B 7' class=\"seat-select-block\" disabled  type='checkbox' value='B 7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 7' class=\"seat-select\" onclick='selectseat(\"B 7\")' type='checkbox' value='B 7' name='seat' />");
            }
            displayBuf2.append("<label for='B 7' class='seat'>B 7</label></li>");
            if(hmap.containsKey("B 8") && (hmap.get("B 8")==1 || hmap.get("B 8")==2)){ 
                
                displayBuf2.append("<li><input id='B 8' class=\"seat-select-block\" disabled  type='checkbox' value='B 8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B 8' class=\"seat-select\" onclick='selectseat(\"B 8\")' type='checkbox' value='B 8' name='seat' />");
            }
            displayBuf2.append("<label for='B 8' class='seat'>B 8</label></li>");
            
            
            if(hmap.containsKey("C 1") && (hmap.get("C 1")==1 || hmap.get("C 1")==2)){ 
                
                displayBuf2.append("<li><input id='C 1' class=\"seat-select-block\" disabled  type='checkbox' value='C 1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 1' class=\"seat-select\" onclick='selectseat(\"C 1\")' type='checkbox' value='C 1' name='seat[]' />");
            }
            displayBuf2.append("<label for='C 1' class='seat'>C 1</label></li>");
            if(hmap.containsKey("C 2") && (hmap.get("C 2")==1 || hmap.get("C 2")==2)){ 
                
                displayBuf2.append("<li><input id='C 2' class=\"seat-select-block\" disabled  type='checkbox' value='C 2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 2' class=\"seat-select\" onclick='selectseat(\"C 2\")' type='checkbox' value='C 2' name='seat' />");
            }
            displayBuf2.append("<label for='C 2' class='seat'>C 2</label></li>");
            if(hmap.containsKey("C 3") && (hmap.get("C 3")==1 || hmap.get("C 3")==2)){ 
                
                displayBuf2.append("<li><input id='C 3' class=\"seat-select-block\" disabled  type='checkbox' value='C 3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 3' class=\"seat-select\" onclick='selectseat(\"C 3\")' type='checkbox' value='C 3' name='seat' />");
            }
            displayBuf2.append("<label for='C 3' class='seat'>C 3</label></li>");
            if(hmap.containsKey("C 4") && (hmap.get("C 4")==1 || hmap.get("C 4")==2)){ 
                
                displayBuf2.append("<li><input id='C 4' class=\"seat-select-block\" disabled  type='checkbox' value='C 4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 4' class=\"seat-select\" onclick='selectseat(\"C 4\")' type='checkbox' value='C 4' name='seat' />");
            }
            displayBuf2.append("<label for='C 4' class='seat'>C 4</label></li>");
            if(hmap.containsKey("C 5") && (hmap.get("C 5")==1 || hmap.get("C 5")==2)){ 
                
                displayBuf2.append("<li><input id='C 5' class=\"seat-select-block\" disabled  type='checkbox' value='C 5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 5' class=\"seat-select\" onclick='selectseat(\"C 5\")' type='checkbox' value='C 5' name='seat' />");
            }
            displayBuf2.append("<label for='C 5' class='seat'>C 5</label></li>");
            if(hmap.containsKey("C 6") && (hmap.get("C 6")==1 || hmap.get("C 6")==2)){ 
                
                displayBuf2.append("<li><input id='C 6' class=\"seat-select-block\" disabled  type='checkbox' value='C 6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 6' class=\"seat-select\" onclick='selectseat(\"C 6\")' type='checkbox' value='C 6' name='seat' />");
            }
            displayBuf2.append("<label for='C 6' class='seat'>C 6</label></li>");
            if(hmap.containsKey("C 7") && (hmap.get("C 7")==1 || hmap.get("C 7")==2)){ 
                
                displayBuf2.append("<li><input id='C 7' class=\"seat-select-block\" disabled  type='checkbox' value='C 7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 7' class=\"seat-select\" onclick='selectseat(\"C 7\")' type='checkbox' value='C 7' name='seat' />");
            }
            displayBuf2.append("<label for='C 7' class='seat'>C 7</label></li>");
            if(hmap.containsKey("C 8") && (hmap.get("C 8")==1 || hmap.get("C 8")==2)){ 
                
                displayBuf2.append("<li><input id='C 8' class=\"seat-select-block\" disabled  type='checkbox' value='C 8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C 8' class=\"seat-select\" onclick='selectseat(\"C 8\")' type='checkbox' value='C 8' name='seat' />");
            }
            displayBuf2.append("<label for='C 8' class='seat'>C 8</label></li>");
            //displayBuf2.append("<div id='butt-style'><input class='btn btn-info pull-right' type='submit' value='Select Seat'></div>");
            displayBuf2.append("<div class='container'>");
            displayBuf2.append("<div class='row'>");
            displayBuf2.append("<div class='col-12 col-sm-10 col-md-10'>");
            displayBuf2.append("<br><br><input class='btn btn-info pull-right' type='submit' value='Continue'>");
            displayBuf2.append("<a class='btn btn-info'type='button'href='DisplayMovieInfo.jsp'>Back</a>");
            displayBuf2.append("</div>"); 
            displayBuf2.append("</div>"); 
            displayBuf2.append("</div>"); 
            out.println(displayBuf2); 
      %>
      
    </section>
    </form>
<!--    <br> <br> <br> <br> <br> <br><br><br> <br> <br> <br> <br> <br><br><br> <br><br><br> <br><br>
    <a class='btn btn-info'type='button'href='DisplayMovieInfo.jsp'>Back</a>-->

<!--    <input class='btn btn-info pull-right' type='submit' value='Select Seat'>-->
    </ul>
  </div>
  
 
  
  </div>
</div>
</body>
</html>

