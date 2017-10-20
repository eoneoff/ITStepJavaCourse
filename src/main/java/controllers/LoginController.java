package controllers;

import augmentation.DbAccess;
import objects.Basket;
import objects.Order;
import objects.Purchase;
import objects.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class LoginController
{
    @RequestMapping(value = "/login")
    public ModelAndView login()
    {
        return new ModelAndView("login/login");
    }

    @RequestMapping(value = "/login/action")
    public RedirectView loginUser(@RequestParam(value = "login") String login,
                                  @RequestParam(value = "password") String password,
                                  Model model, HttpSession session)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        User user = dba.getUserByLogin(login);
        if(!"".equals(login) && !"".equals(password) && user.getPassword().equals(password))
        {
            Basket basket = (Basket)session.getAttribute("basket");

            basket.setUser(user);

            return new RedirectView((String)session.getAttribute("lastpage"));
        }
        else
            return  new RedirectView("/login");
    }

    @RequestMapping("/logout")
    public RedirectView logout(HttpSession session)
    {
        Basket basket= (Basket) session.getAttribute("basket");

        basket.logout();

        return new RedirectView((String)session.getAttribute("lastpage"));
    }

    @RequestMapping(value="/register")
    public ModelAndView register()
    {
        return new ModelAndView("login/register");
    }

    @RequestMapping(name = "/register/action")
    public RedirectView registerUser(Model model,
                                     @RequestParam(value = "screenname") String screenname,
                                     @RequestParam(value = "login") String login,
                                     @RequestParam(value = "password") String password,
                                     @RequestParam(value = "confPassword") String confPassword,
                                     HttpSession session)

    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        if (!"".equals(login) &&
                !"".equals(password) &&
                !"".equals(confPassword) &&
                password.equals(confPassword) &&
                dba.getUserByLogin(login)==null)
        {
            if ("".equals(screenname))
                screenname=login;
            User user = new User();
            user.setName(screenname);
            user.setLogin(login);
            user.setPassword(password);
            user.setCard("");

            dba.saveUser(user);

            Basket basket = (Basket) session.getAttribute("basket");
            basket.setUser(dba.getUserByLogin(login));


            return new RedirectView((String)session.getAttribute("lastpage"));
        }
        else
        {
            return new RedirectView("/register");
        }
    }
}
