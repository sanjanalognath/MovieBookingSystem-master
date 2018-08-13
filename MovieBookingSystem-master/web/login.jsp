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
                    <li><a href="#">Movies Playing</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
            <div id="content">
                <div id="rotator">
                        <div class="login-page">
                        <div class="form">
                            <form action="Login" method="post" class="login-form">

                                <%
                                    HttpSession ses= request.getSession();
                                    String status="true";
                                    if(ses.getAttribute("status")!=null){
                                        status=ses.getAttribute("status").toString();
                                    }    
                                    StringBuffer displayBuf2= new StringBuffer();
                                    displayBuf2.append("<input type='text' placeholder='Email id' name='loginid' id='loginid'/>");
                                    displayBuf2.append("<input type='password' placeholder='Password' name='password' id='password'/>");
                                    if( status!=null && !status.equals("")){
                                        System.out.println("status--->"+status);
                                        if(status.equals("false")){
                                            displayBuf2.append("<a style='color:red';/>Invalid EmailId/Password</a>");
                                            ses.setAttribute("status", "true");
                                        }
                                    }
                                    displayBuf2.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='login'/>");
                                    displayBuf2.append("<button>login</button>");
                                    //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");
                                    
                                    out.println(displayBuf2);
                                %>
                                <p class="message">Not registered? <a href="/MovieBookingSystem/Register.jsp">Create an account</a></p>
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
    
    </body>
</html>
