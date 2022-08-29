/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class addcomfeed extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String dept=request.getParameter("dept");
            String sbj=request.getParameter("sbj");
                       
            String fdb=request.getParameter("fdb");
            String img=request.getParameter("img");
            String empid=request.getParameter("empid");
               
            Calendar cld=Calendar.getInstance();
            java.util.Date crtDt=cld.getTime();
            java.sql.Date dt=new java.sql.Date(crtDt.getTime());
            
            try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            PreparedStatement ps=con.prepareStatement("insert into complain(dept,sbj,fdb,date,empid) values(?,?,?,?,?)");
            ps.setString(1,dept);
            ps.setString(2,sbj);
            ps.setString(3,fdb);
            ps.setDate(4,dt);
            ps.setString(5,empid);
            //ps.setString(6,img);
            ps.executeUpdate();

            con.close();
            Connection con1=DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");
            
            Statement ps1=con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps1.executeQuery("SELECT * FROM complain ");
                   rs.afterLast();
                  while(rs.previous()) {
                     
                    out.println("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
"         <title>Feedback</title>\n" +
"  <meta charset=\"utf-8\">\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n" +
"  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n" +
"  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n" +
"  <style>"
                            + "body {  background-color: lightblue;}\n" +
                    "\n" +
                    ".footer {\n" +
                    "   position: fixed;\n" +
                    "   left: 0;\n" +
                    "   bottom: 0;\n" +
                    "   width: 100%;\n" +
                    "   background-color: gray;\n" +
                    "   color: white;\n" +
                    "   text-align: center;\n" +
                    "   font-size: 16px;\n" +
                    "}\n" +
                    "</style>\n" 
                            + "</head>\n"
                                +"<body>"+                                        
                "<div class=\"container\">\n" +
                "	<nav  class=\"navbar navbar-default\">\n" +
                "	<div class=\"container-fluid\"><div class=\"navbar-header\">        \n" +
                "      <img src = \"FolderImage/itclog.png\" style=\"width:100px; \" ></li> \n" +
                "      </div><h1>Employee Feedback System</h1>\n" +
                "	<ul class=\"nav navbar-nav navbar-right\">\n" +
                "	<li><a href=\"index.html\"><span class=\"glyphicon glyphicon-log-out\"></span>बाहर निकलें /Go Back</a></li>\n" +
                "	</ul>\n" +
                "	\n" +
                "	</div>\n" +
                "	</nav> \n"
              + "<P>अपनी शिकायत पर नजर रखने के लिए कृपया आपना कम्प्लेंट आईडी सहेज -- " +rs.getString("cmpid")+ " -- is Your Complaint Id. Keep It for tracking your complaint')"
                              +"  </p>" +
                "<a href=\"index.html\"><span class=\"glyphicon glyphicon-log-out\"></span> Go Back / बाहर निकलें </a></li></div> "
                                                        + "<div class=\"footer\">\n" +
                                "    <p>All CopyRight &COPY; Reserved for Employee Feedback Management System(ITC)</p>\n" +
                                "</div></body></html>");
////
//                    <script>\n"
//                                +"alert('अपनी शिकायत पर नजर रखने के लिए कृपया आपना कम्प्लेंट आईडी सहेज -- " +rs.getString("cmpid")+ " -- is Your Complaint Id. Keep It for tracking your complaint')"
//                                +"</script>"                 
                    break;
                  } 
                  con1.close();
            }
            catch(Exception ex)
            {
            out.println(ex.toString());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
