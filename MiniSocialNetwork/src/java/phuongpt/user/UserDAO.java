/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.user;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.NamingException;
import phuongpt.utils.DBHelper;
import phuongpt.utils.JavaMailUtils;

/**
 *
 * @author PhuongPT
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String email, String encryptPassword) 
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        
        try {
            con = DBHelper.makeConnection();
            String sql = "SELECT u.email, u.password, u.name, u.role, s.statusName "
                    + "FROM tblUser u " 
                    + "LEFT JOIN tblStatus s " 
                    + "ON u.statusID = s.statusID "
                    + "WHERE u.email = ? AND u.password = ? AND u.statusID = 'S0001'";
            
            stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, encryptPassword);
            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String role = rs.getString("role");
                String status = rs.getString("statusName");
                result = new UserDTO(email, encryptPassword, name, role, status);
            }
        } finally {
            if (rs != null)
                rs.close();
            if (stm != null)
                stm.close();
            if (con != null)
                con.close();
        }
        
        return result;
    }

    public boolean createAccount(String email, String password, 
            String name, String role, String verifyCode) 
            throws SQLException, NamingException, MessagingException, AddressException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblUser(email, name, password, role, statusID, verifyCode) "
                        + "VALUES(?, ?, ?, ?, 'S0002', ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, name);
                stm.setString(3, password);
                stm.setString(4, role);
                stm.setString(5, verifyCode);
                int row = stm.executeUpdate();
                
                if (row > 0) {
                    JavaMailUtils.sendMail(email, verifyCode);
                    return true;
                }
            }// end if con is not null
            
        } finally {
            if (stm != null)
                stm.close();
            if (con != null)
                con.close();
        }
        return false;
    }
    
    public boolean activateAccount(String email, String verifyCode) 
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblUser SET statusID = 'S0001' "
                        + "WHERE email = ? AND verifyCode = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, verifyCode);
                
                int row = stm.executeUpdate();
                
                if (row > 0) {
                    return true;
                }
            }// end if con is not null
            
        } finally {
            if (stm != null)
                stm.close();
            if (con != null)
                con.close();
        }
        return false;
    }
    
}
