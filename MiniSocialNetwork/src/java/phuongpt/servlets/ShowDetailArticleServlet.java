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
import phuongpt.comment.CommentDAO;
import phuongpt.comment.CommentDTO;
import phuongpt.emotion.EmotionDAO;
import phuongpt.user.UserDTO;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "ShowDetailArticleServlet", urlPatterns = {"/ShowDetailArticleServlet"})
public class ShowDetailArticleServlet extends HttpServlet {

    private final String SHOW_DETAIL_PAGE = "showArticleDetail.jsp";

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
        String url = SHOW_DETAIL_PAGE;
        String postID = request.getParameter("txtPostID");
        String searchValue = request.getParameter("txtSearchValue");
        String back = request.getParameter("back");
        String page = request.getParameter("page");
        try {
            ArticleDAO dao = new ArticleDAO();
            ArticleDTO dto = dao.findArticleById(postID);
            if (dto != null) {

                CommentDAO cmtDAO = new CommentDAO();
                cmtDAO.findListComments(postID);
                List<CommentDTO> listComment = cmtDAO.getListComments();

                EmotionDAO emotionDAO = new EmotionDAO();
                int dislike = emotionDAO.countDislikes(postID);
                int like = emotionDAO.countLikes(postID);

                HttpSession session = request.getSession();
                UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
                String email = userDTO.getEmail();
                String emotion = emotionDAO.getEmotion(postID, email);
                if (emotion.equals("like")) {
                    session.setAttribute("CALL", "like");
                } else if (emotion.equals("dislike")) {
                    session.setAttribute("CALL", "dislike");
                } else {
                    session.setAttribute("CALL", "no emotion");
                }

                request.setAttribute("DETAIL_DTO", dto);
                request.setAttribute("SEARCH_VALUE", searchValue);
                request.setAttribute("BACK_TO_MY_POST", back);
                request.setAttribute("CURRENT_PAGE", page);
                request.setAttribute("LIST_COMMENT", listComment);
                request.setAttribute("DISLIKE", dislike);
                request.setAttribute("LIKE", like);
               
            }
        } catch (SQLException ex) {
            log("ShowDetailArticleServlet _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("ShowDetailArticleServlet _ Naming " + ex.getMessage());
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
