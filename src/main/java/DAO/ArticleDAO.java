/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ENTITES.Article;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Persistence;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

/**
 *
 * @author dell
 */
public class ArticleDAO {
    EntityManager em;
    EntityTransaction tx;
    
    public ArticleDAO() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
        em = emf.createEntityManager();
        //tx = em.getTransaction();
        
    }
    
    public void add(Article d) {
        em.getTransaction().begin();
        em.persist(d);
        em.getTransaction().commit();
    }
   public boolean update(Article d) {
       if(findById(d.getCode()) == null)
       { System.err.println("PAS d'Article!!");  return false;}
        em.getTransaction().begin();
        try
        {
            em.merge(d);
        }
        catch(Exception ex)
        {
            em.getTransaction().commit();
            return false;
        }
        em.getTransaction().commit();
        return true;
    }


    public List<Article> findAll() {
        Query req = em.createQuery(" select d from Article d");
        return req.getResultList();

    }

    public Article findById(String code) {
        Article d;
        em.getTransaction().begin();
        d = em.find(Article.class, code);
        em.getTransaction().commit();
        return d;
    }
    
    public void remove(Article d){
        em.getTransaction().begin();
        em.remove(d);
        em.getTransaction().commit();
    }
    /*private static List<Article> listArticles = new ArrayList<Article>();
    public static void create(Article a)
    {
        listArticles.add(a);
    }
    public static void delete(Article a)
    {
        listArticles.remove(a);
    }
    public static void update(Article a)
    {
        int position = listArticles.indexOf(a);
        listArticles.get(position).setDesignation(a.getDesignation());
        listArticles.get(position).setPrix(a.getPrix());
    }
    public static List<Article> getAll()
    {
        return listArticles;
    }
    
    public static Article getItem(Article a)
    {
        int position = listArticles.lastIndexOf(a);
        return listArticles.get(position);
    }*/
}
