package controllers;

import augmentation.DbAccess;
import objects.Article;
import objects.Basket;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController
{
    @RequestMapping("")
    public ModelAndView check(HttpSession session)
    {
        Basket basket = (Basket)session.getAttribute("basket");
        if (basket==null || basket.getUser() == null || !basket.getUser().isAdmin())
        {
            return new ModelAndView("");
        }
        else
            return new ModelAndView("/admin/admin");
    }

    @RequestMapping("/base")
    public ModelAndView base(HttpSession session, Model model)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        model.addAttribute("articles", dba.loadArticles());

        return new ModelAndView("/admin/base");
    }

    @RequestMapping("/base/update")
    public RedirectView updateArticle (@RequestParam(value = "id") int id,
                                @RequestParam(value = "name") String name,
                                @RequestParam(value = "price") float price,
                                HttpSession session)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        dba.updateArticle(id, name, price);

        return new RedirectView("/admin/base");
    }

    @RequestMapping("/base/delete")
    public RedirectView deleteArticle(@RequestParam(value="id") int id,
                        HttpSession session)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        dba.deleteArticle(id);

        return new RedirectView("/admin/base");
    }

    @RequestMapping("/base/insert")
    public RedirectView insertArticle(@RequestParam(value = "name") String name,
                               @RequestParam(value = "price") float price,
                               HttpSession session)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        Article article = new Article();
        article.setName(name);
        article.setPrice(price);

        dba.saveArticle(article);

        return new RedirectView("/admin/base");
    }

    @RequestMapping("/users")
    public ModelAndView users(HttpSession session, Model model)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        model.addAttribute("users", dba.getUsers());

        return  new ModelAndView("/admin/users");
    }

    @RequestMapping("/users/delete")
    public RedirectView deleteUser(HttpSession session, Model model,
                                   @RequestParam(value = "id") int id)
    {
        DbAccess dba = (DbAccess) session.getAttribute("dba");

        dba.deleteUser(id);

        model.addAttribute("users",dba.getUsers());

        return new RedirectView("/admin/users");
    }

    @RequestMapping("/orders")
    public ModelAndView orders(HttpSession session, Model model)
    {
        DbAccess dba = (DbAccess)session.getAttribute("dba");

        model.addAttribute("orders",dba.getOrders());

        return new ModelAndView("/admin/orders");
    }

}
