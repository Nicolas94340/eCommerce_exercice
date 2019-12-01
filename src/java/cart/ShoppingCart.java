package cart;

import entity.Product;
import java.text.NumberFormat;
import java.util.*;

/**
 *
 * @author juanluis
 */
public class ShoppingCart {
   
    public List<ShoppingCartItem> list ;
  
    public  ShoppingCart()
    {
        list =  new ArrayList <ShoppingCartItem>();
    }
    
    public synchronized void addItem(Product product)
    {
        boolean b = false ;
        
       for(ShoppingCartItem sci : list)
       {
          
           if(sci.getProduct().getId() == product.getId())
           {
              sci.setQuantity(sci.getQuantity()+1);
              b = true ;
           }
       }
       if(!b)
       {
           this.list.add(new ShoppingCartItem(product));
       }
    }
    
    public synchronized void upDate(Product product, String quantity) 
    {
        int ajout = Integer.parseInt(quantity);
        if(ajout > 0)
        {
            for(ShoppingCartItem sci :list )
            {
                if(sci.getProduct().getId() == product.getId())
                {
                    sci.setQuantity(ajout);
                }
            } 
        } 
    }
    
    public synchronized List<ShoppingCartItem> getItems() 
    {
        return list;
    }
    
    public synchronized int getNumberOfItems() 
    {
         int somme = 0; 
         for(ShoppingCartItem sci : list)
       {
           somme = somme + sci.getQuantity(); 
       }
         return somme ; 
    }
    
    public synchronized double getTotal() 
    {
        double total = 0;
        for(ShoppingCartItem sci : list)
       {
           total = total + sci.getTotal(); 
       }
         return total ; 
    } 
    
        public synchronized void clear() 
    {
        list =  new ArrayList <ShoppingCartItem>();
    }
}