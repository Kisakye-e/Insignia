/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ayiko;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class Session extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            HttpSession session = request.getSession();
            session.setAttribute("Name", name);
            String myName = (String)session.getAttribute("Name");
            Cookie c = new Cookie(myName ,"see");
            c.setMaxAge(1800);
            response.addCookie(c);
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            //connecton
            try{
                
               Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/mark", "root", "");
               //insert
               Statement so = con.createStatement();
               ResultSet rs = so.executeQuery("select * from shop where id = '"+myName+"'"); 
            out.println("<table>"
                       + "<tr>"
                       + "<th>LastName</th>"
                       + "<th>FirstName</th>"
                       + "<th>PhoneNumber</th>"
                       + "<th>Username</th>"
                       + "<th>Action</th>"
                       + "</tr>");
               while(rs.next()){
                   
                    out.println( "<tr>"                     
                       + "<td>"+ rs.getString("LastName")+"</td>"
                       + "<td>"+ rs.getString("FirstName")+"</td>"
                       + "<td>"+ rs.getString("PhoneNumber")+"</td>"
                       + "<td>"+ rs.getString("Username")+"</td>"
                       + "<td>"+ rs.getString("id")+"</td>"
                       + "</tr>");
                     out.println();
                     String id =  rs.getString("id");
                     session.setAttribute("new", id);
                    String e = (String)session.getAttribute("new");
                    out.println(e);
               }
            out.println("</table>");
           
            }catch(SQLException e){
                out.println("Sql Error: " + e.getMessage());
            
            }
            
            }catch(ClassNotFoundException e){
            out.println("Error: " + e.getMessage());
            }
         
            out.println("Click here to see your cookies <a href='/Prac/cookiedisplay'>Cookie</a>");
    
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
