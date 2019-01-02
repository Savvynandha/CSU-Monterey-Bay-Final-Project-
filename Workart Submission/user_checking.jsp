<%-- 
    Document   : user_checking
    Created on : Jun 4, 2018, 11:59:35 AM
    Author     : Tejus Nandha
    Details    : This file was not a original file in the project it was added on Jun 4th, from another project file.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    String user_email=request.getParameter("un");
    String password=request.getParameter("ps");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb","root","komal");
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=stmt.executeQuery("select * from user where email=\'"+user_email+"\' and password=\'"+password+"\'" );
    if(rs.next())
    {
        session.setAttribute("email",user_email);
        response.sendRedirect("user_home.jsp?msg=login successful");
    }
    else
    {
        response.sendRedirect("user_login.jsp?msg=The information you entered is incorrect");
    }
    %>