<%--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="public_header.jsp"%>
        <div class="container" style="min-height: 523px">
            <center> <h1>Login</h1></center><br>
            <form class="form-horizontal" action="user_home.jsp" method="post">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="email" type="text" class="form-control" name="email" placeholder="Email" required>
                    </div>
                </div>
                <div class="form-group has-feedback">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="pass" placeholder="Password" required/>
                </div>
                </div>
                <center>  <input type="submit" value="Login" class="btn btn-success" style="background: #3e3d3d;color:white"/></center><br>
                <center>  <a href="user_forgotpassword1.jsp?">Forgot Password</a></center>
        </div>


    </form>
    <%
        String m = request.getParameter("msg");

        if (m != null) {

    %>  
    <label style="color: red"><%= m%></label>

    <%
        }

    %>
</div>
<%@include file="footer.jsp"%>
</body>

</html>
--%>



<%-- Code below is not original --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="public_header.jsp" %>
    <center>
        <label style="font-size: 40px; font-family:roboto;margin-top: 40px;color: #3e3d3d">User Login</label><br><br>
        <form action="user_checking.jsp" method="post" style="min-height: 405px"> <%-- replace with action="user_home.jsp"--%>
            <div class="container" >
                <div class="row" style="margin-top: 10px"><div class="col-sm-offset-3 col-sm-3" ><label style="font-size: 30px;font-family: roboto;color: #3e3d3d"><b>Enter Email</b></label></div> 
                    
                <div class="col-sm-5">
                    <div class="input-group">             
                <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                
                <input type="text" name="un" class="form-control" /><br></div></div></div>
                
                <div class="row"><div class="col-sm-offset-3 col-sm-3" >
                        <label style="font-size: 30px;font-family: roboto;color: #3e3d3d"><b>Enter Password</b></label></div>
               
                    <div class="col-sm-5">
                        <div class="input-group">             
                
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                
                            <input type="password" name="ps" class="form-control" /></div></div></div><br><br>
               
                <div class="row"><div class="col-sm-offset-4 col-sm-4">  <input type="submit" value="Login" class="btn btn-lg" style="background: #3e3d3d;color: white" /></div></div>
                <a href="user_forgotpassword1.jsp?" style="font-size: 20px;font-family: roboto">Forgot Password</a><br>
            </div>
            
        
        <% 
            String m=request.getParameter("msg");
            if(m!=null)
            {
              %> 
              <label style="color:red" ><%=m %></label>
              <%
            }
              %>
        </form>
    </center>
              <%@include file="footer.jsp" %>
    </body>
</html>

<%--sdfsdf--%>