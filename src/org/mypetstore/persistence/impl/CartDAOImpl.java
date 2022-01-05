package org.mypetstore.persistence.impl;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Cart;
import org.mypetstore.domain.CartItem;

import org.mypetstore.persistence.CartDAO;
import org.mypetstore.persistence.DBUtil;
import org.mypetstore.service.CatalogService;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAOImpl implements CartDAO {

    private static final String GetCart = "SELECT ITEMID,QUANTITY FROM CART WHERE USERID = ?";
    private static final String AddItemToCart = "INSERT INTO CART (USERID,ITEMID,QUANTITY) VALUES (?,?,?)";
    private static final String DeleteCart = "DELETE FROM CART WHERE USERID = ?";
    private static final String UpdateCart = "UPDATE CART SET QUANTITY = ? WHERE USERID = ? AND ITEMID = ?";
    private static final String RemoveItemFromCart = "DELETE FROM CART WHERE USERID = ? AND ITEMID = ?";
    @Override
    public Cart getCart(String username) {
        Cart cart = null;
        CatalogService catalogService = null;
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(GetCart);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if (rs != null)
            {
                cart = new Cart();
                catalogService = new CatalogService();
            }
            while (rs.next())
            {
                cart.addItem(catalogService.getItem(rs.getString(1)),catalogService.isItemInStock(rs.getString(1)));
                cart.setQuantityByItemId(rs.getString(1),rs.getInt(2));
            }
            DBUtil.closeAll(conn,ps,rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cart;
    }

    @Override
    public void updateCart(Cart cart,Account account) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(UpdateCart);
            for (int i = 0; i < cart.getNumberOfItems(); i++)
            {
                ps.setInt(1,cart.getCartItemList().get(i).getQuantity());
                ps.setString(2,account.getUsername());
                ps.setString(3,cart.getCartItemList().get(i).getItem().getItemId());
                ps.executeUpdate();
            }
            DBUtil.closeAll(conn,ps,null);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void addItemToCart(Account account, CartItem cartItem) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(AddItemToCart);
            System.out.println("test view order 's account "+ account);
            ps.setString(1,account.getUsername());
            ps.setString(2,cartItem.getItem().getItemId());
            ps.setInt(3,cartItem.getQuantity());
            System.out.println(ps.toString());
            ps.executeUpdate();
            DBUtil.closeAll(conn,ps,null);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void removeCart(Account account) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(DeleteCart);
            ps.setString(1,account.getUsername());
            ps.executeUpdate();
            DBUtil.closeAll(conn,ps,null);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void removeItemFromCart(Account account,String itemId) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(RemoveItemFromCart);
            ps.setString(1,account.getUsername());
            ps.setString(2,itemId);
            ps.executeUpdate();
            DBUtil.closeAll(conn,ps,null);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
