package model;

/*
idA int primary key identity(1,1) not null,
emailA varchar(150) not null,
nameA varchar(20) not null, 
passwordA varchar(30) not null, 
idR int default 1
 */
public class Accounts {

    private int idA;
    private String email;
    private String nameA;
    private String passwordA;
    private Roles idR;

    public Accounts() {
    }

    public Accounts(String email, String nameA, String passwordA, Roles idR) {
        this.email = email;
        this.nameA = nameA;
        this.passwordA = passwordA;
        this.idR = idR;
    }

    public Accounts(int idA, String email, String nameA, String passwordA, Roles idR) {
        this.idA = idA;
        this.email = email;
        this.nameA = nameA;
        this.passwordA = passwordA;
        this.idR = idR;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNameA() {
        return nameA;
    }

    public void setNameA(String nameA) {
        this.nameA = nameA;
    }

    public String getPasswordA() {
        return passwordA;
    }

    public void setPasswordA(String passwordA) {
        this.passwordA = passwordA;
    }

    public Roles getIdR() {
        return idR;
    }

    public void setIdR(Roles idR) {
        this.idR = idR;
    }

}
