/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuongpt.article.ArticleDAO;
import phuongpt.article.ArticleDTO;
import phuongpt.user.UserDTO;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "ViewMyPostServlet", urlPatterns = {"/ViewMyPostServlet"})
public class ViewMyPostServlet extends HttpServlet {

    private final String MY_POST_PAGE = "myArticle.jsp";

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
        String url = MY_POST_PAGE;
        PrintWriter out = response.getWriter();
        String searchValue = request.getParameter("txtSearchValue");
        String pageStr = request.getParameter("page");
        try {

            HttpSession session = request.getSession(false);
            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            if (userDTO != null) {
                String email = userDTO.getEmail();
                ArticleDAO dao = new ArticleDAO();
                int page = 1;
                int recordsPerPage = 20;
                int noOfRecords = dao.countArticleFoundByEmail(email);
                int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                if (pageStr != null) {
                    page = Integer.parseInt(pageStr);
                }
                dao.showListArticlesByEmail(email, (page - 1) * recordsPerPage);

                List<ArticleDTO> result = dao.getListArticles();
                request.setAttribute("SEARCH_RESULT", result);
                request.setAttribute("CURRENT_PAGE", page);
                request.setAttribute("NO_OF_PAGES", noOfPages);
                request.setAttribute("BACK_TO_MY_POST", "back to my post");
                request.setAttribute("SEARCH_VALUE", searchValue);

                String successMsg = (String) request.getAttribute("DELETE_SUCCESS");
                String failMsg = (String) request.getAttribute("DELETE_FAIL");
                if (successMsg != null || failMsg != null) {
                    request.setAttribute("DELETE_SUCCESS", successMsg);
                    request.setAttribute("DELETE_FAIL", failMsg);
                }
            }

        } catch (SQLException ex) {
            log("ShowArticleListServlet _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("ShowArticleListServlet _ Naming " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
