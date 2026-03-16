package dao;

import model.User;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    public boolean addUser(User u){

        boolean status = false;

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO users(name,age,gender,weight,height,email,password,trainer,plan) VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,u.getName());
            ps.setInt(2,u.getAge());
            ps.setString(3,u.getGender());
            ps.setFloat(4,u.getWeight());
            ps.setFloat(5,u.getHeight());
            ps.setString(6,u.getEmail());
            ps.setString(7,u.getPassword());
            ps.setString(8,u.getTrainer());
            ps.setString(9,u.getPlan());

            int rows = ps.executeUpdate();

            if(rows>0){
                status = true;
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    public User login(String email,String password){

        User user = null;

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAge(rs.getInt("age"));
                user.setGender(rs.getString("gender"));
                user.setWeight(rs.getFloat("weight"));
                user.setHeight(rs.getFloat("height"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setTrainer(rs.getString("trainer"));
                user.setPlan(rs.getString("plan"));
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateTrainer(int id,String trainer){

        boolean status = false;

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE users SET trainer=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,trainer);
            ps.setInt(2,id);

            int rows = ps.executeUpdate();

            if(rows>0){
                status = true;
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    public boolean upgradeMembership(int id,String plan){

        boolean status = false;

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE users SET plan=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,plan);
            ps.setInt(2,id);

            int rows = ps.executeUpdate();

            if(rows>0){
                status = true;
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    public void deleteUser(int id){

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "DELETE FROM users WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1,id);

            ps.executeUpdate();

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public ArrayList<User> getAllUsers(){

        ArrayList<User> list = new ArrayList<>();

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                User u = new User();

                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setAge(rs.getInt("age"));
                u.setGender(rs.getString("gender"));
                u.setWeight(rs.getFloat("weight"));
                u.setHeight(rs.getFloat("height"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setTrainer(rs.getString("trainer"));
                u.setPlan(rs.getString("plan"));

                list.add(u);
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}