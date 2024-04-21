package com.ssm.qmxm.model;

public class ShopModel {
    public String shId;
    public String shBuyer;
    public String shBooks;
    public String shNum;
    public String shName;
    public String shHouse;
    public String shTel;
    public String shYes;
    public String shPhoto;
    public String shBoname;
    public String shPrice;

    public String getShBoname() {
        return shBoname;
    }

    public void setShBoname(String shBoname) {
        this.shBoname = shBoname;
    }

    public String getShPrice() {
        return shPrice;
    }

    public void setShPrice(String shPrice) {
        this.shPrice = shPrice;
    }


    public String getShPhoto() {
        return shPhoto;
    }

    public void setShPhoto(String shPhoto) {
        this.shPhoto = shPhoto;
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId;
    }

    public String getShBuyer() {
        return shBuyer;
    }

    public void setShBuyer(String shBuyer) {
        this.shBuyer = shBuyer;
    }

    public String getShBooks() {
        return shBooks;
    }

    public void setShBooks(String shBooks) {
        this.shBooks = shBooks;
    }

    public String getShNum() {
        return shNum;
    }

    public void setShNum(String shNum) {
        this.shNum = shNum;
    }

    public String getShName() {
        return shName;
    }

    public void setShName(String shName) {
        this.shName = shName;
    }

    public String getShHouse() {
        return shHouse;
    }

    public void setShHouse(String shHouse) {
        this.shHouse = shHouse;
    }

    public String getShTel() {
        return shTel;
    }

    public void setShTel(String shTel) {
        this.shTel = shTel;
    }

    public String getShYes() {
        return shYes;
    }

    public void setShYes(String shYes) {
        this.shYes = shYes;
    }

    @Override
    public String toString() {
        return "ShopModel{" +
                "shId='" + shId + '\'' +
                ", shBuyer='" + shBuyer + '\'' +
                ", shBooks='" + shBooks + '\'' +
                ", shNum='" + shNum + '\'' +
                ", shName='" + shName + '\'' +
                ", shHouse='" + shHouse + '\'' +
                ", shTel='" + shTel + '\'' +
                ", shYes='" + shYes + '\'' +
                ", shPhoto='" + shPhoto + '\'' +
                ", shBoname='" + shBoname + '\'' +
                ", shPrice='" + shPrice + '\'' +
                '}';
    }
}
