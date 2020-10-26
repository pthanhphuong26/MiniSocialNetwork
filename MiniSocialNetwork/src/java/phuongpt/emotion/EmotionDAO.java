/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.emotion;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import phuongpt.utils.DBHelper;

/**
 *
 * @author PhuongPT
 */
public class EmotionDAO implements Serializable {

    public int countLikes(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int likes = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(postID) as num "
                        + "From tblEmotion "
                        + "Where postID = ? and statusID = 'S0001' and emotion = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, "like");
                rs = stm.executeQuery();
                if (rs.next()) {
                    likes = rs.getInt("num");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return likes;
    }
    
    public int countDislikes(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int dislikes = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(postID) as num "
                        + "From tblEmotion "
                        + "Where postID = ? and statusID = 'S0001' and emotion = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, "dislike");
                rs = stm.executeQuery();
                if (rs.next()) {
                    dislikes = rs.getInt("num");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dislikes;
    }
    
    public boolean deleteEmotion(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblEmotion SET statusID = 'S0003' WHERE postID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean deleteLikeAndDislike(String postID, String email)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "DELETE FROM tblEmotion "
                        + "WHERE statusID = 'S0001' AND postID = ? AND email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean addLikeAndDislike(String postID, String email, String emotion, String date)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblEmotion (postID, email, emotion, date, statusID) "
                        + "values (?, ?, ?, ?, 'S0001')";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                stm.setString(3, emotion);
                stm.setString(4, date);
                
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
  
    public String getEmotion(String postID, String email)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String emotion = "";
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select emotion "
                        + "From tblEmotion "
                        + "Where postID = ? and statusID = 'S0001' and email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    emotion = rs.getString("emotion");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return emotion;
    }
}
