/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basicobject.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author omg
 */
public class PlantDAO {
    public static ArrayList<Plant> getPlants(String keyword, String searchby){
        ArrayList<Plant> list=new ArrayList<>();
        Connection cn=null;
        try{
            cn=DBUtils.makeConnection();
            if(cn!=null&&searchby!=null){
                String sql="SELECT PID,PName,price,imgPath,description,status,Plants.CateID AS 'CateID', CateName\n"
                        + "FROM Plants JOIN Categories ON Plants.CateID=Categories.CateID\n";
                if(searchby.equalsIgnoreCase("byname"))
                    sql=sql+"WHERE Plants.PName LIKE ?";
                else sql=sql+"WHERE CateName LIKE ?";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setString(1, "%"+keyword+"%");
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int id=rs.getInt("PID");
                        String name=rs.getString("PName");
                        int price=rs.getInt("price");
                        String imgpath=rs.getString("imgPath");
                        String description=rs.getString("description");
                        int status=rs.getInt("status");
                        int cateid=rs.getInt("CateID");
                        String catename=rs.getString("CateName");
                        Plant plant=new Plant(id,name,price,imgpath,description,status,cateid,catename);
                        list.add(plant);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public static Plant getPlant(int pid) throws Exception{
        Plant p=null;
        //Todo
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT PID,PName,price,imgPath,Description,status,Plants.CateID as cateID,CateName\n"
                    + "FROM Plants, Categories\n"
                    + "WHERE Plants.CateID=Categories.CateID and PID=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, pid);
            ResultSet rs=pst.executeQuery();
            if(rs!=null && rs.next()){
                  pid=rs.getInt("PID");
                  String name=rs.getString("PName");
                  int price=rs.getInt("price");                  
                  String imgpath=rs.getString("imgPath");
                  String description=rs.getString("description");
                  int status=rs.getInt("status");
                  int cateid=rs.getInt("cateid");
                  String catename=rs.getString("CateName");
                  p=new Plant(pid, name, price, imgpath, description, status, cateid, catename);
            }
            cn.close();
        }
        return p;
    }
    
    public static ArrayList<Plant> getSearchedPlant(String information) throws Exception{
        ArrayList<Plant> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="SELECT PID,PName,price,imgPath,description,status,Plants.CateID AS 'CateID', CateName\n"
                        + "FROM Plants JOIN Categories ON Plants.CateID=Categories.CateID\n"
                        + "WHERE PName LIKE ?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1, "%"+information+"%");
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int id=rs.getInt("PID");
                        String name=rs.getString("PName");
                        int price=rs.getInt("price");
                        String imgpath=rs.getString("imgPath");
                        String description=rs.getString("description");
                        int status=rs.getInt("status");
                        int cateid=rs.getInt("CateID");
                        String catename=rs.getString("CateName");
                        Plant plant=new Plant(id,name,price,imgpath,description,status,cateid,catename);
                        list.add(plant);
                    }
                }
            }
        return list;
    }
}
