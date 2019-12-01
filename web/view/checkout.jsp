<%-- 
    Document   : checkout
    Created on : 6 nov. 2019, 10:34:44
    Author     : nicolasrannou
--%>

<%@page import="cart.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Proceed to Checkout $$$$ </h1>
        <%
            ShoppingCart sc = (ShoppingCart) request.getAttribute("shoppingCart");
        %>
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_viewcart">
        <input type="hidden" name="upload" value="1">
        <input type="hidden" name="business" value="juninho.rannou@hotmail.fr">
        <input type="hidden" name="item_name" value="sc">
        <input type="hidden" name="currency_code" value="EUR">
        <input type="hidden" name="amount" value="<%sc.getTotal();%>">
        <input type="hidden" name="quantity" value="<%sc.getNumberOfItems();%>">
       
             <input type="image" src="http://www.paypal.com/fr_XC/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
        </form>
    </body>
</html>
