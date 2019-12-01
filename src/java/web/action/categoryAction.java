/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import entity.Category;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

/**
 *
 * @author nicolasrannou
 */
public class categoryAction extends Action{
    
    
     CategoryModel categoryModel;
     ProductModel productModel;
     
     public  categoryAction(CategoryModel categoryModel, ProductModel productModel){
        this.categoryModel = categoryModel;
        this.productModel = productModel;
    }
     public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("product", productModel.retrieveAll());
        ViewManager.nextView(req, resp, "/view/category.jsp");
        System.out.println("hello");
    }
    
}
