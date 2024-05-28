/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import model.*;

/**
 *
 * @author nguye
 */
public class ContactServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = DAO.INSTANCE;
        List<Categories> categories = dao.getCategory();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/view/Contact.jsp").forward(request, response);
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
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = DAO.INSTANCE;
        List<Categories> categories = dao.getCategory();
        request.setAttribute("categories", categories);
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone_pare = request.getParameter("phoneNumber");
        String message = request.getParameter("message");
        int phone;
        
        if (email == null || email.isEmpty() || phone_pare == null || phone_pare.isEmpty()) {
            request.setAttribute("mess", "Vui lòng nhập đủ thông tin.");

            // khác email trả về false
        } else if (!isValidEmail(email)) {
            request.setAttribute("mess", "Email không hợp lệ.");

            // khác SĐT trả về false
        } else if (!isValidPhoneNumber(phone_pare)) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ.");
            
            // TH: kiểm tra hết sẽ thêm được liên hệ của khách hàng vô DB
        } else {
            try {
                phone = Integer.parseInt(phone_pare);
                Contact newContact = new Contact(fullName, email, phone, message);
                dao.insertContact(newContact);
                request.setAttribute("mess", "Cảm ơn bạn đã gửi liên hệ cho cửa hàng!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/view/Contact.jsp").forward(request, response);
    }

    public boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-z]+(\\.[a-z]+)?$";

        // true nếu mail hợp lệ với regex
        return email.matches(emailRegex);
    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        String phoneRegex = "\\d{10,11}";
        
         // true nếu SĐT hợp lệ với regex
        return phoneNumber.matches(phoneRegex);
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
