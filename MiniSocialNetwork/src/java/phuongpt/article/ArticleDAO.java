/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.article;

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
import phuongpt.utils.MyUtils;

/**
 *
 * @author PhuongPT
 */
public class ArticleDAO implements Serializable {

    private List<ArticleDTO> listArticles;

    public List<ArticleDTO> getListArticles() {
        return listArticles;
    }

    public void showListArticlesBySearch(String searchValue, int offset)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select postID, a.email, title, description, image, date, a.statusID, name "
                        + "From tblArticle a, tblUser u "
                        + "Where (description LIKE ? or title LIKE ?) and a.statusID = 'S0001' and a.email = u.email "
                        + "order by date desc offset ? rows fetch next 20 rows only";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setInt(3, offset); 

                rs = stm.executeQuery();
                while (rs.next()) {
                    String postID = rs.getString("postID");
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    String statusID = rs.getString("statusID");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
                    ArticleDTO dto = new ArticleDTO(postID, email, title, description, image, statusID, sdf.format(date), name);
                    if (this.listArticles == null) {
                        this.listArticles = new ArrayList<>();
                    }
                    this.listArticles.add(dto);
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

    public void showListArticlesByEmail(String email, int offset)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select postID, a.email, title, description, image, date, a.statusID, name "
                        + "From tblArticle a, tblUser u "
                        + "Where a.statusID = 'S0001' and a.email = ? and a.email = u.email "
                        + "order by date desc offset ? rows fetch next 20 rows only";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setInt(2, offset);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String postID = rs.getString("postID");
                    String title = rs.getString("title");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    String statusID = rs.getString("statusID");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
                    ArticleDTO dto = new ArticleDTO(postID, email, title, description, image, statusID, sdf.format(date), name);
                    if (this.listArticles == null) {
                        this.listArticles = new ArrayList<>();
                    }
                    this.listArticles.add(dto);
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

    public int countArticleFoundBySearch(String searchValue)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(postID) as row "
                        + "From tblArticle "
                        + "Where (description LIKE ? or title LIKE ?) and statusID = 'S0001'";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");

                rs = stm.executeQuery();
                if (rs.next()) {
                    row = rs.getInt("row");
                    return row;
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
        return row;
    }

    public int countArticleFoundByEmail(String email)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(postID) as row "
                        + "From tblArticle "
                        + "Where email = ? and statusID = 'S0001'";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();
                if (rs.next()) {
                    row = rs.getInt("row");
                    return row;
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
        return row;
    }

    public ArticleDTO findArticleById(String postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArticleDTO dto = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select postID, a.email, title, description, image, date, a.statusID, name "
                        + "From tblArticle  a, tblUser u "
                        + "Where postID = ? and a.statusID = 'S0001'  and a.email = u.email";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    String email = rs.getString("email");
                    String title = rs.getString("title");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    String statusID = rs.getString("statusID");
                    Timestamp date = rs.getTimestamp("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    dto = new ArticleDTO(postID, email, title, description, image, statusID, sdf.format(date), name);
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
        return dto;
    }

    public boolean addArticle(String postID, String email, String title, String description, String image, String date)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into tblArticle (postID, email, title, description, image, date, statusID) "
                        + "values (?, ?, ?, ?, ?, ?, 'S0001')";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, email);
                stm.setString(3, title);
                stm.setString(4, description);
                stm.setString(5, image);
                stm.setString(6, date);
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

    public boolean deleteArticle(String postID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblArticle SET statusID = 'S0003' WHERE postID = ?";
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

    public String generateID() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String maxId = "";
        int max = 1;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select postID "
                        + "From tblArticle";
                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("postID");
                    int num = MyUtils.seperateNumber(id);
                    if (max < num) {
                        max = num;
                    }
                }
                maxId = "P" + (max + 1);
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
        return maxId;
    }
}
