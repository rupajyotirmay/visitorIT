/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class sendmail extends HttpServlet {
  
public class SendMail extends HttpServlet {  
public void doGet(HttpServletRequest request,  
 HttpServletResponse response)  
    throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
      
    String to=request.getParameter("to");  
    String subject=request.getParameter("subject");  
    String msg=request.getParameter("msg");  
          
    mailer.send(to, subject, msg);  
    out.print("message has been sent successfully");  
    out.close();  
    }  
}}
