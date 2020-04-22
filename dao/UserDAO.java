package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends BaseDAO {

    public User getUserByEmailAndPassword(String email, String password) {
        try {
            String sql = "SELECT *"
                    + "  FROM [User]\n"
                    + "  where email = ?"
                    + "  and password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                if (rs.getString("email") != null) {
                    User user = new User();
                    user.setEmail(email);
                    user.setPassword(password);
                    user.setUser_id(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setBirthdate(rs.getDate("birthdate"));
                    user.setStatus(rs.getBoolean("status"));
                    user.setRole(rs.getBoolean("role"));
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "SELECT *"
                    + "  FROM [User]\n"
                    + "  where email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                if (rs.getString("email") != null) {
                    User user = new User();
                    user.setEmail(email);
                    user.setPassword(rs.getString("password"));
                    user.setUser_id(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setBirthdate(rs.getDate("birthdate"));
                    user.setStatus(rs.getBoolean("status"));
                    user.setRole(rs.getBoolean("role"));
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByID(int id) {
        try {
            String sql = "SELECT *"
                    + "  FROM [User]\n"
                    + "  where user_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                if (rs.getString("user_id") != null) {
                    User user = new User();
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setUser_id(id);
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setBirthdate(rs.getDate("birthdate"));
                    user.setStatus(rs.getBoolean("status"));
                    user.setRole(rs.getBoolean("role"));
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> getUsers() {
        ArrayList<User> ar = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "  FROM [User]\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setUser_id(rs.getInt("user_id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setStatus(rs.getBoolean("status"));
                user.setRole(rs.getBoolean("role"));
                ar.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    
    public boolean checkEmail(String email){
        ArrayList<User> array = new ArrayList<>();
        array = getUsers();
        int check = 0;
        for (User u : array) {
            if (u.getEmail().equals(email)) {
                check = 1;
                break;
            }
        }
        return check == 0;
    }
    
    public void createUser(User user) {
        ArrayList<User> array = new ArrayList<>();
        array = getUsers();
        int check = 0;
        for (User u : array) {
            if (u.getEmail().equals(user.getEmail())) {
                check = 1;
                break;
            }
        }
        if (check == 0) {
            try {
                String sql = "INSERT INTO [User] (first_name, last_name, birthdate,"
                        + " phone, email, address, password, status, role)\n"
                        + "VALUES ("
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "1,"
                        + "1)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getFirstName());
                statement.setString(2, user.getLastName());
                statement.setDate(3, user.getBirthdate());
                statement.setString(4, user.getPhone());
                statement.setString(5, user.getEmail());
                statement.setString(6, user.getAddress());
                statement.setString(7, user.getPassword());
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            System.out.println("This email has already existed!");
        }
    }

    public void updateUser(User user) {
        ArrayList<User> array = new ArrayList<>();
        array = getUsers();
        int check = 0;
        for (User u : array) {
            if (u.getEmail().equals(user.getEmail()) && u.getUser_id() != user.getUser_id()) {
                check = 1;
                break;
            }
        }
        if (check == 0) {
            try {
                String sql = "UPDATE [User]\n"
                        + "SET first_name = ?,"
                        + "last_name = ?,"
                        + "[birthdate] = ?,"
                        + "[phone] = ?,"
                        + "[email] = ?,"
                        + "[address] = ?\n"
                        + "WHERE user_id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getFirstName());
                statement.setString(2, user.getLastName());
                statement.setDate(3, user.getBirthdate());
                statement.setString(4, user.getPhone());
                statement.setString(5, user.getEmail());
                statement.setString(6, user.getAddress());
                statement.setInt(7, user.getUser_id());
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            System.out.println("This email has already existed!");
        }
    }

}
