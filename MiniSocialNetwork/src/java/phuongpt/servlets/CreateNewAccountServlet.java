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
import javax.mail.MessagingException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuongpt.user.UserCreateNewError;
import phuongpt.user.UserDAO;
import phuongpt.utils.MyUtils;

/**
 *
 * @author PhuongPT
 */
@WebServlet(name = "CreateNewAccountServlet", urlPatterns = {"/CreateNewAccountServlet"})
public class CreateNewAccountServlet extends HttpServlet {

    private final String ERROR_PAGE = "createNewAccount.jsp";
    private final String VERTIFY_PAGE = "vertify.jsp";

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
        String url = ERROR_PAGE;

        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String name = request.getParameter("txtName");

        boolean foundErr = false;

        UserCreateNewError errs = new UserCreateNewError();
        String emailRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

        try {
            //Check user errors
            if (email.trim().length() == 0 || password.trim().length() == 0
                    || name.trim().length() == 0 || confirm.trim().length() == 0) {
                foundErr = true;
                errs.setEmptyInputErr("Inputs are required");
            } else {
                if (email.trim().length() < 6 || email.trim().length() > 50) {
                    foundErr = true;
                    errs.setEmailLengthErr("Email requires input value length from 6 to 50 chars");
                } else if (!email.matches(emailRegex)) {
                    foundErr = true;
                    errs.setEmailWrongFormatErr("Invalid Email");
                }

                if (password.trim().length() < 6 || password.trim().length() > 30) {
                    foundErr = true;
                    errs.setPasswordLengthErr("Password requires input value length from 6 to 30 chars");
                } else if (!confirm.trim().equals(password.trim())) {
                    foundErr = true;
                    errs.setConfirmNotMatched("Confirm must match password");
                }

                if (name.trim().length() < 6 || name.trim().length() > 50) {
                    foundErr = true;
                    errs.setFullNameLengthErr("Full name requires input value length from 6 to 50 chars");
                }
            }

            if (foundErr) {
                request.setAttribute("CREATE_ERROR", errs);
                System.out.println(errs);
            } else {
                UserDAO dao = new UserDAO();
                String code = MyUtils.getRandomCode();
                boolean result = dao.createAccount(email,
                        MyUtils.encryptPassword(password),
                        name, "member", code);

                if (result) {
                    url = VERTIFY_PAGE;
                    request.setAttribute("EMAIL", email);
                }//end if result
            }
        } catch (SQLException ex) {
            String msg = ex.getMessage();
            log("CreateNewAccountServlet _ SQL " + msg);
            if (msg.contains("duplicate")) {
                errs.setEmailIsExisted("Email is existed!!!");
                request.setAttribute("CREATE_ERROR", errs);
            }//end if msg
        } catch (NamingException ex) {
            log("CreateNewAccountServlet _ Naming " + ex.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            log("CreateNewAccountServlet _ Encrypt " + ex.getMessage());
        } catch (MessagingException ex) {
            log("CreateNewAccountServlet _ Messaging " + ex.getMessage());
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
