package augmentation;

import objects.Article;
import objects.Order;
import objects.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class DbAccess
{
    private SessionFactory factory;

    public DbAccess()
    {
        Configuration configuration = new Configuration();
        configuration.configure("hbm.xml");
        factory = configuration.buildSessionFactory();

    }

    public List<Article> loadArticles()
    {
        try(Session session = factory.openSession();)
        {
            Query query = session.createQuery("from Article");
            return query.list();
        }
    }

    public Article getArticleById(int Id)
    {
        Article article;
        try(Session session = factory.openSession())
        {
            Query query = session.createQuery("from Article A where A.id=:articleId");
            query.setParameter("articleId", Id);
            article = (Article)query.uniqueResult();
        }

        return article;
    }

    public User getUserByLogin (String login)
    {
        User user;
        try(Session session = factory.openSession())
        {
            Query query = session.createQuery("from User U where U.login=:login");
            query.setParameter("login", login);
            user = (User)query.uniqueResult();
        }

        return  user;
    }

    public void saveUser(User user)
    {
        try(Session session = factory.openSession())
        {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        }
    }

    public void saveOrder(Order order)
    {
        try(Session session = factory.openSession())
        {
            session.beginTransaction();
            session.save(order);
            session.getTransaction().commit();
        }
    }

    public void updateArticle(int id, String name, float price)
    {
        try(Session session = factory.openSession())
        {
           session.beginTransaction();
           Query query = session.createQuery("update Article set name=:name,"+
                                                "price=:price where id=:id");
           query.setParameter("name", name);
           query.setParameter("price", price);
           query.setParameter("id", id);
           query.executeUpdate();
           session.getTransaction().commit();
        }
    }

    public void deleteArticle(int id)
    {
        try(Session session = factory.openSession())
        {
            session.beginTransaction();
            Query query = session.createQuery("delete Article where id=:id");
            query.setParameter("id", id);
            query.executeUpdate();
            session.getTransaction().commit();
        }
    }

    public  void saveArticle(Article article)
    {
        try(Session session = factory.openSession() )
        {
            session.beginTransaction();
            session.save(article);
            session.getTransaction().commit();
        }
    }

    public List<User> getUsers()
    {
        try(Session session = factory.openSession())
        {
            Query query = session.createQuery("from User");
            return query.list();
        }
    }

    public void deleteUser(int id)
    {
        try(Session session = factory.openSession())
        {
            session.beginTransaction();
            Query query = session.createQuery("delete User where id=:id");
            query.setParameter("id", id);
            query.executeUpdate();
            session.getTransaction().commit();
        }
    }

    public  List<Order> getOrders()
    {
        try(Session session = factory.openSession())
        {
            Query query = session.createQuery("from Order");
            return query.list();
        }
    }
}
