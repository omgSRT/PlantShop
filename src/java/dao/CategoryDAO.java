/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basicobject.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author omg
 */
public class CategoryDAO {
    public static ArrayList<Category> getCategories() throws Exception{
        ArrayList<Category> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT CateID,CateName\n"
                    + "FROM DBO.Categories";
            PreparedStatement pst=cn.prepareStatement(sql);
            ResultSet table=pst.executeQuery();
            if (table!=null){
                while(table.next()){
                    int cateID = table.getInt("CateID");
                    String cateName = table.getString("CateName");
                    Category cate = new Category(cateID,cateName);
                    list.add(cate);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<Category> getSearchedCategories(String information) throws Exception{
        ArrayList<Category> list=new ArrayList<>();
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql = "SELECT CateID,CateName\n"
                    + "FROM DBO.Categories\n"
                    + "WHERE CateName LIKE ?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1, "%"+information+"%");
            ResultSet table=pst.executeQuery();
            if (table!=null){
                while(table.next()){
                    int cateID=table.getInt("CateID");
                    String cateName=table.getString("CateName");
                    Category cate = new Category(cateID,cateName);
                    list.add(cate);
                }
            }
            cn.close();
        }
        return list;
    }
}
