/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.comment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import phuongpt.utils.DBHelper;

/**
 *
 * @author PhuongPT
 */
public class CommentDAO implements Serializable {
    private List<CommentDTO> listComments;

    public List<CommentDTO> getListComments() {
        return listComments;
    }

    public void findListComments(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select ID, postID, c.email, comment, date, c.statusID, name "
                        + "From tblComment c, tblUser u "
                        + "Where postID = ? and c.statusID = 'S0001' And c.email = u.email "
                        + "ORDER BY date DESC";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String comment = rs.getString("comment");
                    String statusID = rs.getString("statusID");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
                    CommentDTO dto = new CommentDTO(id, postID, email, sdf.format(date), comment, statusID, name);
                    if (this.listComments == null) {
                        this.listComments = new ArrayList<>();
                    }
                    this.listComments.add(dto);
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
    }
    
    public boolean addComment(String postID, String email, String comment, String date)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into tblComment (postID, email, date, comment, statusID) "
                        + "values (?, ?, ?, ?, 'S0001')";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                stm.setString(3, date);
                stm.setString(4, comment);
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
    
    public boolean deleteComment(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblComment SET statusID = 'S0003' WHERE postID = ?";
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
    
}
