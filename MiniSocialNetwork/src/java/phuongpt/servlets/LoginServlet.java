/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
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
import phuongpt.notifies.NotifiesDAO;
import phuongpt.notifies.NotifiesDTO;
import phuongpt.user.UserDAO;
import phuongpt.user.UserDTO;
import phuongpt.utils.MyUtils;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String SEARCH_ARTICLE_CONTROLLER = "SearchArticleServlet";

    private final String LOGIN_PAGE = "login.jsp";

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
        String url = LOGIN_PAGE;

        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();

        try {
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("INVALID", "Inputs are required!!");
            } else {
                UserDTO result = dao.checkLogin(email,
                        MyUtils.encryptPassword(password));
                if (result != null) {
                    url = SEARCH_ARTICLE_CONTROLLER;
                    session.setAttribute("USER_DTO", result);
                    //Set notification
                    NotifiesDAO notifiesDAO = new NotifiesDAO();
                    notifiesDAO.getNotifies(email);
                    List<NotifiesDTO> listNotifiesDTO = notifiesDAO.getListNotifies();
                    if (listNotifiesDTO != null) {
                        session.setAttribute("LIST_NOTIFIES", listNotifiesDTO);
                    } else {
                        session.setAttribute("LIST_NOTIFIES", "None");
                    }
                } else { 
                    request.setAttribute("INVALID", "Invalid email or password!!");
                }

            }
        } catch (NoSuchAlgorithmException ex) {
            log("LoginServlet _ EncryptPassword " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoginServlet _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet _ Naming " + ex.getMessage());

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
