package model;

import java.util.*;

/*
idO int identity(1, 1) primary key not null,
fullnameO nvarchar(50) not null,
addressO nvarchar(200) not null, -- 200 kí tự
phoneO varchar(20) not null, -- 20 kí tự (giả dụ thêm +84) thì lên để là String
dateO date not null,
note nvarchar(max),
idA int not null
 */
public class Orders {

    private int idO;
    private String fullnameO;
    private String addressO;
    private String phoneO;
    private Date dateO;
    private String note;
    private int idA;

    public Orders() {
    }

    public Orders(int idO, String fullnameO, String addressO, String phoneO, Date dateO, String note, int idA) {
        this.idO = idO;
        this.fullnameO = fullnameO;
        this.addressO = addressO;
        this.phoneO = phoneO;
        this.dateO = dateO;
        this.note = note;
        this.idA = idA;
    }

    public int getIdO() {
        return idO;
    }

    public void setIdO(int idO) {
        this.idO = idO;
    }

    public String getFullnameO() {
        return fullnameO;
    }

    public void setFullnameO(String fullnameO) {
        this.fullnameO = fullnameO;
    }

    public String getAddressO() {
        return addressO;
    }

    public void setAddressO(String addressO) {
        this.addressO = addressO;
    }

    public String getPhoneO() {
        return phoneO;
    }

    public void setPhoneO(String phoneO) {
        this.phoneO = phoneO;
    }

    public Date getDateO() {
        return dateO;
    }

    public void setDateO(Date dateO) {
        this.dateO = dateO;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

}
