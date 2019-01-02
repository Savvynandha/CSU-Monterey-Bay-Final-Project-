<%--The code below is the modified version of the unoriginal code--%>
<%--
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
		<%@include file="sp_header.jsp"%>
		<div class="container">
		<form action="update_service_provider.jsp">
        <%
            // String email=request.getParameter("sp_email");
           //String password=request.getParameter("pass");
          // session.setAttribute("email", email);
       //  String username=email;
         //String actualPassword ="";
         
             String email=session.getAttribute("sp_email").toString();
             Class.forName("com.mysql.jdbc.Driver");
             //String email=session.getParameter("sp_email").toString();
             Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
             Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + email  + "\' ");
             if(rs.next())
				{	
					String sp_email=rs.getString("sp_email");
					String phone=rs.getString("phone");
					String website=rs.getString("website");
					String per_hour_price=rs.getString("per_hour_price");
					String starting_hour=rs.getString("starting_hour");
					String ending_hour=rs.getString("ending_hour");
					String description=rs.getString("description");
					String sub_category=rs.getString("sub_category");
            %>
        
        
        
      
         
              <center> <h1>Edit Your Details</h1></center><br>
           <div class="form-group">
                    <label class="col-sm-2">Email</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="email" value="<%= sp_email%>"/></div></div><br><br>
                <div class="form-group">
                    <label class="col-sm-2">Phone</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="phone" value="<%= phone%>"/></div></div><br><br>
                <div class="form-group">
                    <label class="col-sm-2">Website</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="web" value="<%= website%>"/></div></div><br><br>
                    <div class="form-group">
                    <label class="col-sm-2">Per-Hour-Price</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="php" value="<%= per_hour_price%>"/></div></div><br><br>
             

                <div class="form-group">
                    <label class="col-sm-2">Enter Starting hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="sh" required>
                            <option><%= starting_hour%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-2">Enter Ending hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="eh" required>
                            <option><%= ending_hour%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br></div></div>
                 <div class="form-group">
                   <label class="col-sm-2">Enter Description</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="desc" value="<%= description%>" style="margin-bottom: 20px"/></div></div>
                    <br><br>
                    <div class="form-group">
                    <label class="col-sm-2">Sub Category</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="scat" value="<%= sub_category%>" style="margin-bottom: 20px" readonly/></div></div><br><br>
                        
                      <center><input type="submit" value="Edit" class="btn btn-success" style="background: rgb(25,52,81);color:white"/></center>    
                   
						<%
                            }
                        %>

          </form> 
      </div>
               <%@include file="footer.jsp"%>
    </body>
</html>
--%>

<%-- the code below this line is not original--%>

<%--

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
        <%@include file="sp_header.jsp" %>
        <div class="container" style="min-height: 445px">
        <form  action="./MultiFileUploader8" method="post" enctype="multipart/form-data">
        <%  
            String email=session.getAttribute("sp_email").toString();
             Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + email  + "\' ");
                if(rs.next())
                {   String photo=rs.getString("photo");
                   String sp_email=rs.getString("sp_email");
                   String name=rs.getString("name");
                   String phone=rs.getString("phone");
                   String website=rs.getString("website");
                   String starting_hour=rs.getString("starting_hour");
                   String ending_hour=rs.getString("ending_hour");
                   String per_hour_price=rs.getString("per_hour_price");
                   String latitude=rs.getString("latitude");
                   String longitude=rs.getString("longitude");
                   String description=rs.getString("description");
            %>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2" style="background-color:white;padding: 20px;margin-top: 10px">
                    <center>
                        <label style="font-size: 30px; font-family: cursive;color: rgb(25,52,81);margin-bottom: 30px">Your Basic Details</label>
                        <div class="form-group"><label class="col-sm-6">Photo:</label>
                       <div class="col-sm-6"><input type="file" name="file" class="form-control"/><br></div></div>
                        <div class="form-group"><label class="col-sm-6">Email:</label>
                            <div class="col-sm-6"><input type="text" value='<%=sp_email%>' class="form-control" name="sp_email"/><br></div></div>

                            <div class="form-group"><label class="col-sm-6">Name:</label>
                                <div class="col-sm-6" ><input type="text" value="<%= name%>" class="form-control" name="name"/><br></div></div>

                                <div class="form-group"><label class="col-sm-6">Phone:</label>
                                    <div class="col-sm-6"><input type="text" value="<%= phone%>" class="form-control" name="phone"/><br></div></div>

                                    <div class="form-group"><label class="col-sm-6">Website:</label>
                                        <div class="col-sm-6"><input type="text" value="<%= website%>" class="form-control" name="website"/><br></div></div>

                                          <div class="form-group"><label class="col-sm-6">Starting Hour:</label>
                                              <div class="col-sm-6"><input type="text" value="<%= starting_hour%>" class="form-control" name="starting_hour"/><br></div></div>

                                            <div class="form-group"><label class="col-sm-6">Ending Hour:</label>
                                                <div class="col-sm-6"><input type="text" value="<%= ending_hour%>" class="form-control" name="ending_hour"/><br></div></div>
                                                
                                                <div class="form-group"><label class="col-sm-6">Per Hour Price:</label>
                                                    <div class="col-sm-6"><input type="text" value="<%= per_hour_price%>" class="form-control" name="per_hour_price"/><br></div></div>
                                                    
                                                    <div class="form-group"><label class="col-sm-6">Latitude:</label>
                                                        <div class="col-sm-6"><input type="text" value="<%= latitude%>" class="form-control" name="latitude"/><br></div></div>
                                                        
                                                        <div class="form-group"><label class="col-sm-6">Longitude:</label>
                                                            <div class="col-sm-6"><input type="text" value="<%= longitude%>" class="form-control" name="longitude"/><br></div></div>
                                                            
                                                            <div class="form-group"><label class="col-sm-6">Description:</label>
                                                                <div class="col-sm-6"><input type="text" value="<%=description%>" class="form-control" name="description" /><br></div></div>
                                                            
                                                            <div class="col-sm-12"><input type="submit" value="Edit" name="bt" style="color:white;background-color: rgb(25,52,81) "/></div>

                                                            </center>
                                                        </div>
                                                    </div>
                                                            <%
                                                                }
                                                           %>
        </form> 
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
--%>


<%------------------------------------------- Code below is the original copy of the code ---------------------------------------%>


<%--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String email=request.getParameter("email");
          String phone=request.getParameter("phone");
            String website=request.getParameter("web");
            String php=request.getParameter("php");
            String sh=request.getParameter("sh");
            String eh=request.getParameter("eh");
            String des=request.getParameter("des");
            String scat=request.getParameter("scat");
            
            
              
            
            
            
            
            %>
        
        <%@include file="sp_header.jsp"%>
        
      <div class="container">
          <form action="update_service_provider.jsp">
              <center> <h1>Edit Your Details</h1></center><br>
           <div class="form-group">
                    <label class="col-sm-2">Email</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="email" value="<%= email%>"/></div></div><br><br>
                <div class="form-group">
                    <label class="col-sm-2">Phone</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="phone" value="<%= phone%>"/></div></div><br><br>
                <div class="form-group">
                    <label class="col-sm-2">Website</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="web" value="<%= website%>"/></div></div><br><br>
                    <div class="form-group">
                    <label class="col-sm-2">Enter Per-Hour-Price</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="php" value="<%= php%>"/></div></div><br><br>
             

                <div class="form-group">
                    <label class="col-sm-2">Enter Starting hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="sh" required>
                            <option><%= sh%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-2">Enter Ending hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="eh" required>
                            <option><%= eh%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br></div></div>
                 <div class="form-group">
                   <label class="col-sm-2">Enter Description</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="desc" value="<%= des%>" style="margin-bottom: 20px"/></div></div>
                    <br><br>
                    <div class="form-group">
                    <label class="col-sm-2">Sub Category</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="scat" value="<%= scat%>" style="margin-bottom: 20px" readonly/></div></div><br><br>
                        
                      <center><input type="submit" value="Edit" class="btn btn-success" style="background: rgb(25,52,81);color:white"/></center>    
                   
               

          </form>
          
          
          
      </div>
               <%@include file="footer.jsp"%>
    </body>
</html>
--%>

<%-- This was the most recent working code, as of 4:45PM Jun 4.--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
           //String sp_email=request.getParameter("sp_email");
         //String email = (String) (session.getAttribute("email"));
         /*   String email=session.getAttribute("email").toString();
            String phone=session.getAttribute("phone").toString();
            String website=session.getAttribute("web").toString();
            String php=session.getAttribute("php").toString();
            String sh=session.getAttribute("sh").toString();
            String eh=session.getAttribute("eh").toString();
            String des=session.getAttribute("des").toString();
            String scat=session.getAttribute("scat").toString();
           */
              //String sp_email=request.getParameter("sp_email");
              //String email=request.getParameter("email");
              String sp_email=request.getParameter("sp_email");
              String phone=request.getParameter("phone");
              String website=request.getParameter("website");
              String per_hour_price=request.getParameter("per_hour_price");
              String starting_hour=request.getParameter("starting_hour");
              String ending_hour=request.getParameter("ending_hour");
              String description=request.getParameter("description");
              String sub_category=request.getParameter("sub_category"); 
              
             /* */
            
                 /* String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String website = rs.getString("website");
                    String per_hour_price = rs.getString("per_hour_price");
                    String starting_hour = rs.getString("starting_hour");
                    String ending_hour = rs.getString("ending_hour");
                    String description = rs.getString("description");
                    String sub_category = rs.getString("sub_category");
                    photo = rs.getString("photo");
                    String longitude = rs.getString("longitude");
                    String latitude = rs.getString("latitude"); */
              
            
            
            
            
            %>
        
        <%@include file="sp_header.jsp"%>
        
      <div class="container">
          <form action="update_service_provider.jsp">
            <center> <h1>Edit Your Details</h1></center><br>
            <div class="form-group">
                    <label class="col-sm-2">Email</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="email" value="<%= sp_email%>"/>
                    </div>
            </div><br><br>
              
           <div class="form-group">
                    <label class="col-sm-2">Phone</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="phone" value="<%= phone%>"/>
                    </div>
           </div><br><br>
              
                <div class="form-group">
                    <label class="col-sm-2">Website</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="website" value="<%= website%>"/>
                    </div>  
                </div><br><br>
                   
                <div class="form-group">
                    <label class="col-sm-2">Enter Per-Hour-Price</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="per_hour_price" value="<%= per_hour_price%>"/>
                    </div>
                    </div><br><br>
             

                <div class="form-group">
                    <label class="col-sm-2">Enter Starting hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="starting_hour" required>
                            <option><%= starting_hour%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br>
                    </div>
                </div>
                        
                <div class="form-group">
                    <label class="col-sm-2">Enter Ending hour</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="ending_hour" required>
                            <option><%= ending_hour%></option>
                            <%
                                for (int i = 1; i <= 24; i++) {
                            %>
                            <option><%=i%></option>
                            <%
                                }
                            %>
                        </select><br>
                    </div>
                </div>
                        
                 <div class="form-group">
                   <label class="col-sm-2">Enter Description</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="description" value="<%= description%>" style="margin-bottom: 20px"/>
                    </div>
                 </div>
                    
                    <br><br>
                    <div class="form-group">
                        <label class="col-sm-2">Sub Category</label>
                        <div class="col-sm-10"><input type="text" class="form-control" name="sub_category" value="<%= sub_category%>" style="margin-bottom: 20px" />
                        </div>
                    </div><br><br>
                        
                      <center><input type="submit" value="Edit" class="btn btn-success" style="background: rgb(25,52,81);color:white"/></center>    
          </form> 
      </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div><%@include file="footer.jsp"%></div>
                    
    </body>
</html>
