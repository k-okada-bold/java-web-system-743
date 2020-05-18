package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import model.User;

public class UserDao extends CommonDao {



    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            this.getConnection();
            ps = db.prepareStatement("SELECT * FROM user ORDER BY user_id");
            rs = ps.executeQuery();
            while (rs.next()) {
                String user_id = rs.getString("user_id");
                String user_name = rs.getString("user_name");
                String password = rs.getString("password");
                User user = new User(user_id, user_name, password);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            this.disconnect();
        }
        return userList;
    }

    public boolean insertOne(User user) {
        try {
            this.getConnection();
            ps = db.prepareStatement("INSERT INTO user (user_id, user_name, password) VALUES (?, ?, ?)");
            ps.setString(1, user.getUserId());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassword());
            int result = ps.executeUpdate();
            if (result != 1) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            this.disconnect();
        }
        return true;
    }

    public User findOne(String user_id) {
        User user = null;
        try {
            this.getConnection();
            ps = db.prepareStatement("SELECT * FROM user WHERE user_id = ?");
            ps.setString(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String user_name = rs.getString("user_name");
                String password = rs.getString("password");
                user = new User(user_id, user_name, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            this.disconnect();
        }
        return user;
    }

    public boolean updateOne(User user) {
        try {
            this.getConnection();
            ps = db.prepareStatement("UPDATE user SET user_name = ?, password = ? WHERE user_id = ?");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getUserId());
            int result = ps.executeUpdate();
            if (result != 1) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            this.disconnect();
        }
        return true;
    }

    public boolean deleteOne(String user_id){
        try {
            this.getConnection();
            ps = db.prepareStatement("DELETE FROM user WHERE user_id = ?");
            ps.setString(1, user_id);
            int result = ps.executeUpdate();
            if (result != 1) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            this.disconnect();
        }
        return true;
    }
}
