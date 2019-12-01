/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entity.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductModel;
import web.ViewManager;

/**
 *
 * @author nicolasrannou
 */
public class updatecartAction extends Action{
    
    ProductModel productmodel; 
    ShoppingCart sc;
    
     public  updatecartAction(ProductModel pm ,ShoppingCart shoppingcart){
        this.productmodel = pm;
        this.sc = shoppingcart;
    }
     
     public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("product", productmodel.retrieveAll());
        String newquantity = req.getParameter("quantity");
        int productid = Integer.parseInt(req.getParameter("productid"));
        Product p = productmodel.findP(productid);
        System.out.println(p);
        sc.upDate(p, newquantity);
        req.setAttribute("shoppingCart", sc);
        ViewManager.nextView(req, resp, "/view/viewcart.jsp");
        
        System.out.println("hello");
    }
}
