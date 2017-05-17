package data.newsData;

import DAO.NewsDAO.NewsDAO;
import bean.MarketInfo;
import bean.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by wangxue on 2017/5/17.
 */
public class NewsData implements NewsDAO {
    @Override
    public Iterator<News> getNews() {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            configuration.addClass(News.class);

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            String hql = "FROM News n";
            Iterator<News> iterator = session.createQuery(hql).list().iterator();

            transaction.commit();
            session.close();
            sessionFactory.close();

            return iterator;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}