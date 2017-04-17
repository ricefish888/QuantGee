package logic.strategy;

import po.StockPO;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Mark.W on 2017/3/29.
 * 动量策略
 */
public class MomentumDriveStrategy implements Strategy {

    @Override
    public ArrayList<StockYield> initHoldingStocks(StockPool stockPool) {
        ArrayList<StockYield> stockYields = new ArrayList<>();

        for(int i = 0; i<stockPool.getStocksList().size(); ++i) {
            StockPO before = stockPool.getStocksList().get(i).getBeforeStockPO();
            StockPO yesterday = stockPool.getStocksList().get(i).getYesterdayStock();

            if(yesterday != null && before != null) {
                //计算收益，昨天的收盘价- returnPeriod天前的收盘价)/ returnPeriod天前的收盘价
                double yield = (yesterday.getADJ()-before.getADJ())/before.getADJ();

                stockYields.add(new StockYield(yesterday.getStockCode(), yield));
            }
        }


        System.out.println("  " +stockPool.getStocksList().size());
        System.out.println("  " +stockYields.size());
        System.out.println("  " + (stockPool.getStocksList().get(0).getBeforeStockPO() == null));
        System.out.println("  " + (stockPool.getStocksList().get(0).getYesterdayStock() == null));

        return stockYields;
    }

    @Override
    public ArrayList<StockYield> rebalanceHoldingStocks(StockPool stockPool, String beforeDate, String today) {

        ArrayList<StockYield> stockYields = new ArrayList<>();

        for(int i = 0; i<stockPool.getStocksList().size(); ++i) {
            StockPO before = stockPool.getStocksList().get(i).getStockByDate(beforeDate);
            StockPO yesterday = stockPool.getStocksList().get(i).getStockByDate(today);

            if(yesterday != null && before != null) {
                //计算收益，昨天的收盘价- returnPeriod天前的收盘价)/ returnPeriod天前的收盘价
                double yield = (yesterday.getADJ()-before.getADJ())/before.getADJ();

                stockYields.add(new StockYield(yesterday.getStockCode(), yield));
            }

        }

//        if(stockYields.size() == 0) {
//            System.out.println(stockPool.getStocksList().get(0).getStockCode());
//            System.out.println(stockPool.getStocksList().get(0).getStockByDate(beforeDate) == null);
//            System.out.println(stockPool.getStocksList().get(0).getStockByDate(today) == null);
//            System.out.println("!!!!!!!!!!!!!!!!!!!size is 0");
//            System.out.println("!!!!!!!!!!!!!!!!!!!" + DateHelper.getInstance().dateTransToString(beforeDate));
//            System.out.println("!!!!!!!!!!!!!!!!!!!" + DateHelper.getInstance().dateTransToString(today));
//            for(int i=0; i<stockPool.getStocksList().size(); ++i) {
//                StockPO before = stockPool.getStocksList().get(i).getStockByDate(beforeDate);
//                StockPO yesterday = stockPool.getStocksList().get(i).getStockByDate(today);
//
//                if(yesterday == null || before == null) {
//                    System.out.print(stockPool.getStocksList().get(i).getStockCode() + "  ");
//                    System.out.print(DateHelper.getInstance().dateTransToString(beforeDate) + "  ");
//                    System.out.println(DateHelper.getInstance().dateTransToString(today));
//                }
//
//            }
//        }

        return stockYields;
    }
}
