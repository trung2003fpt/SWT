package dal;

import java.util.List;
import model.*;

public interface DAOInterface {

    int getDefaultRoleId();

    int getIdPbyNameP(String nameP);

    Accounts getAccount(String name, String password);

    boolean emailExists(String email);

    boolean nameAExists(String nameA);

    Object existAddProductAdmin(String nameP, String image, String descriptionP);

    Object existUpProductAdmin(String nameP, String descriptionP);

    void insertAccount(Accounts account);

    List<Products> getAllProducts();

    List<Products> getProducts();

    List<Categories> getCategory();

    Categories getCategoryById(int idC);

    List<Products> getProductsByPid(int idP);

    List<Products> getProductsByCategoryId(int cid);

    List<Products> search(String name);

    List<Products> getProductsByID(int idP);

    List<Products> getRandomProductsForCategory(int idC);

    void insertContact(Contact c);

    void insertProduct(Products pAdd);

    void updateProducts(Products pUp);

    void deleteProduct(int idP);

    List<Contact> getAllContact();

    void deleteContact(int idCO);
}
