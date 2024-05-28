package model;

/*
create table Roles (
idR int primary key not null,
roleName nvarchar(20) not null
)
 */
public class Roles {

    private int idR;
    private String roleName;

    public Roles() {
    }

    public Roles(int idR, String roleName) {
        this.idR = idR;
        this.roleName = roleName;
    }

    public int getIdR() {
        return idR;
    }

    public void setIdR(int idR) {
        this.idR = idR;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

}
