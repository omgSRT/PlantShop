/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package basicobject;

import java.io.Serializable;

/**
 *
 * @author omg
 */
public class Plant implements Serializable{
    private int id;
    private String name;
    private int price;
    private String imgpath;
    private String description;
    private int status;
    private int cateid;
    private String catename;
    
    public Plant(){
        
    }
    
    public Plant(int id, String name, int price, String imgpath, String description, int status, int cateid, String catename) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
        this.cateid = cateid;
        this.catename = catename;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getImgpath() {
        return imgpath;
    }

    public String getDescription() {
        return description;
    }

    public int getStatus() {
        return status;
    }

    public int getCateid() {
        return cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }  
    
}