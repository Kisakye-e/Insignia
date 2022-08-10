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
public class cookiedisplay extends HttpServlet {

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
         PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String myname = (String)session.getAttribute("Name");
            Cookie[] cookies = request.getCookies();
            for(int i=0;i<cookies.length;i++){
//                out.println(cookies[i].getName());
                if( cookies[i].getName().equals(myname) ){
                                try{
            Class.forName("com.mysql.jdbc.Driver");
            //connecton
            try{
                
               Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/mark", "root", "");
               //insert
               Statement so = con.createStatement();
               ResultSet rs = so.executeQuery("select * from shop"); 
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
               }
            out.println("</table>");
            }catch(SQLException e){
                out.println("Sql Error: " + e.getMessage());
            
            }
            
            }catch(ClassNotFoundException e){
            out.println("Error: " + e.getMessage());
            }
                    
               }// else 
//                {
//                    out.println("Cookie not found");
//                }
            }
            
            
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet cookiedisplay</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet cookiedisplay at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        
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
