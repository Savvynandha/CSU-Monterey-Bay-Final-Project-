<%@page import="java.sql.*"%>
<%-- 
    Document   : categories
    Created on : Jun 10, 2018, 4:36:47 PM
    Author     : Tejus Nandha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <head>
        <title>Workart</title>
        
        <!--mobile apps-->
        <!--Custom Theme files -->
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <!-- //Custom Theme files -->
        <!--This includes the web-fonts-->
        <link href='//fonts.googleapis.com/css?family=Oranienbaum' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!--//web-fonts-->
        <!--This includes the js -->
        <script src="js/jquery-1.11.1.min.js"></script> 
        <script src="js/modernizr.custom.js"></script>
        <!-- This includes the js -->
        <!--flipster-js-->
        <link rel="stylesheet" href="css/jquery.flipster.css">
        <link rel="stylesheet" href="css/flipsternavtabs.css">
        <script type="text/javascript">
        </script>
        
        <!--//flipster-js-->
        <!--Begining of the animation-->
        
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        
        <!--//end of animation-->
        
        <!--start-smooth-scrolling-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>	
     
        <!--//end-smooth-scrolling-->
        
    </head>
    
    <body>
        <%@include file="public_header.jsp"%>
        
        <div class="news">
            <!--container-->
            <div class="container">
                <h3 class="title wow lightSpeedIn animated" data-wow-delay=".5s">Categories</h3>
                <div class="news-row">
                    <%      int i = 0;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs = stmt.executeQuery("select* from category");
                        while (rs.next()) {
                            i++;
                            String path = rs.getString("photo");
                            String c_name = rs.getString("c_name");
                            String description = rs.getString("description");

                    %>
                    <div class="col-md-4 news-grid wow slideInLeft animated" style="margin-bottom: 10px" data-wow-delay=".5s">
                        <img src="<%=path%>" alt="" style="width: 100%;height: 300px">
                        <div class="news-grid-info">
                            <a href="home_subcat_forcat.jsp?name=<%=c_name%>">
                                <h5><%=c_name%></h5></a>

                           <h4>Description:</h4>
                            <p><%=description%></p>

                        </div>
                    </div>
                    <%
                        if (i % 3 == 0) {
                    %>
                </div><div class="news-row">
                    <%}
                        }
                    %>

                    <div class="clearfix"> </div>
                </div>
            </div>
            <!--//container-->
        </div>
        <!--//news-->
    </body>
</html>
