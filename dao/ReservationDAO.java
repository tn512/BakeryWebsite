/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;
import model.User;

/**
 *
 * @author Admin
 */
public class ReservationDAO extends BaseDAO {

    public void createReservation(Reservation reservation) {
        if (reservation.getUser_id() != 0) {
            try {
                String sql = "INSERT INTO [Reservation] (first_name, last_name,"
                        + " email, phone, date_time, attendance, note, time, user_id)\n"
                        + "VALUES ("
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, reservation.getFirstName());
                statement.setString(2, reservation.getLastName());
                statement.setString(3, reservation.getEmail());
                statement.setString(4, reservation.getPhone());
                statement.setDate(5, reservation.getDate());
                statement.setInt(6, reservation.getAttendance());
                statement.setString(7, reservation.getNote());
                statement.setString(8, reservation.getTime());
                statement.setInt(9, reservation.getUser_id());
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
           try {
                String sql = "INSERT INTO [Reservation] (first_name, last_name,"
                        + " email, phone, date_time, attendance, note, time)\n"
                        + "VALUES ("
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?,"
                        + "?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, reservation.getFirstName());
                statement.setString(2, reservation.getLastName());
                statement.setString(3, reservation.getEmail());
                statement.setString(4, reservation.getPhone());
                statement.setDate(5, reservation.getDate());
                statement.setInt(6, reservation.getAttendance());
                statement.setString(7, reservation.getNote());
                statement.setString(8, reservation.getTime());
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }

    }
}
