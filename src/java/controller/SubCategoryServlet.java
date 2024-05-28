package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import model.*;
import dal.DAO;

/**
 *
 * @author nguye
 */
public class SubCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet SubCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubCategoryServlet at " + request.getContextPath() + "</h1>");
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
        DAO dao = DAO.INSTANCE;
        String cid_pare = request.getParameter("cid");

        int cid;
        boolean isValidateC = false;
        try {
            if (cid_pare != null && !cid_pare.isEmpty()) {
                cid = Integer.parseInt(cid_pare);
                List<Categories> categories = dao.getCategory();

                // Cách để khi khách hàng lỡ nhập số linh tinh trên thanh URL 
                // chạy vòng lặp để lấy data về cid trùng thì trả về true
                for (Categories c : categories) {
                    if (c.getIdC() == cid) {
                        isValidateC = true;
                        break;
                    }
                }

                // nếu trả về true thì sẽ đưa ra sản phẩm của danh mục đó
                if (isValidateC) {
                    request.setAttribute("categories", categories);
                    List<Products> products = dao.getProductsByCategoryId(cid);
                    request.setAttribute("product", products);
                    request.getRequestDispatcher("/view/Category.jsp").forward(request, response);

                    // còn false thì sẽ đưa khách hàng về trang Category.jsp
                } else {
                    response.sendRedirect(request.getContextPath() + "/category");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        response.sendRedirect(request.getContextPath() + "/category");
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
