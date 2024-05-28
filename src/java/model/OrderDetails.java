package model;

/*
idOD int identity(1, 1) primary key not null,
quantityOD int not null, -- số lượng sản phẩm mua
priceOD int not null, -- giá đơn hàng mua là gì
idP int not null,
idO int not null
 */
public class OrderDetails {

    private int idOD;
    private int quantityOD;
    private int priceOD;
    private int idP;
    private int idO;

    public OrderDetails() {
    }

    public OrderDetails(int idOD, int quantityOD, int priceOD, int idP, int idO) {
        this.idOD = idOD;
        this.quantityOD = quantityOD;
        this.priceOD = priceOD;
        this.idP = idP;
        this.idO = idO;
    }

    public int getIdOD() {
        return idOD;
    }

    public void setIdOD(int idOD) {
        this.idOD = idOD;
    }

    public int getQuantityOD() {
        return quantityOD;
    }

    public void setQuantityOD(int quantityOD) {
        this.quantityOD = quantityOD;
    }

    public int getPriceOD() {
        return priceOD;
    }

    public void setPriceOD(int priceOD) {
        this.priceOD = priceOD;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getIdO() {
        return idO;
    }

    public void setIdO(int idO) {
        this.idO = idO;
    }

}
