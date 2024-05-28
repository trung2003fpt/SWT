package model;

/*
idC int primary key not null,
nameC nvarchar(30)
 */
public class Categories {

    private int idC;
    private String nameC;

    public Categories() {
    }

    public Categories(int idC, String nameC) {
        this.idC = idC;
        this.nameC = nameC;
    }

    public int getIdC() {
        return idC;
    }

    public void setIdC(int idC) {
        this.idC = idC;
    }

    public String getNameC() {
        return nameC;
    }

    public void setNameC(String nameC) {
        this.nameC = nameC;
    }

}
