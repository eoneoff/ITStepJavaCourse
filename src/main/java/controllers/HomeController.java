package controllers;

import augmentation.DbAccess;
import objects.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController
{
    @RequestMapping(value = "/")
    public ModelAndView index(Model model, HttpSession session)
    {
        session.setAttribute("lastpage", "/");

        if(session.getAttribute("basket")==null)
            session.setAttribute("basket", new Basket());

        DbAccess dba = null;
        if(session.getAttribute("dba") == null)
        {
            dba=new DbAccess();
            session.setAttribute("dba", dba);
        }
        else
        {
            dba=(DbAccess) session.getAttribute("dba");
        }

        model.addAttribute("articles", dba.loadArticles());

        return new ModelAndView("home/index");
    }

    @RequestMapping("quickadd/{id}")
    public RedirectView quickadd(@PathVariable("id") int id, Model modes)
    {
        modes.addAttribute("Id", id);
        modes.addAttribute("quantity",1);

        return new RedirectView("/addtobasket");
    }

    @RequestMapping("/addtobasket")
    public RedirectView buy (@RequestParam(value = "Id") int Id,
                        @RequestParam(value = "quantity") int quantity,
                        HttpSession session)
    {
        DbAccess dba =(DbAccess) session.getAttribute("dba");

        Purchase purchase = new Purchase();
        purchase.setArticle(dba.getArticleById(Id));
        purchase.setQuantity(quantity);
        Basket basket = (Basket)session.getAttribute("basket");
        basket.addPurhcase(purchase);

        return new RedirectView("/");
    }

    @RequestMapping("/articles/{articleId}")
    public ModelAndView articles(@PathVariable("articleId") final int articleId, Model model, HttpSession session)
    {
        session.setAttribute("lastpage", "/article/"+Integer.toString(articleId));

        DbAccess dba = null;
        if(session.getAttribute("dba") == null)
        {
            dba=new DbAccess();
            session.setAttribute("dba", dba);
        }
        else
        {
            dba=(DbAccess) session.getAttribute("dba");
        }

        Article article = dba.getArticleById(articleId);

        model.addAttribute("article", article);


        return new ModelAndView("home/article");
    }

    @RequestMapping("/emptybasket")
    public RedirectView emptybasket(HttpSession session)
    {
        Basket basket = (Basket)session.getAttribute("basket");

        basket.empty();

        return new RedirectView((String) session.getAttribute("lastpage"));
    }
}
