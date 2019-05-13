package dao;

import java.sql.SQLException;

import javax.naming.NamingException;

import model.User;

public class LoginDao extends CommonDao {

     public User findLoginUser(String user_id, String password) {
         User user = null;
         try {
             this.getConnection();
             ps = db.prepareStatement("SELECT * FROM user WHERE user_id = ? AND password = ?");
             ps.setString(1, user_id);
             ps.setString(2, password);
             rs = ps.executeQuery();
             while (rs.next()) {
                 String user_name = rs.getString("user_name");
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
}
