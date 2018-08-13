<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : Sanjana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.FetchMovieScreening"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
<!--         <script src="js/Movie.js"></script>-->

    <style type="text/css" media="screen">
        body {
          background-color:#141311;
          color:#d75813;
          padding: 100px; 
       }
       </style>
    </head>
    <body>
        <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Update Movies</a>
        </div>
      </div>
    </div>
    </div>
        
        <br>
        <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="displayMovieScreening.jsp">Home</a></li>
                        
            <li style="font-size:150%;float:right;"><% StringBuffer displayBuflog = new StringBuffer();
                                        HttpSession ses2= request.getSession();
                                        displayBuflog.append("<a href=\"Logout\" onclick=\"return myFunctionLogout();\">Logout</a>");
                                        out.println(displayBuflog);%></li>
            </ul>
        <br>
  
        </div>
            <div class="container">
                            <form id="UpdateInformation"action="Movie" method="post" class="form-horizontal" enctype="multipart/form-data"> 
                                <%
                                    StringBuffer displayBuf2= new StringBuffer();
                                    String movieId=request.getParameter("movieid");
                                    System.out.println("movieId--->"+movieId);
                                    MovieInfo mi=new MovieInfo();
                                    FetchMovieScreening ms=new FetchMovieScreening();
                                    mi.setMovieId(movieId);
                                    ResultSet rs=ms.fetchMoviedtls(mi);
                                    
                                    if(rs.next()){
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Movie Name</label>");
                                        displayBuf2.append("<br>");
                                        displayBuf2.append("<input class='form-control' type='text' placeholder='Movie Name' name='title' id='title' value='"+rs.getString("name")+"'/>");
                                        displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Director Name</label>");
                                        displayBuf2.append("<br>");
                                        displayBuf2.append("<input class='form-control'type='text' placeholder='Director' name='director' id='director' value='"+rs.getString("director")+"'/>");
                                         displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Cast</label>");
                                        displayBuf2.append("<br>");
                                        displayBuf2.append("<input class='form-control'type='text' placeholder='Cast' name='cast' id='cast' value='"+rs.getString("cast")+"'/>");
                                        displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Description</label>");
                                        displayBuf2.append("<br>");
                                        System.out.println("description--->"+rs.getString("description"));
                                        //displayBuf2.append("<input class='form-control'type='text' placeholder='Description' name='description' id='description' value='"+rs.getString("description")+"'/>");
                                        displayBuf2.append("<textarea rows='5' class='form-control' type='textarea' placeholder='Description' name='description' id='description'>'"+rs.getString("description")+"'</textarea>");
                                        displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Runing Time</label>");
                                        displayBuf2.append("<br>");
                                        displayBuf2.append("<input class='form-control'type='text' placeholder='Duration' name='duration' id='duration' value='"+rs.getString("duration")+"'/>");
                                        displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<div class='form-group'>");                           
                                        displayBuf2.append("<div class='col-sm-4'>");
                                        displayBuf2.append("<label for='name'>Select Image</label>");
                                        displayBuf2.append("<br>");
                                        displayBuf2.append("<input class='browse btn btn-primary input-md form-control'type='file' name='file'> ");
                                        displayBuf2.append("</div>");
                                        displayBuf2.append("</div>");
                                        
                                        displayBuf2.append("<input class='browse btn btn-primary input-md' type='hidden'  name='hidmovieid' id='hidmovieid' value='"+movieId+"'/>");                                  
                                    }displayBuf2.append("<input  onclick='UpdateSubmit()'class='btn btn-info' type='submit' value='Submit' name='newmovie' />");
                                    out.println(displayBuf2);
                                %>
                                <input type='hidden'  name='hidoperation' id='hidoperation' value='update'/>
<!--                                <input  onclick='UpdateSubmit()'class="btn btn-info" type="submit" value="Submit" name="newmovie" />-->
                            </form>
                        </div>
    </body>
</html>
