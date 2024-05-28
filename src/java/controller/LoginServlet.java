package controller;

import dal.*;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
//        request.getRequestDispatcher("view/Login.jsp").forward(request, response);
        HttpSession httpSession = request.getSession();
        if (httpSession != null) {
            httpSession.removeAttribute("err");
        }
        response.sendRedirect(request.getContextPath() + "/view/Login.jsp");
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
        HttpSession httpSession = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String password = request.getParameter("pass");
        DAOImplement dao = DAOImplement.INSTANCE;
        Accounts a = dao.getAccount(name, password);
        if (a != null && name.equals(a.getNameA()) && password.equals(a.getPasswordA())) {
            httpSession.setAttribute("name", name);
            if (a.getIdR() != null) {
                int roleId = a.getIdR().getIdR();
                httpSession.setAttribute("role", roleId);
                if (roleId == 0) {
                    response.sendRedirect(request.getContextPath() + "/homeadmin");
                } else if (roleId == 1) {
                    response.sendRedirect(request.getContextPath() + "/default");
                }
            } else {
//            request.setAttribute("error", "Tên tài khoản hoặc mật khẩu bạn không đ    úng");
                httpSession.setAttribute("err", "Tên tài khoản hoặc mật khẩu không đúng!");
//            request.getRequestDispatcher("/view/Login.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/view/Login.jsp");
            }
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
