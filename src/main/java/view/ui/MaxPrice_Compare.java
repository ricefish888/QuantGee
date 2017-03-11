package view.ui;

import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import view.controller.CompareSharesController;

/**
 * Created by Administrator on 2017/3/11.
 */
public class MaxPrice_Compare {

    private CompareSharesController compareSharesController;

    public MaxPrice_Compare(CompareSharesController compareSharesController){
        this.compareSharesController = compareSharesController;

        //x-xAxis
        final CategoryAxis xAxis = new CategoryAxis();
        xAxis.setLabel("Name Of Share");

        //y-yAxis
        final NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("MaxPrice");

        //chart
        final BarChart<String, Number> bc = new BarChart<String, Number>(xAxis, yAxis);
        bc.setTitle("Comparision Of MaxPrice");

        //data
        XYChart.Series<String, Number> series = new XYChart.Series<String, Number>();
        //数据待监听完成后补充
    }
}
