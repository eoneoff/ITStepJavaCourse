package objects;

import java.util.*;

public class Basket implements Iterable<Purchase>
{
    private User user;
    private LinkedList<Purchase> purchases = new LinkedList<Purchase>();
    private int totalPrice=0;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void addPurhcase(Purchase purchase)
    {
        purchases.add(purchase);
        totalPrice+= purchase.getArticle().getPrice()* purchase.getQuantity();
    }

    public Iterator<Purchase> iterator()
    {
        return purchases.iterator();
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public int getQuantity()
    {
        return purchases.size();
    }

    public Set<Purchase> getPurchaseSet()
    {
        return new HashSet(purchases);
    }

    public void empty()
    {
        purchases.clear();
        totalPrice = 0;
    }

    public void logout()
    {
        user = null;
        empty();
    }
}
