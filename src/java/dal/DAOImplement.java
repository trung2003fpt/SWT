package dal;

import java.sql.*;
import java.util.*;
import model.*;

public class DAOImplement implements DAOInterface {

    public static DAOImplement INSTANCE = new DAOImplement();
    private Connection con;

    // Design Pattern (Singleton)
    private DAOImplement() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    @Override
    public int getDefaultRoleId() {
        int defaultRoleId = -1;
        String sql = "SELECT idR FROM Roles WHERE roleName = 'user'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                defaultRoleId = rs.getInt("idR");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return defaultRoleId;
    }

    @Override
    public int getIdPbyNameP(String nameP) {
        int idP = -1;
        String sql = "SELECT idP FROM Products WHERE nameP = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nameP);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                idP = rs.getInt("idP");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return idP;
    }

    @Override
    public Accounts getAccount(String name, String password) {
        Accounts account = null;
        String sql = "SELECT * FROM Accounts WHERE nameA = ? AND passwordA = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                account = new Accounts();
                account.setIdA(rs.getInt("idA"));
                account.setNameA(rs.getString("nameA"));
                account.setPasswordA(rs.getString("passwordA"));
                account.setEmail(rs.getString("emailA"));
                Roles roles = new Roles();
                roles.setIdR(rs.getInt("idR"));
                account.setIdR(roles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public boolean emailExists(String email) {
        boolean existEmailA = false;
        String sql = "SELECT COUNT(*) AS countMail FROM Accounts WHERE emailA = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("countMail");
                if (count > 0) {
                    existEmailA = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existEmailA;
    }

    @Override
    public boolean nameAExists(String nameA) {
        boolean existNameA = false;
        String sql = "SELECT COUNT(*) AS countAccount FROM Accounts WHERE nameA = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nameA);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("countAccount");
                if (count > 0) {
                    existNameA = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existNameA;
    }

    @Override
    public Products existAddProductAdmin(String nameP, String image, String descriptionP) {
        Products product = null;
        String sql = "SELECT * FROM Products WHERE nameP = ? OR [image] = ? OR descriptionP = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nameP);
            ps.setString(2, image);
            ps.setString(3, descriptionP);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Products();
                product.setIdP(rs.getInt("idP"));
                product.setNameP(rs.getString("nameP"));
                product.setQuantityP(rs.getInt("quantityP"));
                product.setPriceP(rs.getInt("priceP"));
                product.setDescriptionP(rs.getString("descriptionP"));
                product.setImage(rs.getString("image"));
                Categories c = getCategoryById(rs.getInt("idC"));
                product.setIdC(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public Products existUpProductAdmin(String nameP, String descriptionP) {
        Products product = null;
        String sql = "SELECT * FROM Products WHERE nameP = ? OR descriptionP = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nameP);
            ps.setString(2, descriptionP);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Products();
                product.setIdP(rs.getInt("idP"));
                product.setNameP(rs.getString("nameP"));
                product.setQuantityP(rs.getInt("quantityP"));
                product.setPriceP(rs.getInt("priceP"));
                product.setDescriptionP(rs.getString("descriptionP"));
                product.setImage(rs.getString("image"));
                Categories c = getCategoryById(rs.getInt("idC"));
                product.setIdC(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void insertAccount(Accounts account) {
        String sql = "INSERT INTO [dbo].[Accounts] ([emailA], [nameA], [passwordA], [idR]) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getNameA());
            ps.setString(3, account.getPasswordA());
            ps.setInt(4, account.getIdR().getIdR());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));
                Categories c = getCategoryById(rs.getInt("idC"));
                p.setIdC(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Products> getProducts() {
        List<Products> allProduct = getAllProducts();
        List<Products> outOfStock = new ArrayList<>();
        for (Products p : allProduct) {
            if (p.getQuantityP() > 0) {
                outOfStock.add(p);
            }
        }
        return outOfStock;
    }

    @Override
    public List<Categories> getCategory() {
        List<Categories> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories();
                c.setIdC(rs.getInt("idC"));
                c.setNameC(rs.getString("nameC"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Categories getCategoryById(int idC) {
        String sql = "SELECT * FROM Categories WHERE idC = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idC);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Categories c = new Categories();
                c.setIdC(rs.getInt("idC"));
                c.setNameC(rs.getString("nameC"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Products> getProductsByPid(int idP) {
        String sql = "SELECT p.*, c.* FROM Products p JOIN Categories c ON p.idC = c.idC WHERE p.idP = ?";
        List<Products> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idP);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));
                Categories c = getCategoryById(rs.getInt("idC"));
                p.setIdC(c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Products> getProductsByCategoryId(int cid) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE idC = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));

                Categories c = getCategoryById(rs.getInt("idC"));
                p.setIdC(c);

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Products> search(String name) {
        List<Products> productSearch = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1 = 1 ";
        if (name != null && !name.isEmpty()) {
            sql += "AND nameP LIKE ?";
        }
        try {
            PreparedStatement st = con.prepareStatement(sql);
//            st.setString(1, "%" + name + "%");
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));
                Categories c = getCategoryById(rs.getInt("idC"));
                p.setIdC(c);
                productSearch.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productSearch;
    }

    @Override
    public List<Products> getProductsByID(int idP) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE idP = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idP);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));

                Categories c = getCategoryById(rs.getInt("idC"));
                p.setIdC(c);

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Products> getRandomProductsForCategory(int idC) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP 4 p.*, c.* FROM Products p JOIN Categories c ON p.idC = c.idC WHERE c.idC = ? ORDER BY NEWID()";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idC);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setIdP(rs.getInt("idP"));
                p.setNameP(rs.getString("nameP"));
                p.setQuantityP(rs.getInt("quantityP"));
                p.setPriceP(rs.getInt("priceP"));
                p.setDescriptionP(rs.getString("descriptionP"));
                p.setImage(rs.getString("image"));
                Categories c = new Categories();
                c.setIdC(rs.getInt("idC"));
                c.setNameC(rs.getString("nameC"));
                p.setIdC(c);

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void insertContact(Contact c) {
        String sql = "INSERT INTO [dbo].[Contacts] "
                + "([fullNameCO], [emailAddressCO], [phoneNumberCO], [messageCO]) "
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, c.getFullNameCO());
            ps.setString(2, c.getEmailAddressCO());
            ps.setInt(3, c.getPhoneNumberCO());
            ps.setString(4, c.getMessageCO());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertProduct(Products pAdd) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([nameP]\n"
                + "           ,[quantityP]\n"
                + "           ,[priceP]\n"
                + "           ,[descriptionP]\n"
                + "           ,[image]\n"
                + "           ,[idC])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pAdd.getNameP());
            ps.setInt(2, pAdd.getQuantityP());
            ps.setDouble(3, pAdd.getPriceP());
            ps.setString(4, pAdd.getDescriptionP());
            ps.setString(5, pAdd.getImage());
            ps.setInt(6, pAdd.getIdC().getIdC());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProducts(Products pUp) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [nameP] = ?\n"
                + "      ,[quantityP] = ?\n"
                + "      ,[priceP] = ?\n"
                + "      ,[descriptionP] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[idC] = ?\n"
                + " WHERE [idP] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pUp.getNameP());
            ps.setInt(2, pUp.getQuantityP());
            ps.setInt(3, pUp.getPriceP());
            ps.setString(4, pUp.getDescriptionP());
            ps.setString(5, pUp.getImage());
            ps.setInt(6, pUp.getIdC().getIdC());
            ps.setInt(7, pUp.getIdP());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int idP) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE [idP] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idP);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Contact> getAllContact() {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT * FROM Contacts";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact co = new Contact();
                co.setIdCO(rs.getInt("idCO"));
                co.setFullNameCO(rs.getString("fullNameCO"));
                co.setEmailAddressCO(rs.getString("emailAddressCO"));
                co.setPhoneNumberCO(rs.getInt("phoneNumberCO"));
                co.setMessageCO(rs.getString("messageCO"));
                list.add(co);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void deleteContact(int idCO) {
        String sql = "DELETE FROM [dbo].[Contacts]\n"
                + "      WHERE idCO = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idCO);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
