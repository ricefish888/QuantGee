<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	 <meta charset="UTF-8">
    <title>StockFirst</title>
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
    <script src="../../js/test.js"></script>
    <script src="../../jquery-3.2.1.min.js"></script>
    <!--<script src="../../js/stock/someInfo.js"></script>-->
    <style type="text/css">
    	@import "../../css/style.css";
    	@import "../../css/stock/firstStock.css";
    </style>
</head>
<body>
		<div class="header fixed">

        <div class="w1200">

            <div class="hdlogo">

                <a target="_blank" class="site-logo" href=""> <img src="../../images/theLogo.png" title="MyQuantGee" alt="MyQuantGee"></a>

            </div>

            <div class="nav">

                <a href="../../view/market/marketInfo.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">大盘行情</a>
                <a href="stockFirst.jsp" onmouseover="s1(this)" onmouseout="s2(this)">个股信息</a>
                <a href="../../view/industry/industry.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">行业资讯</a>
                <a href="../../view/strategy/strategy.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">策略大全</a>
                <a href="../../view/trade/trade.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">模拟交易</a>
                <a href="../../view/ucenter/user_center.jsp" target="_blank" onmouseover="s1(this)" onmouseout="s2(this)">个人中心</a>

            </div>

            <div class="login-box">

                <a href="../../view/ucenter/login.jsp" target="_blank">登录</a>

            </div>

            <div class="logined_box hide fr">

                <a href="http://stock.10jqka.com.cn/my/" target="_blank" id="J_username" style="background-position: 100% 40px;">linhanzi</a>

                <span>|</span>

                <a href="javascript:;" id="header_logined_out" target="_self" class="homeloginout">退出</a>

            </div>

        </div>

    </div>
		<!--<div class="firstHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="firstText">
    	<span>个股排行</span>
    </div>
    <div class="stockBar">
    		<span class="all">全部股票</span>
    		<span class="sszA">上证A股</span>
    		<span class="sziA">深证A股</span>
    		<span class="sme">中小板</span>
    		<span class="startup">创业板</span>
    </div>
    <div class="tableContent">
    	
    </div>
    <div class="secondHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="secondText">
    	<span>今日推荐</span>
    </div>
    <div class="firRec">
    	<div class="sszhead">
    	</div>
    	<span class="SSE-text">A股</span>
    	<span class="ssz1">25428.50</span>
    	<span class="ssz2">0.10%</span>
    	<span class="ssz3">25.35</span>
    </div>
    <div class="secRec">
    	<div class="szihead">
    	</div>
    	<span class="SZI-text">B股</span>
    	<span class="ssz1">25428.50</span>
    	<span class="ssz2">0.10%</span>
    	<span class="ssz3">25.35</span>
    </div>
    <div class="thirdRec">
    	<div class="szhead">
    	</div>
    	<span class="SZ300-text">C股</span>
    	<span class="ssz1">25428.50</span>
    	<span class="ssz2">0.10%</span>
    	<span class="ssz3">25.35</span>
    </div>
    <div class="graph-SSE" style="position: absolute;left: 8%;top: 138%;width: 25%;height: 40%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
	<div class="graph-SZI" style="position: absolute;left: 36%;top: 138%;width: 25%;height: 40%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
	<div class="graph-SZ300" style="position: absolute;left: 64%;top: 138%;width: 25%;height: 40%;background-color: #FFFFFF;border: 1px solid #000000;"></div>
	<div class="search">
		<input type="text" class="lefttext" placeholder="股票代码/股票名称"/>
		<div class="submit" onclick="test()"></div>
	</div>-->
	<!--<div class="thirdHead">
    	<img src="../../images/标签1.png" class="imageHead" style="width: 80px;height: 50px;"/>
    </div>
    <div class="thirdText">
    	<span>个股行情</span>
    </div>-->
    <div class="rightrange">
    	<span class="rightrangehead">个股涨跌榜</span>
    </div>
    <div class="data"></div>
    <div class="search"></div>
	    <div class="stock-left">
	    	<table class="stockTable">
	    		<thead class="stockHead">
	    			<tr>
	                    <th style="width:75px;font-weight: 100;" align="center">股票</th>
	                    <th style="width:65px;font-weight: 100;" align="center">涨幅</th>
	                    <th style="width:90px;font-weight: 100;" align="center">现价</th>
	                    <th style="width:60px;font-weight: 100;" align="right">加自选</th>
	                    <th style="width: 10px;"></th>
	                </tr>
	    		</thead>
	    		<tbody class="stockBody-rise">
	    			<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise11" href="javascript:void(0)" onmouseover="showdatasr11()">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise12">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise13">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise21" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise22">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise23">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise31" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise32">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise33">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise41" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise42">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise43">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise51" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise52">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise53">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise61" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise62">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise63">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise71" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise72">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise73">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise81" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise82">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise83">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise91" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise92">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise93">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise101" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise102">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise103">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise111" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise112">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise113">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise121" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise122">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise123">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise131" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise132">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise133">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise141" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise142">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise143">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-rise-td1">
	            			<a id="srise151" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-rise-td2" id="srise152">10.14%</td>
	                    <td class="stockBody-rise-td3" id="srise153">3.91</td>
	                    <td class="stockBody-rise-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	    		</tbody>
	    	</table>
	    </div>
	    <div class="stock-right">
	    	<table class="stockTable">
	    		<thead class="stockHead">
	    			<tr>
	                    <th style="width:75px;font-weight: 100;" align="center">股票</th>
	                    <th style="width:65px;font-weight: 100;" align="center">涨幅</th>
	                    <th style="width:90px;font-weight: 100;" align="center">现价</th>
	                    <th style="width:60px;font-weight: 100;" align="right">加自选</th>
	                    <th style="width: 10px;"></th>
	                </tr>
	    		</thead>
	    		<tbody class="stockBody-down">
	    			<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown11" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown12">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown13">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown21" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown22">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown23">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown31" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown32">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown33">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown41" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown42">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown43">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown51" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown52">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown53">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown61" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown62">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown63">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown71" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown72">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown73">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown81" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown82">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown83">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown91" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown92">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown93">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown101" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown102">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown103">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown111" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown112">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown113">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown121" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown122">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown123">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown131" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown132">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown133">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown141" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown142">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown143">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	            	<tr>
	            		<td class="stockBody-down-td1">
	            			<a id="sdown151" href="">东方电热</a>
	            		</td>
	                    <td class="stockBody-down-td2" id="sdown152">10.14%</td>
	                    <td class="stockBody-down-td3" id="sdown153">3.91</td>
	                    <td class="stockBody-down-td4">
	                    	<a style="margin-left: 25px;" href="">
	                    		<img src="http://i.thsi.cn/images/q/plus_logo.png" />
	                    	</a>
	                    </td>
	                    <th style="width: 10px;"></th>
	            	</tr>
	    		</tbody>
	    	</table>
	    </div>
    <script type="text/javascript" src="../../js/stock/stockupdown.js"></script>
    <div class="stockInfo" id="si1"></div>

    <div class="stockInfo2" id="si2"></div>
        <script type="text/javascript" src="../../js/stock/someInfo.js"></script>
</body>
</html>
