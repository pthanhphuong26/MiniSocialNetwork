/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.notifies;

import java.io.Serializable;

/**
 *
 * @author PhuongPT
 */
public class NotifiesDTO implements Serializable {
    private int id;
    private String postID, email, type, date, title, name;

    public NotifiesDTO(int id, String postID, String email, String type, String date, String title, String name) {
        this.id = id;
        this.postID = postID;
        this.email = email;
        this.type = type;
        this.date = date;
        this.title = title;
        this.name = name;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
}
