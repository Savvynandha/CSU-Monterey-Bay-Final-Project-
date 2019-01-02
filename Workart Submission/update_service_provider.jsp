<%--
<%@page import="java.sql.*"%>

<%          
    /*
    String user_email = session.getAttribute("user_email").toString();
     String sp_email = request.getParameter("sp_email");
    int n = Integer.parseInt(request.getParameter("n"));
    String ta=request.getParameter("ta");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs2 = stmt2.executeQuery("select * from rating");
   if( rs2.next());
    {  rs2.moveToInsertRow();
       rs2.updateInt("num",n);
       rs2.updateString("user_email",user_email);
       rs2.updateString("review",ta);
       rs2.updateString("sp_email",sp_email);
       rs2.insertRow();
    */
            String sp_email=request.getParameter("sp_email");
            String phone=request.getParameter("phone");
            String website=request.getParameter("website");
            String per_hour_price=request.getParameter("per_hour_price");
            String starting_hour=request.getParameter("starting_hour");
            String ending_hour=request.getParameter("ending_hour");
            String description=request.getParameter("description");
            String sub_category=request.getParameter("sub_category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + sp_email + "\'");
             if(rs.next());
             {
             rs.updateString("sp_email",sp_email);
             rs.updateString("phone",phone);
             rs.updateString("website",website);
             rs.updateString("per_hour_price",per_hour_price);
             rs.updateString("starting_hour",starting_hour);
             rs.updateString("ending_hour",ending_hour);
             rs.updateString("description",description);
             rs.updateString("sub_category",sub_category);
             rs.updateRow();
             response.sendRedirect("service_provider_home.jsp?msg=data_updated");
             
             }
%>
--%>

<%-- Running test code --%>

<%@page import="java.sql.*"%>
<%          
           //String email= session.getAttribute("sp_email").toString();
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String website=request.getParameter("website");
            String per_hour_price=request.getParameter("per_hour_price");
            String starting_hour=request.getParameter("starting_hour");
            String ending_hour=request.getParameter("ending_hour");
            String description=request.getParameter("description");
            String sub_category=request.getParameter("sub_category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb","root","komal");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + email + "\'");
             if(rs.next())
             {
             rs.updateString("sp_email",email);
             rs.updateString("phone",phone);
             rs.updateString("website",website);
             rs.updateString("per_hour_price",per_hour_price);
             rs.updateString("starting_hour",starting_hour);
             rs.updateString("ending_hour",ending_hour);
             rs.updateString("description",description);
             rs.updateString("sub_category",sub_category);
             rs.updateRow();
             response.sendRedirect("service_provider_home.jsp?msg=data_updated");
             
             }
            
            
   %>           
            




<%------------------------ Code below this is a copy of the original code in this file (with changes to DB colum names) ------------------------------------%>
<%--
<%@page import="java.sql.*"%>
<%          String sp_email=request.getParameter("sp_email");
            String phone=request.getParameter("phone");
            String website=request.getParameter("website");
            String per_hour_price=request.getParameter("per_hour_price");
            String starting_hour=request.getParameter("starting_hour");
            String ending_hour=request.getParameter("ending_hour");
            String description=request.getParameter("description");
            String sub_category=request.getParameter("sub_category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + sp_email + "\'");
             if(rs.next())
             {
             rs.updateString("sp_email",sp_email);
             rs.updateString("phone",phone);
             rs.updateString("website",website);
             rs.updateString("per_hour_price",per_hour_price);
             rs.updateString("starting_hour",starting_hour);
             rs.updateString("ending_hour",ending_hour);
             rs.updateString("description",description);
             rs.updateString("sub_category",sub_category);
             rs.updateRow();
             response.sendRedirect("service_provider_home.jsp?msg=data_updated");
             
             }
%>
--%>