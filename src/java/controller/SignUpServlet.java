package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.*;

/**
 *
 * @author nguye
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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

        // Xóa đi session cho thông báo lỗi đăng ký
        HttpSession httpSession = request.getSession();
        if (httpSession != null) {
            httpSession.removeAttribute("err");
        }
        response.sendRedirect(request.getContextPath() + "/view/SignUp.jsp");
//        request.getRequestDispatcher("/view/SignUp.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String confirmPass = request.getParameter("confirmPass");
        HttpSession httpSession = request.getSession();

        // kiểm tra email, tên tài khoản để là Unique
        if (dao.emailExists(email) || dao.nameAExists(name)) {
            httpSession.setAttribute("err", "Email hoặc tên tài khoản đã tồn tại!");
            response.sendRedirect(request.getContextPath() + "/view/SignUp.jsp");
            return;
        }

        // kiểm tra xác nhận lại mật khẩu
        if (!password.equals(confirmPass)) {
//            request.setAttribute("err", "Xác nhận mật khẩu bị sai");
//            request.getRequestDispatcher("/view/SignUp.jsp").forward(request, response);
            httpSession.setAttribute("err", "Xác nhận mật khẩu bị sai!");
            response.sendRedirect(request.getContextPath() + "/view/SignUp.jsp");
            return;
        }

//        // xóa session của thông báo lỗi đăng ký
//        if (httpSession != null) {
//            httpSession.removeAttribute("err");
//        }

        int idR = dao.getDefaultRoleId();
        if (idR != -1) {
            Accounts newAccount = new Accounts(email, name, password, new Roles(idR, "user"));
            dao.insertAccount(newAccount);
            httpSession.setAttribute("name", name);
            response.sendRedirect(request.getContextPath() + "/default");
        }
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
