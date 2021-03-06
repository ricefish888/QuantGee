<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
		<meta charset="UTF-8">
    <title>TheStock</title>
	<script src="../../echarts.js"></script>
	<script src="../../jquery-3.2.1.min.js"></script>
	<script src="../../js/marketInfo/headcontroller.js"></script>
    <script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="../../js/stock/theStock/addstock.js"></script>
    <script type="text/javascript" src="../../js/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="../../css/sweet-alert.css">
    <link rel="Stylesheet" href="../../css/jquery.autocomplete.css" />
	<link rel="shortcut icon" href="../../images/logo20x20.png">
    <style type="text/css">
    	@import "../../css/style.css";
    	@import "../../css/stock/theStock.css";
    </style>
</head>
<body onload="changewhole2()">
	<div class="head">

            <div class="hdlogo">

                <a class="site-logo" href=""> <img src="../../images/quantgeelogo.png" title="MyQuantGee" alt="MyQuantGee"></a>

            </div>

			<div class="menu" id="ha1">
                <a class="menua" id="a1"  href="../../view/market/marketInfo.jsp">大盘行情</a>
            </div>
            <div class="menu" id="ha2">
                <a class="menua" id="a2" href="stockFirst.jsp">个股信息</a>
            </div>
            <div class="menu" id="ha3">
                <a class="menua" id="a3" href="../../view/strategy/strategy.jsp">策略大全</a>
            </div>
            <div class="menu" id="ha4">
               	<a class="menua" id="a4" href="../../view/trade/trade.jsp">模拟交易</a>
            </div>
            <div class="menu" id="ha5">
                <a class="menua" id="a5" href="">个人中心</a>
			</div>
			<div class="search bar7">
            		<input id="inputStockCode" type="text" placeholder="请输入股票代码">
                    <script src="../../js/fuzzysearch.js"></script>
            		<button type="submit" onclick="totheStockView()"></button>
    		</div>
			<div class="marketlog">
				<div class="logimg">
					<img src="../../images/headlogin.png"/>
				</div>
				<div class="logintext">
					<a id="la" href="../../view/ucenter/login.jsp" style="color: rgba(0, 0, 0, 0.6);font-weight: 400;cursor: hand;" >登录</a>
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
  				<!--<div class="tsimg" id="tsimg">
  					<img src="../../images/riseicon.png" />
  				</div>-->
  				<div class="tsnprice" id="tsnprice"></div>
  				<div class="rd" >涨跌幅度</div>
  				<div class="tsrr" id="tsrrdata"></div>
  				<div class="prerangetext"><a href="#anaheadtext" style="color: #000000;">预测涨跌幅:</a></div>
  				<div class="prerangedata" id="prerangedata"></div>
  				<div class="tsab">
	  				<div class="abimg" onclick="addstock()">
	  					<img src="../../images/addbutton44.png" />
	  				</div>
	  				<div class="abtext">加入自选</div>
  				</div>
  			</div>
  		</div>
  		<div class="tsinfo2">
  			<table class="tsrtable">
	  			<tr>
	  				<td>昨日收盘价：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr1"></td>
	  			</tr>
	  			<tr>
	  				<td>今日开盘价：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr2"></td>
	  			</tr>
	  			<tr>
	  				<td>最低价：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr3"></td>
	  			</tr>
	  			<tr>
	  				<td>最高价：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr4"></td>
	  			</tr>
	  			<tr>
	  				<td>换手率：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr5"></td>
	  			</tr>
  			</table>
  		</div>
  		<div class="tsinfo2">
  			<table class="tsrtable">
	  			<tr>
	  				<td>市盈率：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr6"></td>
	  			</tr>
	  			<tr>
	  				<td>市净率：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr7"></td>
	  			</tr>
	  			<tr>
	  				<td>成交量：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr8"></td>
	  			</tr>
	  			<tr>
	  				<td>成交额：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr9"></td>
	  			</tr>
	  			<tr>
	  				<td>总市值：</td>
	  				<td width="50px"></td>
	  				<td class="numtd" id="tsr10"></td>
	  			</tr>
  			</table>
  		</div>
		<div class="tsrealtime">
  			<div class="tsrealtime2" id="tsrealtime"></div>
            <div class="xstime">09:30</div>
            <div class="xetime">15:00</div>
		</div>
  	</div>
  </div>
    <script src="../../js/stock/theStock/realtime.js"></script>
  <div class="hismarket">
			<div class="hismarkethead">
				<div class="hmtext">
					历史数据
				</div>
				<div class="mkbutton">
					<div class="klinebutton" id="dkbutton" onclick="clickdkbutton()">
						日K线
					</div>
					<div class="klinebutton" id="wkbutton" onclick="clickwkbutton()">
						周K线
					</div>
					<div class="klinebutton" id="mkbutton" onclick="clickmkbutton()">
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
	  		<script src="../../js/stock/theStock/index.js"></script>
	</div>
	<div class="mkrbins">
		<div class="instruction">
			<div class="macdrsikdjbollh">MACD</div>
			<div id="macdtext">
				<div class="area">
					<li class="content" id="macdcontent"></li>
				</div>
			</div>
		</div>
		<div class="instruction">
			<div class="macdrsikdjbollh">RSI</div>
			<div id="rsitext">
				<div class="area">
					<li class="content" id="rsicontent"></li>
				</div>
			</div>
		</div>
		<div class="instruction">
			<div class="macdrsikdjbollh">KDJ</div>
			<div id="kdjtext">
				<div class="area">
					<li class="content" id="kdjcontent"></li>
				</div>
			</div>
		</div>
		<div class="instruction">
			<div class="macdrsikdjbollh">BOLL</div>
			<div id="bolltext">
				<div class="area">
					<li class="content" id="bollcontent"></li>
				</div>
			</div>
		</div>
	</div>
    <script src="../../js/stock/theStock/indexanalysis.js"></script>
	<div class="analysis">
		<div class="anahead">
			<div class="anaheadtext" id="anaheadtext">股票预测</div>
		</div>
		<div class="analysisgraph" id="analysisgraph"></div>
		<div class="analysisdata">
			<div class="resultl">
				<div class="resulttext">预测明日价格:</div>
				<div class="resultdata" id="resultdata1">10.98</div>
			</div>
			<div class="resultm">
				<div class="resulttext">预测明日涨跌幅:</div>
				<div class="resultdata" id="resultdata2">3.45%</div>
			</div>
			<div class="resultr">
				<div class="resulttext">历史误差率:</div>
				<div class="resultdata" id="resultdata3">60.98%</div>
			</div>
		</div>
		<script src="../../js/stock/theStock/stockpredict.js"></script>
	</div>
	<div class="theEnd">
		<div class="theendtext">
			© 2017 QuantGee All Rights Reserved.
		</div>
	</div>
</body>
</html>
