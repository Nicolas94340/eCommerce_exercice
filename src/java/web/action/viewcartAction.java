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
public class viewcartAction extends Action{
    ShoppingCart sc;
    
    public  viewcartAction(ShoppingCart sc){
        this.sc = sc;
        
    }
    
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("shoppingCart", sc);
        ViewManager.nextView(req, resp, "/view/viewcart.jsp");
        
        System.out.println("hello");
    }
    
}
