package model;

import java.io.Serializable;

public class User implements Serializable {

    private String user_id;

    private String user_name;

    private String password;

    public User() {

    }
    public User(String user_id, String user_name, String password) {
        this.user_id = user_id;
        this.user_name =  user_name;
        this.password = password;
    }

    public String getUserId() {
        return this.user_id;
    }

    public void setUserId(String user_id) {
        this.user_id = user_id;
    }
    public String getUserName() {
        return this.user_name;
    }

    public void setUserNmae(String user_name) {
        this.user_name = user_name;
    }
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

