var accountID;
var collectedStrategy;
var Stock;
var userInfo;

$(document).ready(function() {
	//判断当前登陆用户
	$.ajax({
		type: 'get',
		url: 'haveLogin.action',
		async: false,
		dataType: 'json',
		success: function(data) {
			accountID = JSON.parse(data)["accountID"];
			document.getElementById("username").innerHTML = "欢迎，" + accountID + "!";
		},
		error: function(data) {
			alert("error");
		}
	});

	if(accountID[accountID] != "") {
		//获取收藏的股票
		$.ajax({
			type: 'get',
			url: 'getCollectStock.action',
			async: false,
			data: {
				accountID: accountID
			},
			dataType: 'json',
			success: function(data) {
				collectedStock = JSON.parse(data);
			},
			error: function(data) {
				alert("error");
			}
		});
		//获取收藏的策略
		$.ajax({
			type: 'get',
			url: 'getCollectStock.action',
			async: false,
			data: {
				accountID: accountID
			},
			dataType: 'json',
			success: function(data) {
				collectedStock = JSON.parse(data);
			},
			error: function(data) {
				alert("error");
			}
		});
		//获取用户信息
		$.ajax({
			type: 'get',
			url: 'getUserInfo.action',
			async: false,
			data: {
				accountID: accountID
			},
			dataType: 'json',
			success: function(data) {
				userInfo = JSON.parse(data);
				document.getElementById("accountIDInfo").value = userInfo["accountID"];
				document.getElementById("usernameInfo").value = userInfo["userName"];
				document.getElementById("phoneNumber").value = userInfo["phoneNumber"];

			},
			error: function(data) {
				alert("error");
			}
		});
	}
})

function changecolumns() {

	if(document.getElementById("next").style.backgroundPositionY == "-767px") {
		document.getElementsByClassName("colums")[0].style.display = "none";
		document.getElementsByClassName("colums hide")[0].style.display = "block";
		document.getElementById("next").style.backgroundPositionY = "-703px";
	} else {
		document.getElementsByClassName("colums")[0].style.display = "block";
		document.getElementsByClassName("colums hide")[0].style.display = "none";
		document.getElementById("next").style.backgroundPositionY = "-767px";
	}

}

function totheStockView() {
	var code = document.getElementById("inputStockCode");
	$.ajax({
		cache: false,
		async: false,
		url: 'totheStock.action',
		type: 'POST',
		dataType: 'json',
		data: {
			stockCode: code.innerText
		},
		success: function(data) {
			window.open('../../view/stock/theStock.jsp');
		},
		error: function(data) {
			alert("error")
		}
	});
}

function changePanel(panelName) {
	document.getElementById("myStock").style.display = "none";
	document.getElementById("myStrategy").style.display = "none";
	document.getElementById("accountSetting").style.display = "none";
	document.getElementById(panelName).style.display = "block";
}

function changeInfo(infoField) {
	document.getElementById(infoField).removeAttribute("readonly");
	document.getElementById(infoField).focus();
	document.getElementById("changeInfoButton").style.display = "block";
}

function submitInfoChagnes() {
	var accountVO = {
		'userVO.accountID': document.getElementById("accountIDInfo").value,
		'userVO.userName': document.getElementById("usernameInfo").value,
		'userVO.phoneNumber': document.getElementById("phoneNumber").value
	};
	$.ajax({
		type: 'post',
		url: 'updateUserInfo.action',
		async: false,
		data: {
			'userVO.accountID': document.getElementById("accountIDInfo").value,
			'userVO.userName': document.getElementById("usernameInfo").value,
			'userVO.phoneNumber': document.getElementById("phoneNumber").value
		},
		dataType: 'json',
		success: function(data) {
			userInfo = JSON.parse(data);
			document.getElementById("accountIDInfo").value = userInfo["accountID"];
			document.getElementById("accountIDInfo").readOnly = "readonly";
			document.getElementById("usernameInfo").value = userInfo["userName"];
			document.getElementById("usernameInfo").readOnly = "readonly";
			document.getElementById("phoneNumber").value = userInfo["phoneNumber"];
			document.getElementById("phoneNumber").readOnly = "readonly";
			document.getElementById("changeInfoButton").style.display = "none";
		},
		error: function(data) {
			alert("error");
		}
	});
}