<%-- 
    Document   : cart
    Created on : 30 oct. 2019, 09:55:18
    Author     : nicolasrannou
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="cart.ShoppingCartItem"%>
<%@page import="cart.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%ShoppingCart sc = (ShoppingCart)request.getAttribute("shoppingCart");
          List<ShoppingCartItem> sci = sc.getItems();
          DecimalFormat df2 = new DecimalFormat("#.##");
        %>
          
        <h1>Your Shopping Cart contains <%out.println(sc.getNumberOfItems());%> items</h1>
        <br>
        <form action="clearcart.do" method="post">
             <input type="submit" name="submit" value="Clear Cart">
        </form>
        <br>
         <form action="init.do" method="post">
             <input type="submit" name="submit" value="Continue Shoppings">
        </form>
        <br>
          <form action="checkout.do" method="post">
             <input type="submit" name="submit" value="Prceed to check out">
        </form>
        <br>
        <table width="50%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
           
        <tr> <font size="2" face="Verdana"></font> 
        
        
          <%for(ShoppingCartItem product : sci ){%>
          <tr>
           <td  width="14%" valign="center" align="middle">
                    <img src="img/products/<%=product.getProduct().getName()%>.png"
                         alt="<%=product.getProduct().getName()%>" >
             </td> 
            <td width="14%" valign="center" align="middle">
                    <%=product.getProduct().getName()%>
                    <br>
                    <%=product.getProduct().getDescription()%>
            </td>
            <td width="14%" valign="center" align="middle">
                    <%=product.getProduct().getPrice()%>€/unit 
            </td>
            
            <td width="14%" valign="center" align="middle">
                    <%=product.getQuantity()%> 
            </td>
             <td width="14%" valign="center" align="middle">
                <form action="updatecart.do" method="post">
                    <input type="hidden" name="productid" value="<%=product.getProduct().getId()%>">
                    <input type="text" name ="quantity">
                    <input type="submit" value="Update" >
                </form>
             </td>
            
          </tr>
          <% } %>
          </table>
          <br>
         <td>Total : <%out.println(df2.format(sc.getTotal()));%> €</td>
    </body>
</html>
