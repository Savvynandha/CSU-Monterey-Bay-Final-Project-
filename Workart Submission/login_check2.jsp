<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\'and password=\'"+password+"\'");
    if(rs.next())
     {
        session.setAttribute("user_email",email);
    %>
        correct
    <%
     }
    else
     {
    %>
      incorrect
    <%
     }
    %>