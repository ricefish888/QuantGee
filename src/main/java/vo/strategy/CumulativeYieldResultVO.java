package vo.strategy;

import logic.tools.MathHelper;
import vo.stock.LineVO;

import java.util.ArrayList;

/**
 * Created by Mark.W on 2017/3/23.
 * 累计收益率图的信息类
 */
public class CumulativeYieldResultVO {
    private double annualRevenue;       //年化收益率
    private double baseAnnualRevenue;  //基准年化收益率
    private double alpha;
    private double beta;
    private double sharpeRatio;  //夏普比率
    private double maxDrawdown;  //最大回撤
    private ArrayList<LineVO> yieldData;       //策略收益率
    private ArrayList<LineVO> baseYieldData; //基准收益率

    /**
     * 收益率图
     * @param annualRevenue 年化收益率
     * @param baseAnnualRevenue 基准年化收益率
     * @param alpha alpha
     * @param beta beta
     * @param sharpeRatio 夏普比率
     * @param maxDrawdown 最大回撤
     * @param yieldData 收益坐标信息
     * @param baseYieldData  基准收益坐标信息
     */
    public CumulativeYieldResultVO(double annualRevenue, double baseAnnualRevenue, double alpha,
                                   double beta, double sharpeRatio, double maxDrawdown,
                                   ArrayList<LineVO> yieldData, ArrayList<LineVO> baseYieldData) {
        this.annualRevenue = MathHelper.formatData(annualRevenue*100,2);
        this.baseAnnualRevenue = MathHelper.formatData(baseAnnualRevenue*100,2);
        this.alpha = alpha;
        this.beta = beta;
        this.sharpeRatio = sharpeRatio;
        this.maxDrawdown = MathHelper.formatData(maxDrawdown*100,2);
        this.yieldData = yieldData;
        this.baseYieldData = baseYieldData;
    }

    public double getAnnualRevenue() {
        return annualRevenue;
    }

    public double getBaseAnnualRevenue() {
        return baseAnnualRevenue;
    }

    public double getAlpha() {
        return alpha;
    }

    public double getBeta() {
        return beta;
    }

    public double getSharpeRatio() {
        return sharpeRatio;
    }

    public double getMaxDrawdown() {
        return maxDrawdown;
    }

    public ArrayList<LineVO> getYieldData() {
        return yieldData;
    }

    public ArrayList<LineVO> getBaseYieldData() {
        return baseYieldData;
    }
}
