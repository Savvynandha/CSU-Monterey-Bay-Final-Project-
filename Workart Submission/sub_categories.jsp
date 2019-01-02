<%-- 
    Document   : sub_categories
    Created on : 8 Apr, 2017, 9:58:41 AM
    Author     : Tejus, This file was added in the project on 6/1/2018. 
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <center>
             <div class="container" style="margin-top: 40px">
        <form action="./MultiFileUploader3" method="post" enctype="multipart/form-data">
            <div class="row"><div class="col-sm-offset-3 col-sm-2" ><label style="font-size: 20px;font-family: cursive"><b>Enter sub_category_name</b></label></div>
                <div class="col-sm-4"><input type="text" name="sc" class="form-control"/><br></div></div>
            <div class="row"><div class="col-sm-offset-3 col-sm-2" ><label style="font-size: 20px;font-family: cursive"><b>Enter description</b></label></div>
                <div class="col-sm-4"><textarea name="ta" class="form-control"></textarea><br></div></div>
            <div class="row"><div class="col-sm-offset-3 col-sm-2" ><label style="font-size: 20px;font-family: cursive"><b>Select Photo</b></label></div>
                <div class="col-sm-4"> <input type="file" name="img" class="form-control"/><br></div></div>
                <div class="row"><div class="col-sm-offset-3 col-sm-2" ><label style="font-size: 20px;font-family: cursive"><b> Select category</b></label></div>
                        <div class="col-sm-4"><select name="cn" class="form-control">
                                   
            <%
            Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select c_name from category");
               
              while(rs.next())
              {
                  String c_name=rs.getString("c_name");
              
              %>
              <option value="<%=c_name%>"><%=c_name%></option>
              <%
                      
                      }
               %>
            
                
                            </select><br> </div></div>
           
               <input type="submit" value="ADD" class="btn-lg btn btn-success"/><br>
        </form>
             <% String m=request.getParameter("msg");
                if(m!=null)
                {
                %>
                <label><%=m%></label>
                <%
                    }
                 %>
                 </div>
         </center>
    </body>
</html>
