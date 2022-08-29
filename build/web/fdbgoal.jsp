<%-- 
    Document   : fdbgoal
    Created on : 4 Mar, 2022, 10:35:10 AM
    Author     : Dell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"  %>
<%@page import="java.sql.*" %>
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
body {  background-color: lightblue;}

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
</style>
</head> 
<body>
<div class="container">
	<nav  class="navbar navbar-default">
	<div class="container-fluid"><div class="navbar-header">        
      <img src = "FolderImage/itclog.png" style="width:100px; " ></li> 
      </div><h1>Grievance Redressal System( शिकायत निवारण पोर्टल )</h1>
	<ul class="nav navbar-nav navbar-right">
	<li><a href="index.html"><span class="glyphicon glyphicon-log-out"></span>बाहर निकलें /Go Back</a></li>
	</ul>
	
	</div>
	</nav> 
</div>  
<div class="container">
    <table>
         <% try{
           
        Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            PreparedStatement ps=con.prepareStatement("select cpid from audit where cpid like ?");
                String cpid=request.getParameter("cpid");
                ps.setString(1,cpid);  
                ResultSet rs = ps.executeQuery();       
        if(rs.next()) { %>
         <tr> <td class="success">आपकी शिकायत संख्या <%out.println( cpid );%> का समाधान हुआ हैं। Your Complaint ID <% out.println( cpid );%> has been resolve</td></tr>
           <%}else{%>
           <tr><td class="danger">आपकी शिकायत संख्या <%out.println( cpid );%> का समाधान नहीं हुआ हैं। Your Complaint ID <% out.println( cpid );%> has not been resolve</td></tr>
        <%}
            rs.close();con.close();
   }
    catch(Exception ex)
            {
            out.println(ex.toString());
            }

                %>             
    </table> </div>
<div class="footer">
    <p>All CopyRight &COPY; Reserved for Grievance Redressal System ( शिकायत निवारण पोर्टल ),ITC MGR</p>
</div>
</body>
</html>

