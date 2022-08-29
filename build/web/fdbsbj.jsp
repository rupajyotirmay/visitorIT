<%-- 
    Document   : fdbsbj
    Created on : 4 Mar, 2022, 10:31:52 AM
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
   .green{background-color: lightcyan;}
}
</style>
    </head> <body>
<div class="container">
	<nav  class="navbar navbar-default">
	<div class="container-fluid"><div class="navbar-header">        
      <img src = "FolderImage/itclog.png" style="width:150px; " ></li> 
      </div><h1>Grievance Redressal System</h1>
	<ul class="nav navbar-nav navbar-right">
        <li><a onclick="window.print()"><span class="glyphicon glyphicon-print"></span> Print </a></li>
        <li><a href="fdbdept.jsp"><span class="glyphicon glyphicon-log-in"></span> Go Back </a></li>
	<li><a href="index.html"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
	</ul>
	      
	</div>
	</nav> 
</div>  
<div class="container">    
            <center> <%String sbj = request.getParameter("sbj"); %>
            <h1><% out.println(sbj);  %> Related Complain</h1>
             </center>
        <table class="table table-bordered" padding="1px">
        <thead>
         <tr><th>Status</th><th>Complaint Id</th><th>Date</th><th>Employee ID</th><th>Department</th><th>Complain</th>
         </tr>
        </thead>
        <tbody>
        <%
            String uid=(String)session.getAttribute("uid");
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            Connection con1=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            Statement ps=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            Statement ps1=con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String st1;
            String st2;
     
            ResultSet rs,rs1;
            switch(uid)
            {
             case "1":
                rs = ps.executeQuery("select * from complain where sbj='"+sbj+"' and dept in('PMD','CTO','Printing')");
               %> <form action="./addaudit" method="post">
                <%rs.afterLast();
                while(rs.previous()){rs1= ps1.executeQuery("select * from audit where cpid='"+rs.getString(1)+"'"); %>
                <tr><% if(rs1.next()){%><td class="success">Close &check;</td><%}else{%>
                <td class="danger"><input type="checkbox" onclick="chkRow" name="done" value="<%out.println(rs.getString(1));}%>"> </td>
    <td><%out.println(rs.getString(1));%></td><td><%out.println(rs.getString(6));%></td>
    <td><%out.println(rs.getString(8));%></td><td><%out.println(rs.getString(2));%></td>
    <td><a href="<%out.println(rs.getString(7));%>"><%out.println(rs.getString(4));%></a></td>
                </tr>  
                <%}%><button type="submit" class="btn btn-primary">Done</button></form>
             <% rs.close();break;
             case "2":
                rs = ps.executeQuery("select * from complain where sbj='"+sbj+"' and dept in('Engineering','Canteen','Ambulance')"); 
                %> <form action="./addaudit" method="post">
                <%rs.afterLast();
                while(rs.previous()){rs1= ps1.executeQuery("select * from audit where cpid='"+rs.getString(1)+"'"); %>
                <tr><% if(rs1.next()){%><td class="success">Close &check; </td> <%}else{%>
                <td class="danger"><input type="checkbox" onclick="chkRow" name="done" value="<%out.println(rs.getString(1));}%>"> </td>
    <td><%out.println(rs.getString(1));%></td><td><%out.println(rs.getString(6));%></td><td><%out.println(rs.getString(8));%></td>
    <td><%out.println(rs.getString(2));%></td><td><%out.println(rs.getString(4));%></td>
                </tr>  
                <%}%><button type="submit" class="btn btn-primary">Done</button></form>
             <% rs.close();break;
             case "3":
             rs = ps.executeQuery("select * from complain where sbj='"+sbj+"' and dept in('SMD','Warehouse','SlideMaking')");
               %>
                <form action="./addaudit" method="post">
                <%rs.afterLast();
                while(rs.previous()){rs1= ps1.executeQuery("select * from audit where cpid='"+rs.getString(1)+"'"); %>
                <tr><% if(rs1.next()){%><td class="success"> Close &check;</td><%}else{%>
                <td class="danger"><input type="checkbox" onclick="chkRow" name="done" value="<%out.println(rs.getString(1));}%>"> </td>
    <td><%out.println(rs.getString(1));%></td><td><%out.println(rs.getString(6));%></td>
    <td><%out.println(rs.getString(8));%></td><td><%out.println(rs.getString(2));%></td>
    <td><a href="<%out.println(rs.getString(7));%>"><%out.println(rs.getString(4));%></a></td>
                </tr>  
                <%}%><button type="submit" class="btn btn-primary">Done</button></form>
             <% rs.close();break;
             case "4":             
             rs = ps.executeQuery("select COMPLAIN.* from COMPLAIN where SBJ='"+sbj+"' and DEPT in ('PMD','CTO','Printing','SMD','Warehouse','SlideMaking','Engineering','Canteen','Ambulance')");
              %> <form action="./addaudit" method="post">
                <%rs.afterLast();
                while(rs.previous()){rs1= ps1.executeQuery("select * from audit where cpid='"+rs.getString(1)+"'"); 
                %>
             <tr><% if(rs1.next()){%><td class="success">close &check;</td><%}else{%>
             <td class="danger">Pending &cross;</td><%}%>
             <td><%out.println(rs.getString(1));%></td><td><%out.println(rs.getString(6));%></td><td><%out.println(rs.getString(8));%></td>
             <td><%out.println(rs.getString(2));%></td><td><%out.println(rs.getString(4));%></td>
             </tr>
             <% } rs.close(); break;
            }con.close();con1.close();}
    catch(Exception ex)
            { out.println(ex.toString()); }
%>
         </tbody>
          </table>
</div>
<div class="footer">
    <p>All CopyRight &COPY; Reserved for Grievance Redressal System ( शिकायत निवारण पोर्टल ),ITC MGR</p>
</div>
<script type="text/javascript">
    $('input[name="chkRow"]').on('change',function(){$(this).closest('tr').toggleClass('green',$(this).is(':checked'))});  
</script>
</body>
</html>