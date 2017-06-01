/**
 * Created by Administrator on 2017/5/31.
 */
var myChart2 = echarts.init(document.getElementById('volumeBar'));
option = {
    tooltip : {
        trigger: 'axis',
        showDelay: 0             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
    },
    legend: {
        y : -30,
        data:['上证指数','成交金额(万)','虚拟数据']
    },
    toolbox: {
        y : -30,
        show : true,
        feature : {
            mark : {show: true},
            dataZoom : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    dataZoom : {
        show : true,
        realtime: true,
        start : 50,
        end : 100
    },
    grid: {
        x: 80,
        y:5,
        x2:20,
        y2:40
    },
    xAxis : [
        {
            type : 'category',
            position:'top',
            boundaryGap : true,
            axisLabel:{show:false},
            axisTick: {onGap:false},
            splitLine: {show:false},
            data : axisData
        }
    ],
    yAxis : [
        {
            type : 'value',
            scale:true,
            splitNumber: 3,
            boundaryGap: [0.05, 0.05],
            axisLabel: {
                formatter: function (v) {
                    return Math.round(v/10000) + ' 万'
                }
            },
            splitArea : {show : true}
        }
    ],
    series : [
        {
            name:'成交金额(万)',
            type:'line',
            symbol: 'none',
            data:[
                13560434, 8026738.5, 11691637, 12491697, 12485603, 
                11620504, 12555496, 15253370, 12709611, 10458354, 
                10933507, 9896523, 10365702, 10633095, 9722230, 
                12662783, 8757982, 7764234, 10591719, 8826293, 
                11591827, 11153111, 14304651, 11672120, 12536480, 
                12608589, 8843860, 7391994.5, 10063709, 7768895.5, 
                6921859, 10157810, 8148617.5, 7551207, 11397426, 
                10478607, 8595132, 8541862, 9181132, 8570842, 
                10759351, 7335819, 6699753.5, 7759666.5, 6880135.5, 
                7366616.5, 7313504, 7109021.5, 6213270, 5619688, 
                5816217.5, 6695584.5, 5998655.5, 6188812.5, 9538301,
                8224500, 8221751.5, 7897721, 8448324, 6525151, 
                5987761, 7831570, 8162560.5, 7904092, 8139084.5, 
                9116529, 8128014, 7919148, 7566047, 6665826.5, 
                10225527, 11124881, 12884353, 11302521, 11529046, 
                11105205, 9202153, 9992016, 12035250, 11431155, 
                10354677, 10070399, 9164861, 9237718, 7114268, 
                7526158.5, 8105835, 7971452.5
            ],
            markLine : {
                symbol : 'none',
                itemStyle : {
                    normal : {
                        color:'#1e90ff',
                        label : {
                            show:false
                        }
                    }
                },
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        }
    ]
};

myChart2.setOption(option);