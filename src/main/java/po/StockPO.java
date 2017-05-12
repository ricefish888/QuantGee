package po;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;

public class StockPO {

    private String stockCode;
    private String stockName;
    private String stockMarket;

    private String date;
    private double open;
    private double high;
    private double close;
    private double low;
    private int volume;
    private double price_change;
    private double p_change;
    private double ma5;
    private double ma10;
    private double ma20;
    private double v_ma5;
    private double v_ma10;
    private double v_ma20;
    private double turnover;

    public StockPO(){}

    /**
     *
     * @param stockCode 股票代码
     * @param stockName 股票名称
     * @param stockMarket 股票市场
     * @param date  日期
     * @param open 开盘价
     * @param high 最高价
     * @param close 收盘价
     * @param low 最低价
     * @param volume 成交量
     * @param price_change 价格变动
     * @param p_change 涨跌幅
     * @param ma5 五日均价
     * @param ma10 十日均价
     * @param ma20 二十日均价
     * @param v_ma5 五日均量
     * @param v_ma10 十日均量
     * @param v_ma20 二十日均量
     * @param turnover 换手率
     */
    public StockPO(String stockCode , String stockName , String stockMarket ,
                   String date , double open , double high , double close , double low,
                   int volume , double price_change , double p_change ,
                   double ma5 , double ma10 , double ma20 , double v_ma5 ,
                   double v_ma10 , double v_ma20 , double turnover){
        this.stockCode = stockCode;
        this.stockName = stockName;
        this.stockMarket = stockMarket;

        this.date = date;
        this.open = open;
        this.high = high;
        this.close = close;
        this.low = low;
        this.volume = volume;
        this.price_change = price_change;
        this.p_change = p_change;
        this.ma5 = ma5;
        this.ma10 = ma10;
        this.ma20 = ma20;
        this.v_ma5 = v_ma5;
        this.v_ma10 = v_ma10;
        this.v_ma20 = v_ma20;
    }

    public String getStockCode() {
        return stockCode;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public String getStockMarket() {
        return stockMarket;
    }

    public void setStockMarket(String stockMarket) {
        this.stockMarket = stockMarket;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getOpen() {
        return open;
    }

    public void setOpen(double open) {
        this.open = open;
    }

    public double getHigh() {
        return high;
    }

    public void setHigh(double high) {
        this.high = high;
    }

    public double getClose() {
        return close;
    }

    public void setClose(double close) {
        this.close = close;
    }

    public double getLow() {
        return low;
    }

    public void setLow(double low) {
        this.low = low;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public double getPrice_change() {
        return price_change;
    }

    public void setPrice_change(double price_change) {
        this.price_change = price_change;
    }

    public double getP_change() {
        return p_change;
    }

    public void setP_change(double p_change) {
        this.p_change = p_change;
    }

    public double getMa5() {
        return ma5;
    }

    public void setMa5(double ma5) {
        this.ma5 = ma5;
    }

    public double getMa10() {
        return ma10;
    }

    public void setMa10(double ma10) {
        this.ma10 = ma10;
    }

    public double getMa20() {
        return ma20;
    }

    public void setMa20(double ma20) {
        this.ma20 = ma20;
    }

    public double getV_ma5() {
        return v_ma5;
    }

    public void setV_ma5(double v_ma5) {
        this.v_ma5 = v_ma5;
    }

    public double getV_ma10() {
        return v_ma10;
    }

    public void setV_ma10(double v_ma10) {
        this.v_ma10 = v_ma10;
    }

    public double getV_ma20() {
        return v_ma20;
    }

    public void setV_ma20(double v_ma20) {
        this.v_ma20 = v_ma20;
    }

    public double getTurnover() {
        return turnover;
    }

    public void setTurnover(double turnover) {
        this.turnover = turnover;
    }

}
