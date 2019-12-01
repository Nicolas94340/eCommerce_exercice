/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import cart.ShoppingCart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.ViewManager;

/**
 *
 * @author nicolasrannou
 */
public class checkoutAction extends Action{
    ShoppingCart sc;
    
    public  checkoutAction(ShoppingCart sc){
        this.sc = sc;
        
    }
    
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        
        sc.clear();
        req.setAttribute("shoppingCart", sc);
        ViewManager.nextView(req, resp, "/view/checkout.jsp");
        System.out.println("hello");
    }
    
}
