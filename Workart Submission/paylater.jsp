<%--

<%@page import="java.sql.*"%>
<%
    String sp_email = request.getParameter("sp_email");
    String date1 = request.getParameter("date");
    int price = Integer.parseInt(request.getParameter("tb"));
    String user_email = session.getAttribute("user_email").toString();

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from booking");
    {
        rs.moveToInsertRow();
        rs.updateString("date",date1);
        rs.updateInt("total_price",price);
        rs.updateString("user_email", user_email);
        rs.updateString("sp_email", sp_email);
        rs.insertRow();

    }
  
ResultSet rs1 = stmt.executeQuery("select max(booking_id) as b1 from booking");
int bid=0;
if(rs1.next())
{
bid=rs1.getInt("b1");
}
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs3 = stmt3.executeQuery("select * from booking_detail");
String s[]=request.getParameterValues("cb");
for(int i=0;i<s.length;i++)
{
int st_slot,end_slot;
st_slot=Integer.parseInt(s[i]);
end_slot=st_slot+1;
rs3.moveToInsertRow();
rs3.updateInt("starting_hour",st_slot);
rs3.updateInt("ending_hour",end_slot);
rs3.updateInt("booking_id",bid);
rs3.insertRow();
}

%>
<h1>Booking Succesful</h1>
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <form style="min-height: 420px">
        <%
            String date1=request.getParameter("date");
            String sp_email=request.getParameter("sp_email");
            String user_email=session.getAttribute("user_email").toString();
            int price=Integer.parseInt(request.getParameter("tb"));
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
             Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             ResultSet rs = stmt.executeQuery("select * from booking");
             rs.moveToInsertRow();
             rs.updateString("date",date1);
             rs.updateInt("total_price",price);
             rs.updateString("user_email",user_email);
             rs.updateString("sp_email",sp_email);
             rs.insertRow();
        

             ResultSet rs1 = stmt.executeQuery("select max(booking_id) as b1 from booking");
             int bid=0;
             if(rs1.next())
             {
                 bid=rs1.getInt("b1");
             }
             
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
             Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             ResultSet rs2= stmt2.executeQuery("select * from booking_detail");
             
               String s[]=request.getParameterValues("cb");
               for(int i=0;i<s.length;i++)
               {
                   
                   int st_slot,end_slot;
                   st_slot=Integer.parseInt(s[i]);
                   end_slot=st_slot+1;
                   rs2.moveToInsertRow();
                   rs2.updateInt("starting_hour",st_slot);
                   rs2.updateInt("ending_hour",end_slot);
                   rs2.updateInt("booking_id",bid);
                   rs2.insertRow();
               }
               
            %>
    <center><h1 style="margin-top: 100px">Booking Successful</h1></center>
        </form>
    
    </body>
</html>
