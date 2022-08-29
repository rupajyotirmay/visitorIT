/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;
import java.lang.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;  

public class addaudit extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            //1 String choosedone="";
            String done[]=request.getParameterValues("done");
            HttpSession session=request.getSession(); 
            String hrid=(String)session.getAttribute("uid");                
        try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");  
        PreparedStatement ps=con.prepareStatement("select *from login where aid=?");
            ps.setString(1,hrid);    
            ResultSet rs = ps.executeQuery();
            rs.next();
            String unm=rs.getString("nm");
        Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/FS","FS","sys@123");          
        PreparedStatement ps1=con1.prepareStatement("insert into audit(cpid,adtby) values(?,?)");
        for(int i=0;i<done.length;i++)
        {ps1.setString(1, done[i].trim());ps1.setString(2, unm);ps1.executeUpdate();
       // out.print(done[i]);
//       StringBuilder sb= new StringBuilder();
//       for(int i=0;i<done.length;i++){
//       if(i==(done.length-1))
//       }
               // choosedone+=done[i]+" ";  
           //1 st.executeUpdate("insert into audit(cpid,adtby) values('"+done[i]+"','"+unm+"')");    
        }   
        response.sendRedirect("fdbdept.jsp");
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
