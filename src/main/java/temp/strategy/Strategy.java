//package temp.strategy;
//
//import java.util.ArrayList;
//
///**
// * Created by Mark.W on 2017/3/29.
// * 策略的接口 采用策略模式
// */
//public interface Strategy {
//
//    /**
//     * 在第一次运行时 确定持有的股票
//     * @param stockPool 股票池
//     * @param dates 下一个持有期每天的日期
//     * @return ArrayList<StockYield>
//     */
//    ArrayList<StockYield> initHoldingStocks(StockPool stockPool, ArrayList<String> dates);
//
//    /**
//     * 调仓时计算股票池所有指标量，用来确定持有的股票
//     * @param stockPool 股票池
//     * @param beforeDate 形成期第一天的时间
//     * @param today 调仓当天的时间
//     * @param dates 下一个持有期每天的日期
//     * @return ArrayList<StockYield>
//     */
//    ArrayList<StockYield> rebalanceHoldingStocks(StockPool stockPool, String beforeDate, String today, ArrayList<String> dates);
//}
