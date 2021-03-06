package data.stockInfoData;

import DAO.stockInfoDAO.CollectStockDAO;
import bean.CollectStock;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;

/**
 * Created by wangxue on 2017/5/24.
 */
@Transactional
public class CollectStockData implements CollectStockDAO {

    private HibernateTemplate hibernateTemplate;
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public Iterator<String> getCollectedStocks(String userID) {
        Iterator<String> iterator = (Iterator<String>) hibernateTemplate
                .find("select c.code from CollectStock c where c.userId=? ",userID).iterator();
        return iterator;
    }

    @Override
    public boolean addCollectedStock(String userID, String code) {
        CollectStock collectStock = new CollectStock();
        collectStock.setUserId(userID);
        collectStock.setCode(code);
        hibernateTemplate.save(collectStock);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public boolean removeCollectedStock(String userID, String code) {
        CollectStock collectStock = new CollectStock();
        collectStock.setUserId(userID);
        collectStock.setCode(code);
        hibernateTemplate.delete(collectStock);
        return true;
    }

}
