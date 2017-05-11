package service.stock;

import vo.stock.StockCollectInputVO;
import vo.stock.StockCurrentVO;

import java.util.ArrayList;

/**
 * Created by Mark.W on 2017/5/10.
 * 收藏股票相关操作的接口
 */
public interface CollectStockService {

    /**
     * 获取个人收藏的股票信息
     * @param userID 用户id
     * @return 股票信息列表
     */
    public ArrayList<StockCurrentVO> getCollectedStocks(String userID);

    /**
     * 个人收藏股票
     * @param stockCollectInputVO userid和股票代码
     * @return boolean
     */
    public boolean collectStock(StockCollectInputVO stockCollectInputVO);

    /**
     * 删除收藏的股票
     * @param stockCollectInputVO userid和股票代码
     * @return boolean
     */
    public boolean deleteCollectedStock(StockCollectInputVO stockCollectInputVO);
}