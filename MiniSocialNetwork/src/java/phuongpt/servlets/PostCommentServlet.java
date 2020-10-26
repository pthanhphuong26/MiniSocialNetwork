/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuongpt.comment.CommentDAO;
import phuongpt.notifies.NotifiesDAO;
import phuongpt.notifies.NotifiesDTO;
import phuongpt.user.UserDTO;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "PostCommentServlet", urlPatterns = {"/PostCommentServlet"})
public class PostCommentServlet extends HttpServlet {

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
        String url = "";
        try {
            String comment = request.getParameter("txtComment");
            String postID = request.getParameter("txtPostID");
            String searchValue = request.getParameter("txtSearchValue");
            String back = request.getParameter("back");
            String page = request.getParameter("page");

            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            String email = userDTO.getEmail();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();

            CommentDAO commentDAO = new CommentDAO();

            if (comment.trim().length() > 0) {

                boolean result = commentDAO.addComment(postID, email, comment, sdf.format(date));
                //Set notification
                NotifiesDAO notifiesDAO = new NotifiesDAO();
                if (notifiesDAO.addNotifies(postID, email, sdf.format(date), "comment")) {
                    notifiesDAO.getNotifies(email);
                    List<NotifiesDTO> listNotifiesDTO = notifiesDAO.getListNotifies();
                    session.setAttribute("LIST_NOTIFIES", listNotifiesDTO);
                }
            }
            url = "DispatchController"
                    + "?btAction=Show details"
                    + "&txtPostID=" + postID
                    + "&txtSearchValue=" + searchValue
                    + "&page=" + page
                    + "&back=" + back;
        } catch (SQLException ex) {
            log("PostCommentServlet _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("PostCommentServlet _ Naming " + ex.getMessage());
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
