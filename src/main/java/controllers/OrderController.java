package controllers;

import augmentation.DbAccess;
import objects.Basket;
import objects.Order;
import objects.Purchase;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class OrderController
{
    @RequestMapping(value = "/order")
    public ModelAndView order(Model model)
    {
        return new ModelAndView("order/order");
    }

    @RequestMapping(value = "/order/action")
    public RedirectView pay (Model model, HttpSession session)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        Order order = new Order();
        Basket basket = (Basket) session.getAttribute("basket");

        order.setUser(basket.getUser());
        order.setPrice(basket.getTotalPrice());
        order.setPurchases(basket.getPurchaseSet());
        order.setDate(new Date());
        for(Purchase p:basket)
        {
            p.setOrder(order);
        }

        dba.saveOrder(order);

        return new RedirectView("/");
    }
}
