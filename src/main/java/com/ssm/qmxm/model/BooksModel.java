package com.ssm.qmxm.model;

public class BooksModel {
    public int boId;
    public String boName;
    public String boNumber;
    public int boPrice;
    public String boIntroduction;
    public int boRecommended;
    public String boPhoto;
    public int boCid;
    public int boInventory;
    public int boSalt;
    public String boAuthor;
    public int clId;
    public String clType;

    public int getBoId() {
        return boId;
    }

    public void setBoId(int boId) {
        this.boId = boId;
    }

    public String getBoName() {
        return boName;
    }

    public void setBoName(String boName) {
        this.boName = boName;
    }

    public String getBoNumber() {
        return boNumber;
    }

    public void setBoNumber(String boNumber) {
        this.boNumber = boNumber;
    }

    public int getBoPrice() {
        return boPrice;
    }

    public void setBoPrice(int boPrice) {
        this.boPrice = boPrice;
    }

    public String getBoIntroduction() {
        return boIntroduction;
    }

    public void setBoIntroduction(String boIntroduction) {
        this.boIntroduction = boIntroduction;
    }

    public int getBoRecommended() {
        return boRecommended;
    }

    public void setBoRecommended(int boRecommended) {
        this.boRecommended = boRecommended;
    }

    public String getBoPhoto() {
        return boPhoto;
    }

    public void setBoPhoto(String boPhoto) {
        this.boPhoto = boPhoto;
    }

    public int getBoCid() {
        return boCid;
    }

    public void setBoCid(int boCid) {
        this.boCid = boCid;
    }

    public int getBoInventory() {
        return boInventory;
    }

    public void setBoInventory(int boInventory) {
        this.boInventory = boInventory;
    }

    public int getBoSalt() {
        return boSalt;
    }

    public void setBoSalt(int boSalt) {
        this.boSalt = boSalt;
    }

    public String getBoAuthor() {
        return boAuthor;
    }

    public void setBoAuthor(String boAuthor) {
        this.boAuthor = boAuthor;
    }

    public int getClId() {
        return clId;
    }

    public void setClId(int clId) {
        this.clId = clId;
    }

    public String getClType() {
        return clType;
    }

    public void setClType(String clType) {
        this.clType = clType;
    }

    @Override
    public String toString() {
        return "BooksModels{" +
                "boId=" + boId +
                ", boName='" + boName + '\'' +
                ", boNumber='" + boNumber + '\'' +
                ", boPrice=" + boPrice +
                ", boIntroduction='" + boIntroduction + '\'' +
                ", boRecommended=" + boRecommended +
                ", boPhoto='" + boPhoto + '\'' +
                ", boCid=" + boCid +
                ", boInventory=" + boInventory +
                ", boSalt=" + boSalt +
                ", boAuthor='" + boAuthor + '\'' +
                ", clId=" + clId +
                ", clType='" + clType + '\'' +
                '}';
    }
}
