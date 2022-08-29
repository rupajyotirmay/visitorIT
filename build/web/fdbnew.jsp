<%-- 
    Document   : cmp_entry
    Created on : 26 Feb, 2022, 7:33:10 PM
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
</style>
</head> 
<div class="container">
	<nav  class="navbar navbar-default">
	<div class="container-fluid"><div class="navbar-header">        
      <img src = "FolderImage/itclog.png" style="width:150px; " ></li> 
      </div><h1>Employee Feedback System</h1>
	<ul class="nav navbar-nav navbar-right">
        <li><a href="admin.html"><span class="glyphicon glyphicon-log-in"></span> Go Back </a></li>
	<li><a href="index.html"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
	</ul>
	      
	</div>
	</nav> 
</div>  
<div class="container">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"  %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
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
   text-decoration: whitesmoke;
}
</style>
</head>
<body>
<div class="container">
<nav  class="navbar navbar-default">           
  <div class="container-fluid">
    <div class="navbar-header">        
      <img src = "FolderImage/itclog.png" style="width:150px; " ></li> 
      </div><h1>Grievance Redressal System</h1>
      <ul class="nav navbar-nav navbar-right navbar-btn">           
	<li><a href="index.html"><span class="glyphicon glyphicon-log-out"></span> Go Back / बाहर निकलें </a></li>
          <a href="index.html">Go back></a>
      &nbsp;</ul>
  </div>
</nav>
    
<%  try
          {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con1=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            Statement ps1=con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = ps1.executeQuery("SELECT * FROM complain ");
                    rs.afterLast();
                    while(rs.previous()) {

                        out.println("<html><head>\n"
                                    +"<body><script>\n"
                                    +"alert('अपनी शिकायत पर नजर रखने के लिए कृपया आपना कम्प्लेंट आईडी सहेज -- " +rs.getString("cmpid")+ " -- is Your Complaint Id. Keep It for tracking your complaint')"
                                    +"</script></body></html>");
                                RequestDispatcher rd=request.getRequestDispatcher("fdbnew.jsp");                   
                                rd.forward(request,response);
                                }}
 
 
           
    catch(Exception ex)
            {
            out.println(ex.toString());
            }

%>
         </tbody>
          </table>
</div>
<div class="footer">
    <p>Grievance Redressal System</p>
</div>

</html>

