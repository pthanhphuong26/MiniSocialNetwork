/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.emotion;

import java.io.Serializable;

/**
 *
 * @author PhuongPT
 */
public class EmotionDTO implements Serializable {
    private int id;
    private String postID, email, date, emotion, status;

    public EmotionDTO(int id, String postID, String email, String date, String emotion, String status) {
        this.id = id;
        this.postID = postID;
        this.email = email;
        this.date = date;
        this.emotion = emotion;
        this.status = status;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmotion() {
        return emotion;
    }

    public void setEmotion(String emotion) {
        this.emotion = emotion;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

}
