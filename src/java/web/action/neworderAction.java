/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import cart.ShoppingCart;
import entity.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

/**
 *
 * @author nicolasrannou
 */
public class neworderAction extends Action {
     CategoryModel categoryModel;
     ProductModel productModel;
     ShoppingCart sc;
     
      public  neworderAction(CategoryModel categoryModel, ProductModel productModel,ShoppingCart sc){
        this.categoryModel = categoryModel;
        this.productModel = productModel;
        this.sc = sc;
        
    }
       public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("product", productModel.retrieveAll());
        req.setAttribute("category", categoryModel.retrieveAll());
        int productid = Integer.parseInt(req.getParameter("productid"));
        Product p = productModel.findP(productid);
        sc.addItem(p);
        req.setAttribute("numbershoppingCart", sc.getNumberOfItems());
        ViewManager.nextView(req, resp, "/view/category.jsp");
        System.out.println("hello");
    }
      
}
