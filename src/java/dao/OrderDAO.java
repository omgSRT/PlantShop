/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basicobject.Account;
import basicobject.Order;
import basicobject.OrderDetail;
import basicobject.Plant;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import mylib.DBUtils;

/**
 *
 * @author omg
 */
public class OrderDAO {
    public static ArrayList<Order> getOrders() throws Exception{
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT [OrderID],[OrdDate],[shipdate],[status],[AccID]\n"
                    + "FROM DBO.Orders";
            PreparedStatement pst=cn.prepareStatement(sql);
            ResultSet table=pst.executeQuery();
            if (table!=null){
                while(table.next()){
                    int orderID = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accID = table.getInt("accID");
                    Order ord = new Order(orderID, ordDate, shipdate, status, accID);
                    list.add(ord);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<Order> getOrders(String email) throws Exception{
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT [OrderID],[OrdDate],[shipdate],DBO.Orders.status,DBO.Orders.AccID\n"
                    + "FROM DBO.Orders JOIN DBO.Accounts ON DBO.Orders.AccID=DBO.Accounts.accID\n"
                    + "WHERE DBO.Accounts.email=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet table=pst.executeQuery();
            if (table!=null){
                while(table.next()){
                    int orderID = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accID = table.getInt("accID");
                    Order ord = new Order(orderID, ordDate, shipdate, status, accID);
                    list.add(ord);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<Order> getSearchedOrders(Date information) throws Exception{
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT [OrderID],[OrdDate],[shipdate],status,AccID\n"
                    + "FROM DBO.Orders\n"
                    + "WHERE DBO.Orders.OrdDate=? OR DBO.Orders.shipdate=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setDate(1, information);
            pst.setDate(2, information);
            ResultSet table=pst.executeQuery();
            if (table!=null){
                while(table.next()){
                    int orderID = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accID = table.getInt("accID");
                    Order ord = new Order(orderID, ordDate, shipdate, status, accID);
                    list.add(ord);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<OrderDetail> getOrderDetail(int orderID){
        Connection cn=null;
        ArrayList<OrderDetail> list=new ArrayList<>();
        try{
            cn=DBUtils.makeConnection();
            if(cn!=null){
                String sql="SELECT DetailId,OrderID,PID,PName,price,imgPath,quantity\n"
                        + "FROM OrderDetails, Plants\n"
                        + "WHERE OrderID=? AND OrderDetails.FID=Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int detailID=rs.getInt("DetailId");
                        int PlantID=rs.getInt("PID");
                        String PlanName=rs.getString("PName");
                        int price=rs.getInt("price");
                        String imgPath=rs.getString("imgPath");
                        int quantity=rs.getInt("quantity");
                        OrderDetail orderDetail=new OrderDetail(detailID,orderID,PlantID,PlanName,price,imgPath,quantity);
                        list.add(orderDetail);
                    }
                }
                cn.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
     public static boolean reOrder(int orderID) throws Exception{
         Connection cn=DBUtils.makeConnection();
         boolean flag=false;
         if(cn!=null){
             String sql = "UPDATE DBO.Orders\n"
                     + "SET status=1\n"
                     + "WHERE OrderID=?";
             PreparedStatement pst=cn.prepareStatement(sql);
             pst.setInt(1, orderID);
             int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
         }
          return flag;
     }
     
     public static boolean cancelOrder(int orderID) throws Exception{
         Connection cn=DBUtils.makeConnection();
         boolean flag=false;
         if(cn!=null){
             String sql = "UPDATE DBO.Orders\n"
                     + "SET status=3\n"
                     + "WHERE OrderID=?";
             PreparedStatement pst=cn.prepareStatement(sql);
             pst.setInt(1, orderID);
             int table = pst.executeUpdate();
              if (table == 1) {
                  flag=true;
              }else flag=false;
              cn.close();
         }
          return flag;
     }
     
     public static boolean insertOrder(String email, HashMap<String, Integer> cart){
         Connection cn=null;
         boolean result=false;
         try{
             cn=DBUtils.makeConnection();
             if(cn!=null){
                 int accid=0, orderid=0;
                 cn.setAutoCommit(false); //off autocommit
                 //get account id by email
                 String sql="SELECT accID FROM Accounts\n"
                         +"WHERE Accounts.email=?";
                 PreparedStatement pst=cn.prepareStatement(sql);
                 pst.setString(1, email);
                 ResultSet rs = pst.executeQuery();
                 if(rs!=null&&rs.next()) accid=rs.getInt("accID");
                 //insert a new order
                 Date d=new Date(System.currentTimeMillis());
                 sql="INSERT Orders(OrdDate,status,AccID)\n"
                         + "VALUES (?,?,?)";
                 pst=cn.prepareStatement(sql);
                 pst.setDate(1, d);
                 pst.setInt(2, 1);
                 pst.setInt(3, accid);
                 pst.executeUpdate();
                 //get order id that is the largest number
                 sql="SELECT TOP 1 OrderID\n"
                         + "FROM Orders\n"
                         + "ORDER BY OrderID DESC";
                 pst=cn.prepareStatement(sql);
                 rs = pst.executeQuery();
                 if(rs!=null&&rs.next()) orderid=rs.getInt("OrderID");
                 System.out.println("Order ID: "+orderid);
                 //insert order details
                 Set<String> pids = cart.keySet();
                 for(String pid : pids){
                     sql="INSERT OrderDetails\n"
                             + "VALUES(?,?,?)";
                     pst=cn.prepareStatement(sql);
                     pst.setInt(1, orderid);
                     pst.setInt(2, Integer.parseInt(pid.trim()));
                     pst.setInt(3, cart.get(pid));
                     pst.executeUpdate();
                     cn.commit();
                     cn.setAutoCommit(true);
                 }
                 cn.close();
                 return true;
             }
         }catch(Exception e){
             e.printStackTrace();
         }
         return result;
     }
     
     public static ArrayList<Order> getOrder(String email, String dateFrom, String dateTo){
        Connection cn=null;
        ArrayList<Order> list=new ArrayList<>();
        try{
            cn=DBUtils.makeConnection();
            if(cn!=null){
                String sql = "SELECT OrderID,OrdDate,shipDate,DBO.Orders.status,DBO.Orders.AccID\n"
                        + "FROM DBO.Orders JOIN DBO.Accounts ON DBO.Orders.AccID=DBO.Accounts.accID\n"
                        + "WHERE DBO.Accounts.email= ? AND (DBO.Orders.OrdDate BETWEEN ? AND ?)";
                PreparedStatement pst=cn.prepareStatement(sql);
                Date ordDate1 = Date.valueOf(dateFrom);
                Date ordDate2 = Date.valueOf(dateTo);
                pst.setString(1, email);
                pst.setDate(2, ordDate1);
                pst.setDate(3, ordDate2);
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int orderID=rs.getInt("OrderID");
                        String orderDate=rs.getString("OrdDate");
                        String orderShipDate=rs.getString("shipDate");
                        int status=rs.getInt("status");
                        int accID=rs.getInt("AccID");
                        Order ord=new Order(orderID,orderDate,orderShipDate,status,accID);
                        list.add(ord);
                    }
                }
                cn.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
     }
}
