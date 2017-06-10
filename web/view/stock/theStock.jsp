<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
		<meta charset="UTF-8">
    <title>TheStock</title>
	<script src="../../echarts.js"></script>
	<script src="../../jquery-3.2.1.min.js"></script>
	<script src="../../js/marketInfo/headcontroller.js"></script>
	<link rel="shortcut icon" href="../../images/logo20x20.png">
    <style type="text/css">
    	@import "../../css/style.css";
    	@import "../../css/stock/theStock.css";
    </style>
</head>
<body onload="changewhole2()">
	<div class="head">

            <div class="hdlogo">

                <a target="_blank" class="site-logo" href=""> <img src="../../images/quantgeelogo.png" title="MyQuantGee" alt="MyQuantGee"></a>

            </div>

			<div class="menu" id="ha1">
                <a class="menua" id="a1"  href="../../view/market/marketInfo.jsp">大盘行情</a>
            </div>
            <div class="menu" id="ha2">
                <a class="menua" id="a2" href="stockFirst.jsp" target="_blank">个股信息</a>
            </div>
            <div class="menu" id="ha3">
                <a class="menua" id="a3" href="../../view/strategy/strategy.jsp" target="_blank">策略大全</a>
            </div>
            <div class="menu" id="ha4">
               	<a class="menua" id="a4" href="../../view/trade/trade.jsp" target="_blank">模拟交易</a>
            </div>
            <div class="menu" id="ha5">
                <a class="menua" id="a5" href="../../view/ucenter/user_center.jsp" target="_blank">个人中心</a>
			</div>
			<div class="search bar7">
            		<input id="inputStockCode" type="text" placeholder="请输入股票代码">
            		<button type="submit" onclick="totheStockView()"></button>
    		</div>
			<div class="marketlog">
				<div class="logimg">
					<img src="../../images/headlogin.png"/>
				</div>
				<div class="logintext">
					<a href="../../view/ucenter/login.jsp" style="color: rgba(0, 0, 0, 0.6);font-weight: 400;cursor: hand;" >登录</a>
				</div>
			</div>
  </div>
  <div class="tshead">
  	<div class="tsheadname">
  		<div class="tsname" id="tsname"></div>
  		<div class="tscode" id="tscode"></div>
  	</div>
  	<div class="tsinfo">
  		<div class="tsinfol1">
  			<div class="tstext">
  				<img src="" />
  				<div class="tsnprice">9.85</div>
  				<div class="rd">涨跌</div>
  				<div class="tsrp">0.14</div>
  				<div class="tsrr">0.68%</div>
  				<div class="tsab">
	  				<div class="abimg">
	  					<img src="../../images/addbutton44.png" />
	  				</div>
	  				<div class="abtext">加入收藏</div>
  				</div>
  			</div>
  		</div>
  		<div class="tsinfo2"></div>
  		<div class="tsinfo2"></div>
  		<div class="tsrealtime"></div>
  	</div>
  </div>
  <div class="hismarket">
			<div class="hismarkethead">
				<div class="hmtext">
					历史数据
				</div>
				<div class="mkbutton">
					<div class="klinebutton" id="dkbutton" onclick="clickdkbutton();">
						日K线
					</div>
					<div class="klinebutton" id="wkbutton" onclick="clickwkbutton();">
						周K线
					</div>
					<div class="klinebutton" id="mkbutton" onclick="clickmkbutton();">
						月K线
					</div>
				</div>
			</div>
			<div class="kline" id="kline"></div>
			<div class="volume" id="volume"></div>
			<script src="../../js/stock/theStock/stockKline.js"></script>
			<div class="indexhead">
				<div class="indextext">
					指标分析
				</div>
				<div class="indexbutton">
					<div class="mkrbbutton"  id="MACDbutton" onclick="clickMACDbutton()">
						MACD
					</div>
					<div class="mkrbbutton"  id="KDJbutton" onclick="clickKDJbutton()">
						KDJ
					</div>
					<div class="mkrbbutton"  id="RSIbutton" onclick="clickRSIbutton()">
						RSI
					</div>
					<div class="mkrbbutton"  id="BOLLbutton" onclick="clickBOLLbutton()">
						BOLL
					</div>
				</div>
			</div>
			<div class="index" id="index"></div>
			<script src="../../js/trade/klineandindex.js"></script>
	</div>
	<div class="analysis">
		<div class="anahead">
			<div class="anaheadtext">股票预测</div>
		</div>
		<div class="analysisgraph"></div>
		<div class="analysisdata">
			<div class="resultl"></div>
			<div class="resultm"></div>
			<div class="resultr"></div>
		</div>
	</div>
</body>
</html>
