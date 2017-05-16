package logic.stock;

import DAO.stockInfoDAO.StockInfoDAO;
import service.stock.MarketInfoService;
import vo.stock.MarketInfoVO;

import java.util.ArrayList;

/**
 * Created by Mark.W on 2017/5/15.
 */
public class MarketInfoServiceImp implements MarketInfoService{
    private StockInfoDAO stockInfoDAO;

    @Override
    public MarketInfoVO getRealTimeMarketInfo(String marketType) {
        return null;
    }

    @Override
    public ArrayList<MarketInfoVO> getHistoryMarketInfo(String marketType, String startDate, String endDate) {
        return null;
    }

    public StockInfoDAO getStockInfoDAO() {
        return stockInfoDAO;
    }

    public void setStockInfoDAO(StockInfoDAO stockInfoDAO) {
        this.stockInfoDAO = stockInfoDAO;
    }
}
