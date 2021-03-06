/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "DispatchController", urlPatterns = {"/DispatchController"})
public class DispatchController extends HttpServlet {
    private final String LOGIN_PAGE = "login.jsp";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String LOGOUT_CONTROLLER = "LogoutServlet";
    private final String CREATE_NEW_ACCOUNT_CONTROLLER = "CreateNewAccountServlet";
    private final String SEARCH_ARTICLE_CONTROLLER = "SearchArticleServlet";
    private final String SHOW_ARTICLE_DETAIL_CONTROLLER = "ShowDetailArticleServlet";
    private final String POST_COMMENT_CONTROLLER = "PostCommentServlet";
    private final String POST_ARTICLE_CONTROLLER = "PostNewArticleServlet";
    private final String VIEW_MY_POST_CONTROLLER = "ViewMyPostServlet";
    private final String DELETE_POST_CONTROLLER = "DeletePostServlet";
    private final String ACTIVATE_ACCOUNT_CONTROLLER = "ActivateAccountServlet";
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
        String button = request.getParameter("btAction");
        
        String url = LOGIN_PAGE;
        try {
            if(button == null) {
               
            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Logout")) {
                url = LOGOUT_CONTROLLER;
            } else if (button.equals("Sign Up")) {
                url = CREATE_NEW_ACCOUNT_CONTROLLER;
            } else if (button.equals("Search") || button.equals("Back Search")) {
                url = SEARCH_ARTICLE_CONTROLLER;
            } else if (button.equals("Show details")) {
                url = SHOW_ARTICLE_DETAIL_CONTROLLER;
            } else if (button.equals("Comment")) {
                url = POST_COMMENT_CONTROLLER;
            } else if (button.equals("Save article")) {
                url = POST_ARTICLE_CONTROLLER;                
            } else if (button.equals("My Post") || button.equals("Back My Post")) {
                url = VIEW_MY_POST_CONTROLLER;
            } else if (button.equals("Delete")) {
                url = DELETE_POST_CONTROLLER;
            } else if (button.equals("Activate")) {
                url = ACTIVATE_ACCOUNT_CONTROLLER;
            } 
            
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
