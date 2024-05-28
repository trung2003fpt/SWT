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
import java.sql.*;
import java.util.*;
import model.*;

/**
 *
 * @author nguye
 */
public class UpdateProductAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductAdminServlet at " + request.getContextPath() + "</h1>");
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
        String idP_raw = request.getParameter("pid");
        DAO dao = DAO.INSTANCE;
        int idP;
        try {
            idP = Integer.parseInt(idP_raw);
            List<Products> pUp = dao.getProductsByPid(idP);
            request.setAttribute("productUp", pUp);
            List<Categories> cUp = dao.getCategory();
            request.setAttribute("categoriesUp", cUp);
            request.getRequestDispatcher("/view/admin/UpdateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        DAO dao = DAO.INSTANCE;

        // Lấy tham số đẩy từ yêu cầu từ quản trị viên khi submit form
        String namePUp = request.getParameter("nameP");
        String quantityPUp_raw = request.getParameter("quantityP");
        String idCUp_raw = request.getParameter("idC");
        String pricePUp_raw = request.getParameter("priceP");
        String imageUp = request.getParameter("imageP");
        String descriptionPUp = request.getParameter("descriptionP");

        // Biến để pare
        int quantityPUp;
        int pricePUp;
        int idCUp;
        int idPUp;
        Categories c = new Categories();

        // kiểm tra sản phẩm đã tồn tại hay chưa thì mới được cập nhật
//        Products existProduct = dao.existUpProductAdmin(namePUp, descriptionPUp);
//        if (existProduct != null && namePUp.equals(existProduct.getNameP())
//                || descriptionPUp.equals(existProduct.getDescriptionP())) {
//            request.setAttribute("UpdateP", "Sản phẩm đã tồn tại!");
//        } else {
        try {
            idPUp = dao.getIdPbyNameP(namePUp);
            idCUp = Integer.parseInt(idCUp_raw);
            quantityPUp = Integer.parseInt(quantityPUp_raw);
            pricePUp = Integer.parseInt(pricePUp_raw);
            c.setIdC(idCUp);
            Products p = new Products(idPUp, namePUp, quantityPUp, pricePUp, descriptionPUp, imageUp, c);
            dao.updateProducts(p);
            request.setAttribute("UpdateP", "Bạn đã thay đổi sản phẩm thành công!");
        } catch (Exception e) {
            request.setAttribute("UpdateP", "Bạn chưa thay đổi sản phẩm thành công!");
        }
//        }
        List<Products> productsAdmin = dao.getAllProducts();
        request.setAttribute("pAdmin", productsAdmin);
        request.getRequestDispatcher("/view/admin/ProductManagement.jsp").forward(request, response);
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
