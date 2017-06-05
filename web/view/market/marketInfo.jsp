<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>MarketInfo</title>
    <script src="../../echarts.js"></script>
    <script src="../../jquery-3.2.1.min.js"></script>
    <script src="../../js/test.js"></script>
    <%--<script type="text/javascript" for="window" event="onload">--%>
        <%--var reftime = 3000;//默认每隔10秒向后台发送请求--%>
        <%--var taskId;--%>
        <%--if(document.readyState == "complete"){--%>
            <%--myStart();--%>
        <%--}--%>
        <%--//页面加载完毕调用此函数--%>
        <%--function myStart(){--%>
            <%--loadData();--%>
            <%--taskId = setInterval(loadData,reftime);//每隔reftime调用loadData方法刷新页面--%>
        <%--}--%>
        <%--function loadData(){--%>
            <%--$.ajax({--%>
                <%--type: "GET",--%>
                <%--url: "ajax.action",--%>
                <%--dataType: "json",--%>
                <%--success: function(data){--%>
                    <%--alert(data);--%>
                <%--},--%>
                <%--error:function (data) {--%>
                    <%--alert(error);--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--</script>--%>
    <script>
        function s1(x) {
            x.style.fontWeight = "bold";
            x.style.color = "#fff";
        }
        function s2(x) {
            x.style.fontWeight = "400";
            x.style.color = "#b7b7b7";
        }
    </script>
    <style type="text/css">
        @import "../../css/market/market.css";
        @import "../../css/style.css";
    </style>
</head>
<body>
    <div class="header fixed">

        <div class="w1200">

            <div class="hdlogo">

                <a target="_blank" class="site-logo" href=""> <img src="../../images/theLogo.png" title="MyQuantGee" alt="MyQuantGee"></a>

            </div>

            <div class="nav">

                <a href="marketInfo.jsp" onmouseover="s1(this)" onmouseout="s2(this)">大盘行情</a>
                <a href="../../view/stock/stockFirst.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">个股信息</a>
                <a href="../../view/industry/industry.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">行业资讯</a>
                <a href="../../view/strategy/strategy.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">策略大全</a>
                <a href="../../view/trade/trade.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">模拟交易</a>
                <a href="../../view/ucenter/user_center.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">个人中心</a>

            </div>

            <div class="login-box">

                <a href="../../view/ucenter/login.jsp" target="_self">登录</a>

            </div>

            <div class="logined_box hide fr">

                <a href="http://stock.10jqka.com.cn/my/" target="_blank" id="J_username" style="background-position: 100% 40px;">linhanzi</a>

                <span>|</span>

                <a href="javascript:;" id="header_logined_out" target="_self" class="homeloginout">退出</a>

            </div>

        </div>

    </div>
    <div class="firstHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="firstText">
    	<span>实时大盘</span>
    </div>
    <div class="SSE">
    	<div class="sszhead">
    	</div>
    	<span class="SSE-text">上证指数</span>
    	<span class="ssz1" id="ssedata">25428.50</span>
    	<span class="ssz2" id="sserange">0.10%</span>
    	<span class="ssz3" id="sseprice">25.35</span>
        <div class="top"></div>
    </div>
    <div class="SZI">
    	<div class="szihead">
    	</div>
    	<span class="SZI-text">深证指数</span>
    	<span class="ssz1" id="szidata">25428.50</span>
    	<span class="ssz2" id="szirange">0.10%</span>
    	<span class="ssz3" id="sziprice">25.35</span>
    </div>
    <div class="SZ300">
    	<div class="szhead">
    	</div>
    	<span class="SZ300-text">创业板指</span>
    	<span class="ssz1" id="szdata">25428.50</span>
    	<span class="ssz2" id="szrange">0.10%</span>
    	<span class="ssz3" id="szprice">25.35</span>
    </div>
    <div id="graph-SSE" style="background-color:#FFFFFF;position: absolute;left: 8%;top: 37%;width: 25%;height: 25%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
    <script src="../../js/line1.js"></script>
	<div id="graph-SZI" style="background-color:#FFFFFF;position: absolute;left: 36%;top: 37%;width: 25%;height: 40%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
	<div id="graph-SZ300" style="background-color:#FFFFFF;position: absolute;left: 64%;top: 37%;width: 25%;height: 40%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
	<div class="secondHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="secondText">
    	<span>历史大盘</span>
    </div>
    <div class="historyHead">
    	<div class="historyimg"></div>
    	<span class="hhead">往期大盘</span>
    </div>
    <div class="klinegraph" id="kline"></div>
    <div class="volume" id="volumeBar"></div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript" src="../../js/marketInfo/KLine.js"></script>
    <div class="fourthHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="fourthText">
    	<span>财经资讯</span>
    </div>
    <div class="leftnews">
    	<table class="leftnewsTable">
    		<tbody class="leftBody">
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="l1">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="lt1">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="l2">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="lt2">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="l3">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="lt3">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="l4">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="lt4">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="l5">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="lt5">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			
    		</tbody>
    	</table>
    </div>
    <div class="rightnews">
    	<table class="rightnewsTable">
    		<tbody class="rightBody">
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="r1">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="rt1">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="r2">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="rt2">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="r3">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="rt3">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="r4">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="rt4">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    			<tr>
    				<td class="newsContent">
    					<a href="" style="color: #000000;" id="r5">mvnmvnmvnmvnmvnm</a>
    				</td>
    				<td class="timeContent" id="rt5">2016-10-19</td>
    				<td style="width: 10px;"></td>
    			</tr>
    		</tbody>
    	</table>
    </div>
	<script type="text/javascript" src="../../js/marketInfo/news.js"></script>
    <!--<div class="more">
    	<a href="" onclick="test()">更多>></a>
    </div>-->
</body>
</html>