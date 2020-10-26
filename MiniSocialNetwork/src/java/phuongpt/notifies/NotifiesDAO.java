/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.notifies;

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
public class NotifiesDAO implements Serializable {

    private List<NotifiesDTO> listNotifies;

    public List<NotifiesDTO> getListNotifies() {
        return listNotifies;
    }

    public void getNotifies(String email)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT ID, title, n.email, n.date, n.type, n.postID, name "
                        + "FROM tblArticle a, tblNotifies n, tblUser u " 
                        + "WHERE a.email = ? AND NOT n.email = ? AND a.postID = n.postID AND n.email = u.email "
                        + "ORDER BY n.date DESC";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, email);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String postID = rs.getString("postID");
                    String type = rs.getString("type");
                    String title = rs.getString("title");
                    String name = rs.getString("name");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
                    NotifiesDTO dto = new NotifiesDTO(id, postID, email, type, sdf.format(date), title, name);
                    if (this.listNotifies == null) {
                        this.listNotifies = new ArrayList<>();
                    }
                    this.listNotifies.add(dto);
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

    public boolean addNotifies(String postID, String email, String date, String type)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into tblNotifies (postID, email, date, type) "
                        + "values (?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                stm.setString(3, date);
                stm.setString(4, type);
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
