package logic.strategy;

import logic.tools.DateHelper;
import po.StockPO;
import vo.*;

import java.util.ArrayList;
import java.util.Date;

/**
 * 动量策略计算累计收益率
 * Created by Mark.W on 2017/4/4.
 */
public class MomentumBackTesting {
    private final double INIT_FUND = 1000; //起始资金
    private double income = INIT_FUND;      //总本金+收益
    private double tempIncome = income;  //记录上一个周期的本金+收益，用于计算周期收益率

    private StockPool stockPool;

    private int holdingPeriod;  //持有期
    private int returnPeriod;    //形成期
    private int holdingStockNum;  //每个持有期持有的股票数量
    private ArrayList<HoldingStock> holdingStocks;

    private ArrayList<CumulativeYieldGraphDataVO> cumulativeYieldGraphDataVOS;  //每天的收益率
    private ArrayList<BaseCumulativeYieldGraphDataVO> baseCumulativeYieldGraphDataVOS; //基准收益率

    private ArrayList<Double> yieldPerPeriod;     //每个持有期结束后的收益率

    private BackTestingResultVO backTestingResultVO;

    /**
     * @param stockPool 股票池
     * @param holdingPeriod 持有期
     * @param returnPeriod 形成期
     */
    public MomentumBackTesting(StockPool stockPool, int holdingPeriod, int returnPeriod) {
        this.stockPool = stockPool;

        this.holdingPeriod = holdingPeriod;
        this.returnPeriod = returnPeriod;
        this.holdingStockNum = stockPool.getStockInfos().size() / 5;
        this.holdingStocks = new ArrayList<>();

        this.cumulativeYieldGraphDataVOS = new ArrayList<>();
        this.baseCumulativeYieldGraphDataVOS = new ArrayList<>();
        this.yieldPerPeriod = new ArrayList<>();
    }

    /**
     *  执行回测的主程序
     */
    public void start() {
        int startIndex = this.returnPeriod;

        ArrayList<StockPO> stockPOS = stockPool.getIndexStocks();
        //确定开始日期 stockPOS的index
        for(int i=0; i<stockPOS.size(); ++i) {
            Date d = DateHelper.getInstance().stringTransToDate(stockPOS.get(i).getDate());
            int num = DateHelper.getInstance().calculateDaysBetween(d, stockPool.getStartDate());
            if(num < 0) {
                break;
            }

            if(num == 0) {
                startIndex = i;
            }
        }


        int index = 0;  //记录是否达到一个holdingPeriod的index
        this.initHoldingStockOnfirstRun();
        //循环主体
        for(int i=startIndex; i<stockPOS.size(); ++i) {
            Date temp = DateHelper.getInstance().stringTransToDate(stockPOS.get(i).getDate());

            if(index == holdingPeriod) { //若达到holdingPeriod index置0 同时进行rebalance
                index = 0;                  //前一天进行调仓
                this.rebalance(temp);
            } else {
                index ++;
            }

            this.calculateBaseCumlativeYield(temp);         //基准收益率计算 用今日adj
            this.calculateHoldingStockYield(temp);          //计算收益， 用昨日adj

            if(i == stockPOS.size()-1 && index > 0 && index < holdingPeriod) {
                this.sellStock(temp);                       //如果最后剩余的天数不足holdingPeriod，仍然计算周期收益率
                this.calculatePeriodYield();
            }
        }

        this.finish();
    }

    /**
     * 计算基准收益率
     * @param date 日期
     */
    private void calculateBaseCumlativeYield(Date date) {
        int stockNum = 0;
        double yield = 0;
        for(int i=0; i<stockPool.getStockInfos().size(); ++i) {
            StockPO firstDay = stockPool.getStockInfos().get(i).getStartDateStockPO();
            StockPO today = stockPool.getStockInfos().get(i).getStockByDate(date);

            if(firstDay == null || today == null) {
                continue;
            }
            //计算基准累计收益，昨天的收盘价- returnPeriod天前的收盘价)/ returnPeriod天前的收盘价
            yield += (today.getADJ()-firstDay.getADJ())/firstDay.getADJ();
            stockNum ++;
        }

        yield /= stockNum;

        this.baseCumulativeYieldGraphDataVOS.add(new BaseCumulativeYieldGraphDataVO(date, yield));
    }

    /**
     * 计算持有股票每天的收益，并将数据存入cumulativeYieldGraphDataVOS
     * @param date 日期
     */
    private void calculateHoldingStockYield(Date date) {
        double yield = 0;

        for(int i = 0; i<this.holdingStocks.size(); ++i) {
            StockPO stockPO = stockPool.findSpecificStock(this.holdingStocks.get(i).getStockCode(), date);

            if(stockPO == null) {  //如果该天的股票数据没有 暂时放弃该股票
                continue;
            }

            yield += this.holdingStocks.get(i).getNumOfStock() * stockPO.getADJ();
        }

        //计算累计收益率
        yield = (yield-this.INIT_FUND)/this.INIT_FUND;

        this.cumulativeYieldGraphDataVOS.add(new CumulativeYieldGraphDataVO(date, yield));
    }


    /**
     * 在第一次运行时 确定持有的股票
     */
    private void initHoldingStockOnfirstRun() {
        ArrayList<StockYield> stockYields = new ArrayList<>();

        for(int i=0; i<stockPool.getStockInfos().size(); ++i) {
            StockPO before = stockPool.getStockInfos().get(i).getBeforeStockPO();
            StockPO yesterday = stockPool.getStockInfos().get(i).getYesterdayStock();

            if(yesterday == null || before == null) {
                continue;
            }

            //计算收益，昨天的收盘价- returnPeriod天前的收盘价)/ returnPeriod天前的收盘价
            double yield = (yesterday.getADJ()-before.getADJ())/before.getADJ();

            stockYields.add(new StockYield(yesterday.getStockCode(), yield));
        }

        Date date = DateHelper.getInstance().formerTradeDay(this.stockPool.getStartDate());

        this.initTopNStocksAndBuy(stockYields, date);
    }

    /**
     * 一个持有期结束
     * 计算指定日期所有股票形成期收益，并获取前holdingStockNum个的股票代码
     * @param date 该日期的前一天的收盘价用于计算
     */
    private void rebalance(Date date) {
        Date oneDayBeforeDate = DateHelper.getInstance().formerTradeDay(date);     //该日期的前一天的收盘价用于计算
        Date beforeDate = DateHelper.getInstance().formerNTradeDay(date, returnPeriod);

        this.sellStock(oneDayBeforeDate);           //卖出所有持有的且当天没有停盘的股票
        this.calculatePeriodYield();


        //计算股票池內所有股票的收益率 用于确定下次持有的股票
        ArrayList<StockYield> stockYields = new ArrayList<>();
        for(int i=0; i<stockPool.getStockInfos().size(); ++i) {
            StockPO before = stockPool.getStockInfos().get(i).getStockByDate(beforeDate);
            StockPO yesterday = stockPool.getStockInfos().get(i).getStockByDate(oneDayBeforeDate);

            if(yesterday == null || before == null) {
                continue;
            }
            //计算收益，昨天的收盘价- returnPeriod天前的收盘价)/ returnPeriod天前的收盘价
            double yield = (yesterday.getADJ()-before.getADJ())/before.getADJ();

            stockYields.add(new StockYield(yesterday.getStockCode(), yield));
        }

        //确定前n的股票，并买入
        this.initTopNStocksAndBuy(stockYields, oneDayBeforeDate);

    }

    /**
     * 计算每个持有期结束后的收益率
     */
    private void calculatePeriodYield() {
        double yield = (income-tempIncome)/tempIncome;
        this.yieldPerPeriod.add(yield);
    }

    /**
     * 从所有股票的收益率中选取前holdingStockNum作为持有的股票
     * @param stockYields stockYields
     * @param date  用于确定特定一天的adj， 确定每只股票买多少股
     */
    private void initTopNStocksAndBuy(ArrayList<StockYield> stockYields, Date date) {
        //冒泡排序 排序holdingStockNum次 得到收益前holdingStockNum的股票
        for(int i=stockYields.size()-1;i>stockYields.size()-holdingStockNum-1; i--) {
            for(int j=0; j<i; ++ j) {
                if(stockYields.get(j).getYield() < stockYields.get(j+1).getYield()) {
                    StockYield temp = stockYields.get(j);
                    stockYields.set(j, new StockYield(stockYields.get(j+1).getStockCode(), stockYields.get(j+1).getYield()));
                    stockYields.set(j+1, temp);
                }
            }
        }

        //买入股票
        double moneyEachStock = income/this.holdingStockNum;
        for(int i=0; i<holdingStockNum; ++ i) {
            if(this.holdingStocks.size() < this.holdingStockNum) {      //持有数量只能为holdingStockNum
                double adj = this.stockPool.findSpecificStock(stockYields.get(i).getStockCode(), date).getADJ();
                double numOfStock = moneyEachStock/adj;

                this.holdingStocks.add(new HoldingStock(stockYields.get(i).getStockCode(), numOfStock));
            }
        }
    }

    /**
     * 卖出股票
     * @param date 指定日期
     */
    private void sellStock(Date date) {
        tempIncome  = income;
        income = 0;  //当前本金+收益

        ArrayList<HoldingStock> temp = new ArrayList<>();

        for (int i = 0; i < this.holdingStocks.size(); ++i) {
            double numOfStock = this.holdingStocks.get(i).getNumOfStock();
            StockPO stockPO = this.stockPool.findSpecificStock(this.holdingStocks.get(i).getStockCode(), date);

            if (stockPO != null) {
                double adj = this.stockPool.findSpecificStock(this.holdingStocks.get(i).getStockCode(), date).getADJ();
                income += numOfStock * adj;
            } else {                    //如果当天股票停盘 继续持有该股票
                temp.add(this.holdingStocks.get(i));
            }
        }

        this.holdingStocks.clear();

        if (temp.size() != 0) {
            for (int i = 0; i < temp.size(); ++i) {
                this.holdingStocks.add(temp.get(i));
            }
        }
    }

    /**
     * 计算分析结果数据
     */
    private void finish() {
        StrategyDataAnlysis analysis = new StrategyDataAnlysis();

        //计算累计收益率图的有关数据
        CumulativeYieldGraphVO cumulativeYieldGraphVO = analysis.analyseCumulativeYieldGraph(income, this.INIT_FUND, stockPool.getTradeDays(),
                cumulativeYieldGraphDataVOS, baseCumulativeYieldGraphDataVOS);

        //计算有关频率分布直方图的数据
        YieldHistogramGraphVO yieldHistogramGraphVO = analysis.analyseYieldHistogram(this.yieldPerPeriod);

        this.backTestingResultVO = new BackTestingResultVO(cumulativeYieldGraphVO,yieldHistogramGraphVO);
    }

    /**
     * 获取超额收益率
     * @return 超额收益率
     */
    public double getAbnormalReturn() {
        double result = new StrategyDataAnlysis().analyseAbnormalReturn(income, INIT_FUND, baseCumulativeYieldGraphDataVOS);
        return result;
    }

    /**
     * 获取策略胜率
     * @return 策略胜率
     */
    public double getWinRate() {
        double result = this.backTestingResultVO.yieldHistogramGraphVO.winRate;
        return result;
    }


    public BackTestingResultVO getBackTestingResultVO() {
        return backTestingResultVO;
    }
}
