<%-- 
    Document   : category
    Created on : 9 oct. 2019, 16:32:57
    Author     : nicolasrannou
--%>

<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %>
<%@ page import="cart.ShoppingCartItem" %>
<%@ page import="cart.ShoppingCart" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <style>
table, th, td {
  border: 1px solid black;
}
a {

}
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>


    <body>
        <h1> Products of <%out.println(request.getAttribute("categoryname"));%></h1>
        <%  int numberitems;
            if((Integer)request.getAttribute("numbershoppingCart") != null)
        {
                numberitems = (Integer)request.getAttribute("numbershoppingCart");
         }
        else 
        {
                 numberitems = 0;
        }%>
        
        <p> <img src="img/cart.gif"><%out.println(numberitems);%>items    
        <button> <a href="viewcart.do?"> View Cart </a> </button></p>
        
        
        
        
    <table width="50%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
           
        <tr> <font size="2" face="Verdana">  
         <td rowspan="5" width="14%"  align="middle" >
               <a href="category.do?categoryid=<%=1%>">
                  bakery 
               </a>
               <br>
               <a href="category.do?categoryid=<%=2%>">
                  dairy 
               </a> 
                <br>
                <a href="category.do?categoryid=<%=3%>">
                  fruitVeg 
               </a>
                <br>
               <a href="category.do?categoryid=<%=4%>">
                  meats 
               </a>
            </td> 
 
        </tr>
           

        <%
        List<Product> products = (List<Product>)request.getAttribute("product");
        
        
        for(Product product : products ){
            if(product.getCategory().getId().equals(Integer.parseInt(request.getParameter("categoryid"))))
            {
            
            
        %>
        <tr>
              
           
             <td  width="14%" valign="center" align="middle">
                    <img src="img/products/<%=product.getName()%>.png"
                         alt="<%=product.getName()%>" >
             </td> 
            <td width="14%" valign="center" align="middle">
                    <%=product.getName()%>
                    <br>
                    <%=product.getDescription()%>
            </td>
             <td width="14%" valign="center" align="middle">
                    <%=product.getPrice()%> €
            </td>
             <td width="14%" valign="center" align="middle">
                 <form action="neworder.do" method="post">
                                        <input type="hidden" name="productid" value="<%=product.getId()%>">
                                        <input type="hidden" name="categoryid" value="<%=product.getCategory().getId()%>">
                                        <input type="submit" name="submit" value="add to cart">
                                    </form>
               
            </td>
        </tr>
            <% } %>
        <% } %>
        
    

    </table>

    </body>
</html>
