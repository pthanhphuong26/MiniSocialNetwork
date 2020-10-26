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
import phuongpt.emotion.EmotionDAO;
import phuongpt.notifies.NotifiesDAO;
import phuongpt.notifies.NotifiesDTO;
import phuongpt.user.UserDTO;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "PostEmotionServlet", urlPatterns = {"/PostEmotionServlet"})
public class PostEmotionServlet extends HttpServlet {

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
        String url = "";
        String button = request.getParameter("btAction");

        try {
            EmotionDAO emotionDAO = new EmotionDAO();
            HttpSession session = request.getSession();

            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            String email = userDTO.getEmail();

            String postID = request.getParameter("postID");
            String searchValue = request.getParameter("txtSearchValue");
            String back = request.getParameter("back");
            String page = request.getParameter("page");
            String emotion = "";

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();

            String call = (String) session.getAttribute("CALL");
            if (call.equals("like")) {
                if (button.equals("Like")) {
                    emotionDAO.deleteLikeAndDislike(postID, email);
                    session.setAttribute("CALL", "no emotion");
                } else if (button.equals("Undislike")) {
                    emotionDAO.deleteLikeAndDislike(postID, email);
                    emotionDAO.addLikeAndDislike(postID, email, "dislike", sdf.format(date));
                    session.setAttribute("CALL", "dislike");
                    emotion = "dislike";
                }
            } else if (call.equals("dislike")) {
                if (button.equals("Unlike")) {
                    emotionDAO.deleteLikeAndDislike(postID, email);
                    emotionDAO.addLikeAndDislike(postID, email, "like", sdf.format(date));
                    session.setAttribute("CALL", "like");
                    emotion = "like";
                } else if (button.equals("Dislike")) {
                    emotionDAO.deleteLikeAndDislike(postID, email);
                    session.setAttribute("CALL", "no emotion");
                }
            } else {
                if (button.equals("Unlike")) {
                    emotionDAO.addLikeAndDislike(postID, email, "like", sdf.format(date));
                    session.setAttribute("CALL", "like");
                    emotion = "like";
                } else if (button.equals("Undislike")) {
                    emotionDAO.addLikeAndDislike(postID, email, "dislike", sdf.format(date));
                    session.setAttribute("CALL", "dislike");
                    emotion = "dislike";
                }
            }
            //Set notification
            NotifiesDAO notifiesDAO = new NotifiesDAO();
            if (notifiesDAO.addNotifies(postID, email, sdf.format(date), emotion)) {
                notifiesDAO.getNotifies(email);
                List<NotifiesDTO> listNotifiesDTO = notifiesDAO.getListNotifies();
                session.setAttribute("LIST_NOTIFIES", listNotifiesDTO);
            }

            url = "DispatchController"
                    + "?btAction=Show details"
                    + "&txtPostID=" + postID
                    + "&txtSearchValue=" + searchValue
                    + "&page=" + page
                    + "&back=" + back;
        } catch (SQLException ex) {
            log("PostEmotionServlet _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("PostEmotionServlet _ Naming " + ex.getMessage());
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
