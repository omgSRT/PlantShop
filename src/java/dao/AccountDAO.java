/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basicobject.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author omg
 */
public class AccountDAO {
    //ham nay de lay all account trong DB
    public static ArrayList<Account> getAccounts() throws Exception{
        ArrayList<Account> list=new ArrayList<>();
        //step 1: make connection
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            //step 2: viet sql & execute
            String sql="SELECT accID,email,password,fullname,phone,status,role from dbo.Accounts";
            Statement st=cn.createStatement();
            ResultSet table=st.executeQuery(sql);
           //step 3: xu li ket qua cua step 2
           if(table!=null){
               while(table.next()){
                   int accid=table.getInt("accID");
                   String email=table.getString("email");
                   String password=table.getString("password");
                   String fullname=table.getString("fullname");
                   String phone=table.getString("phone");
                   int status=table.getInt("status");
                   int role=table.getInt("role");
                   Account acc=new Account(accid,email,password,fullname,phone,status,role);
                   list.add(acc);
               }//het while
           }//het if
           //step 4
           cn.close();
        }
        return list;
    }
    
    //ham nay de lay 1 account dua vao accID
    //input: accID
    //out: return an account obj co accid = input
    
    public static Account getAccount(int accID) throws Exception{
        ArrayList<Account> list=new ArrayList<>();
        Account acc=null;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n" +
                    "FROM DBO.Accounts\n" +
                    "WHERE accID=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, accID);
            ResultSet table=pst.executeQuery();
            if (table!=null && table.next()){
                String email=table.getString("email");
                String password=table.getString("password");
                String fullname=table.getString("fullname");
                String phone=table.getString("phone");
                int status=table.getInt("status");
                int role=table.getInt("role");
                acc=new Account(accID,email,password,fullname,phone,status,role);
                list.add(acc);
            }//het if
            cn.close();
        }//het if
        return acc;
    }//het function
    
    //ham nay de return account khi biet email va password
    //input: email, password
    //out: account trong email va pass
    
    public static Account getAccount(String email, String password) throws Exception{
        ArrayList<Account> list=new ArrayList<>();
        Account acc=null;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n" +
                    "FROM DBO.Accounts\n" +
                    "WHERE email=? AND password=? COLLATE Latin1_General_CS_AS";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1,email);
            pst.setString(2, password);
            ResultSet table=pst.executeQuery();
            if (table!=null && table.next()){
                int accID=table.getInt("accID");;
                email=table.getString("email");
                password=table.getString("password");
                String fullname=table.getString("fullname");
                String phone=table.getString("phone");
                int status=table.getInt("status");
                int role=table.getInt("role");
                acc=new Account(accID,email,password,fullname,phone,status,role);
                list.add(acc);
            }//het if
            cn.close();
        }//het if
        return acc;
    }
    
    public static Account getAccount(String token) throws Exception{
        ArrayList<Account> list=new ArrayList<>();
        Account acc=null;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n" +
                    "FROM DBO.Accounts\n" +
                    "WHERE token=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1, token);
            ResultSet table=pst.executeQuery();
            if (table!=null && table.next()){
                int accID=table.getInt("accUD");
                String email=table.getString("email");
                String password=table.getString("password");
                String fullname=table.getString("fullname");
                String phone=table.getString("phone");
                int status=table.getInt("status");
                int role=table.getInt("role");
                acc=new Account(accID,email,password,fullname,phone,status,role);
                list.add(acc);
            }//het if
            cn.close();
        }//het if
        return acc;
    }
    
    public static ArrayList<Account> getSearchedAccount(String information) throws Exception{
        ArrayList<Account> list=new ArrayList<>();
        Account acc=null;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n" +
                    "FROM DBO.Accounts\n" +
                    "WHERE email LIKE ? OR fullname LIKE ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+information+"%");
            pst.setString(2, "%"+information+"%");
            ResultSet table=pst.executeQuery();
            if (table!=null && table.next()){
                int accid=table.getInt("accID");
                String email=table.getString("email");
                String password=table.getString("password");
                String fullname=table.getString("fullname");
                String phone=table.getString("phone");
                int status=table.getInt("status");
                int role=table.getInt("role");
                acc=new Account(accid,email,password,fullname,phone,status,role);
                list.add(acc);
            }//het if
            cn.close();
        }//het if
        return list;
    }
    
     public static boolean updateAccountStatus(String email, int status) throws Exception{
         Connection cn=DBUtils.makeConnection();
         boolean flag=false;
         if(cn!=null){
             String sql = "UPDATE DBO.Accounts\n"
                     + "SET status=?\n"
                     + "WHERE email=?";
             PreparedStatement pst=cn.prepareStatement(sql);
             pst.setInt(1, status);
             pst.setString(2, email);
             int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
         }
          return flag;
     }
     
      public static boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) throws Exception{
          Connection cn=DBUtils.makeConnection();
          boolean flag=false;
          if(cn!=null){
              String sql="UPDATE DBO.Accounts\n" +
                      "SET  fullname=?, phone=?, password=?\n" +
                      "WHERE email=?";
              PreparedStatement pst=cn.prepareStatement(sql);
              pst.setString(1, newFullname);
              pst.setString(2, newPhone);
              pst.setString(3, newPassword);
              pst.setString(4, email);
              int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
          }
          return flag;
      }
      
      public static boolean updateFullnamePhone(String email, String newFullname, String newPhone) throws Exception{
          Connection cn=DBUtils.makeConnection();
          boolean flag=false;
          if(cn!=null){
              String sql="UPDATE DBO.Accounts\n" +
                      "SET  fullname=?, phone=?\n" +
                      "WHERE email=?";
              PreparedStatement pst=cn.prepareStatement(sql);
              pst.setString(1, newFullname);
              pst.setString(2, newPhone);
              pst.setString(3, email);
              int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
          }
          return flag;
      }
      
      public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newSatus,int newRole) throws Exception{
          Connection cn=DBUtils.makeConnection();
          boolean flag=false;
          if(cn!=null){
              String sql="INSERT INTO DBO.Accounts(email,password,fullname,phone,status,role)\n" +
                      "VALUES(?,?,?,?,?,?)";
              PreparedStatement pst=cn.prepareStatement(sql);
              pst.setString(1, newEmail);
              pst.setString(2, newPassword);
              pst.setString(3, newFullname);
              pst.setString(4, newPhone);
              pst.setInt(5, newSatus);
              pst.setInt(6, newRole);
              int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
          }
          return flag;
      }
      
      public static boolean updateToken(String token, String email)throws Exception{
          Connection cn=DBUtils.makeConnection();
          boolean flag=false;
          if(cn!=null){
              String sql="UPDATE DBO.Accounts\n" +
                      "SET  token=?" +
                      "WHERE email=?";
              PreparedStatement pst=cn.prepareStatement(sql);
              pst.setString(1, token);
              pst.setString(2, email);
              int table=pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
          }
          return flag;
      }
      
      
}
