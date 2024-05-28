package model;

/*
idCO int primary key not null,
fullNameCO nvarchar(150) not null,
emailAddressCO varchar(150) not null,
phoneNumberCO nvarchar(30) not null,
messageCO nvarchar(max)
 */
public class Contact {

    private int idCO;
    private String fullNameCO;
    private String emailAddressCO;
    private int phoneNumberCO;
    private String messageCO;

    public Contact() {
    }

    public Contact(String fullNameCO, String emailAddressCO, int phoneNumberCO, String messageCO) {
        this.fullNameCO = fullNameCO;
        this.emailAddressCO = emailAddressCO;
        this.phoneNumberCO = phoneNumberCO;
        this.messageCO = messageCO;
    }

    public Contact(int idCO, String fullNameCO, String emailAddressCO, int phoneNumberCO, String messageCO) {
        this.idCO = idCO;
        this.fullNameCO = fullNameCO;
        this.emailAddressCO = emailAddressCO;
        this.phoneNumberCO = phoneNumberCO;
        this.messageCO = messageCO;
    }

    public int getIdCO() {
        return idCO;
    }

    public void setIdCO(int idCO) {
        this.idCO = idCO;
    }

    public String getFullNameCO() {
        return fullNameCO;
    }

    public void setFullNameCO(String fullNameCO) {
        this.fullNameCO = fullNameCO;
    }

    public String getEmailAddressCO() {
        return emailAddressCO;
    }

    public void setEmailAddressCO(String emailAddressCO) {
        this.emailAddressCO = emailAddressCO;
    }

    public int getPhoneNumberCO() {
        return phoneNumberCO;
    }

    public void setPhoneNumberCO(int phoneNumberCO) {
        this.phoneNumberCO = phoneNumberCO;
    }

    public String getMessageCO() {
        return messageCO;
    }

    public void setMessageCO(String messageCO) {
        this.messageCO = messageCO;
    }

}
