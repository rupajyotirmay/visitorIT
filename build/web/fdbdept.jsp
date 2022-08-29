<%-- 
    Document   : fdbdept
    Created on : 3 Mar, 2022, 12:57:44 PM
    Author     : Dell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"  %>
<%@page import="java.sql.*" %>

         <%
             String dept=request.getParameter("dept");
            String sbj=request.getParameter("sbj");
            String uid=(String)session.getAttribute("uid");
    try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            PreparedStatement ps=con.prepareStatement("select *from login where aid=?");
            ps.setString(1,uid);    
            ResultSet rs = ps.executeQuery(); %>
    
         <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Feedback</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
body {  background-color:lightblue;}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: gray;
   color: white;
   text-align: center;
   font-size: 16px;
}
button{
    height: 50px;
    width: 125px;
}
label{
    font-size: 23Px;
   
}
.imgedit{
    width:100px;
    height: 100px;
    border-radius: 50%;
}
.btnedit{
    width: 150px;
    height: 150Px;
    border-radius: 5%;
    backface-visibility: 70%;
    background-color: lightblue;
    text-height: 16px;
   
}
</style>
</head>
<body>
    <div class="container">
	<nav  class="navbar navbar-default">
	<div class="container-fluid"><div class="navbar-header">        
      <img src = "FolderImage/itclog.png" style="width:150px; " ></li> 
      </div><h1>Grievance Redressal System ( शिकायत निवारण पोर्टल )</h1>  
	<ul class="nav navbar-nav navbar-right">
        <li><span class="glyphicon glyphicon-user"></span> 
                <% while(rs.next()){out.println(rs.getString(4));}%> </a></li>
	<li><a href="index.html"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
	</ul>
	      
	</div>
	</nav> 
</div>     
    
    <div class="container">
        <center>  <h3> For Complaint Filter</h3></br>
                </center> 
               
       <%} catch(Exception ex)
            {
            out.println(ex.toString());
            }
            
        %> 
        
        
<form class="form-inline" action="fdbsbj.jsp" method="post">
    <div class="col-sm-1"> </div>
<div class="col-sm-2">
     <button type="submit" name="sbj" value="Ambulance"class="btnedit"><img src = "FolderImage/amb.png" class="imgedit"></br>  Ambulance </button>
 </div>
<div class="col-sm-2">  
     <button type="submit" name="sbj" value="Working_Environment" back class="btnedit" ><img src = "FolderImage/worken_ew.png" class="imgedit" ></br> Working Environment </button> </div>
<div class="col-sm-2">    
    <button type="submit" name="sbj"value="Wages"class="btnedit"><img src = "FolderImage/wages_new.png" class="imgedit"> </br> Wages </button>
 </div> 
<div class="col-sm-2">
     <button type="submit" name="sbj"value="Infrastructure" class="btnedit"><img src = "FolderImage/infra_new.png" class="imgedit"> </br>Infrastructure </button>
 </div> <div class="col-sm-2">
    <button type="submit" name="sbj"value="Canteen" class="btnedit"><img src = "FolderImage/canteen.png" class="imgedit"></br> Canteen </button>
 </div> 
</form>
        </div>
    
<div class="footer">
    <p>All CopyRight &COPY; Reserved for Grievance Redressal System ( शिकायत निवारण पोर्टल ),ITC MGR</p>
</div>
</body>
</html>





