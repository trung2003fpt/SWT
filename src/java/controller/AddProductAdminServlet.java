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
public class AddProductAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductAdminServlet at " + request.getContextPath() + "</h1>");
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
        List<Categories> cAdd = dao.getCategory();
        request.setAttribute("categories", cAdd);
        request.getRequestDispatcher("/view/admin/AddProduct.jsp").forward(request, response);
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

        // Lấy tham số đẩy từ yêu cầu từ quản trị viên khi submit form
        String namePAdd = request.getParameter("nameP");
        String quantityPAdd_raw = request.getParameter("quantityP");
        String pricePAdd_raw = request.getParameter("priceP");
        String imageAdd = request.getParameter("imageP");
        String descriptionPAdd = request.getParameter("descriptionP");
        String idCAdd_raw = request.getParameter("idC");

        // Biến để pare
        int quantityPAdd;
        int pricePAdd;
        int idCAdd;
        Categories c = new Categories();

        // Cách để xử lý thêm đường dẫn đúng (Hiện tại chỉ nghĩ ra cách này)
        // (TH: ảnh không có trong folder trong dự án thì sẽ không hiện ảnh)
        String pathImage = "image/" + imageAdd;

        // kiểm tra sản phẩm đã tồn tại hay chưa thì mới được thêm 
        Products existProduct = dao.existAddProductAdmin(namePAdd, pathImage, descriptionPAdd);
        if (existProduct != null && namePAdd.equals(existProduct.getNameP())
                || pathImage.equals(existProduct.getImage())
                || descriptionPAdd.equals(existProduct.getDescriptionP())) {
            request.setAttribute("AddP", "Sản phẩm đã tồn tại!");
        } else {
            try {
                quantityPAdd = Integer.parseInt(quantityPAdd_raw);
                pricePAdd = Integer.parseInt(pricePAdd_raw);
                idCAdd = Integer.parseInt(idCAdd_raw);
                c.setIdC(idCAdd);
                Products p = new Products(namePAdd, quantityPAdd, pricePAdd, descriptionPAdd, pathImage, c);
                dao.insertProduct(p);
                request.setAttribute("AddP", "Thêm sản phẩm thành công!");
            } catch (Exception e) {
                request.setAttribute("AddP", "Thêm sản phẩm chưa thành công!");
            }
        }

        List<Categories> cAdd = dao.getCategory();
        request.setAttribute("categories", cAdd);
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
