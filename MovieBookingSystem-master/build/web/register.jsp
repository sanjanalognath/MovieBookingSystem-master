<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : Sanjana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <ul id="mainnav">
                    <li class="current"><a href="#">Home</a></li>
                    <li><a href="#">Book Tickets</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
            <div id="content">
                <div id="rotator">
                        <div class="login-page">
                        <div class="form">
                            
                            <form  action="Login" method="post">
                                <%
                                    StringBuffer displayBuf1= new StringBuffer();
                                    HttpSession ses= request.getSession();
                                    String status="true";
                                    if(ses.getAttribute("regstatus")!=null){
                                        status=ses.getAttribute("regstatus").toString();
                                    } 
                                    displayBuf1.append("<input type='text' placeholder='First Name' id='firstname' name='firstname'/>");
                                    displayBuf1.append("<input type='text' placeholder='Last Name' id='lastname' name='lastname'/>");
                                    displayBuf1.append("<input type='text' placeholder='Email id' id='loginid'  name='loginid'/>");
                                    displayBuf1.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='register'/>");
                                    displayBuf1.append("<input type='password' placeholder='password' name='password' id='password'/>");
                                    if( status!=null && !status.equals("")){
                                        System.out.println("status--->"+status);
                                        if(status.equals("false")){
                                            displayBuf1.append("<a style='color:red';/>User already registered</a>");
                                            ses.setAttribute("regstatus", "true");
                                        }
                                    }
                                    //displayBuf1.append("<input type='text' placeholder='email address' id='emailid'/>");
                                    //
                                    displayBuf1.append("<p class='message'>Already registered? <a href='/MovieBookingSystem/Login.jsp'>Sign In</a></p>");
                                    displayBuf1.append("<button>sign up</button>");
                                    out.println(displayBuf1);
                                %>
                                
                            </form>
                        </div>
                    </div>
            </div>
        </div>
  
        <div id="featured">
            
        </div>

        <div id="footer">
        
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/animate.js"></script>
    </body>
</html>
