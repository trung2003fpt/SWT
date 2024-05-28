package model;

/*
idP int primary key identity (1, 1) not null,
nameP nvarchar(350) not null,
quantityP int not null,
priceP int not null,
descriptionP nvarchar(500),
[image] nvarchar(150) not null,
idC int not null
 */
public class Products {

    private int idP;
    private String nameP;
    private int quantityP;
    private int priceP;
    private String descriptionP;
    private String image;
    private Categories idC;

    public Products() {
    }

    public Products(int idP, String nameP, int quantityP, int priceP, String descriptionP, String image, Categories idC) {
        this.idP = idP;
        this.nameP = nameP;
        this.quantityP = quantityP;
        this.priceP = priceP;
        this.descriptionP = descriptionP;
        this.image = image;
        this.idC = idC;
    }

    public Products(String nameP, int quantityP, int priceP, String descriptionP, String image, Categories idC) {
        this.nameP = nameP;
        this.quantityP = quantityP;
        this.priceP = priceP;
        this.descriptionP = descriptionP;
        this.image = image;
        this.idC = idC;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }

    public int getQuantityP() {
        return quantityP;
    }

    public void setQuantityP(int quantityP) {
        this.quantityP = quantityP;
    }

    public int getPriceP() {
        return priceP;
    }

    public void setPriceP(int priceP) {
        this.priceP = priceP;
    }

    public String getDescriptionP() {
        return descriptionP;
    }

    public void setDescriptionP(String descriptionP) {
        this.descriptionP = descriptionP;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Categories getIdC() {
        return idC;
    }

    public void setIdC(Categories idC) {
        this.idC = idC;
    }

}
