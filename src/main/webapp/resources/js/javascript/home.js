$(document).ready(function() {
	//退出。。。
	/*$("#out").click(function(){
		//需要把user销毁，再请用户重新登陆。。。
		location.href = "<%=basePath%>resources/index.jsp";
	});*/
	
	$("#tabo").click(function() {
		$("#tab1").css("display", "block");
		$("#tab2").css("display", "none");
		$("#tab3").css("display", "none");
		$("#tab4").css("display", "none");
	});
	$("#tabt").click(function() {
		$("#tab1").css("display", "none");
		$("#tab2").css("display", "block");
		$("#tab3").css("display", "none");
		$("#tab4").css("display", "none");
	});
	$("#tabth").click(function() {
		$("#tab1").css("display", "none");
		$("#tab2").css("display", "none");
		$("#tab3").css("display", "block");
		$("#tab4").css("display", "none");
	});
	$("#tabf").click(function() {
		$("#tab1").css("display", "none");
		$("#tab2").css("display", "none");
		$("#tab3").css("display", "none");
		$("#tab4").css("display", "block");
	});
	
	
	//获取音频工具 
	var audio = document.getElementById("audio");
	$("#music").click(function() {
		var fon = $(this).find("#fon").text();
		//alert(fon);
		if (fon == '播放') {
			$(this).find(".am-icon-play").addClass("am-icon-pause");
			$(this).find(".am-icon-play").removeClass("am-icon-play");
			$(this).find("#fon").text("暂停");
			audio.play();
		} else {
			$(this).find(".am-icon-pause").addClass("am-icon-play");
			$(this).find(".am-icon-pause").removeClass("am-icon-pause");
			$(this).find("#fon").text("播放");
			audio.pause();
		}
	});

	/* 获取焦点显示下面的内容 */
	$("#send").focus(function() {
		$("#sen").css("display", "block");
		var num = $("#send").find("span").text();
		if (num == '说点儿什么吧') {
			$("#send").find("span").text("");
		}
	});
	//发表说说
	$("#fabiao").click(function() {
		var publishContext = $("#send").find("span").html();
		//alert(publishContext.length);
		if(publishContext.length >= 100){
			$("#publish").trigger("click");
		}else{
			//alert(publishContext.length);
			$.ajax({
				url:"<%=basePath%>sendPublish",
				type : "post",
				dataType : "json",
				data : {
					publishContext : publishContext
				},
				success : function(data) {

				},
				error : function() {

				}
			});
		}

	});

	/* 调用其他的click事件 */
	$("#wenjian").click(function() {
		$("#wenjia").trigger("click");
	});

	/* 删除边框 */
	$("#clo").click(function() {
		$("#clos").css("display", "none");
	});
	/* 显示密码 */
	$("#check").click(function() {
		if ($("[name=userPwd]").css("display") == 'none') {
			if ($("#check").prop("checked")) {
				$("#t1").css("display", "none");
				$("#t2").css("display", "block");
			} else {
				$("#t1").css("display", "block");
				$("#t2").css("display", "none");
			}
		} else {
			if ($("#check").prop("checked")) {
				var num = $("#t2").text();
				$("[name=userPwd]").val(num);
			} else {
				$("[name=userPwd]").val("******");
			}
		}
	});
	/* 修改 */
	$("#xiugai").click(function() {
		$("#forName").css("display", "none");
		$("#t1").css("display", "none");
		$("#t2").css("display", "none");
		$("[name=userName]").css("display", "block");
		$("[name=userPwd]").css("display", "block");
		$("#saveSets").css("display", "block");
	});
	/* 创建相册 */
	$("#chuanjia").click(function() {
		$("#chuanjian").trigger("click");
	});
});

/*切换背景图*/
function xianshi(){
	$("#xianshiBack").css("display","block");
}
/* 上传图片 */
function shangchua() {
	$("#shangchuan").trigger("click");
}

/* 切换图片 */
function changeImg(change) {
	var num = $(change).find("img").attr("src");
	var urll = "url('" + num + "') no-repeat fixed top";
	//console.info(urll);
	$("#bod").css("background", urll);
}
/* 上传 */
function add(adds) {
	$("#sen").css("display", "block");
	$("#clos").css("display", "block");
}
/* 个人档 */
function personal() {
	$("#one").css("display", "none");
	$("#two").css("display", "block");
}
/* 相册 */
function photo() {
	$("#one").css("display", "none");
	$("#three").css("display", "block");
}
/* 添加表情 */
function tihuan(ti) {
	var num = $(ti).children().children().clone();
	//alert(num);
	$("#ss").append(num);
}
/* 相册的移入和移出事件 */
function overs(over) {
	$(over).find("#overOut").css("display", "block");
}
function outs(out) {
	$(out).find("#overOut").css("display", "none");
}
/* 图片展示 */
function zhanshi(zhanshi) {
	$("#phot").css("display", "none");
	$("#zhans").css("display", "block");
}
/* 刷新当前页面 */
function titl(jj){
	//alert(1);
	//location.assign("home.jsp");
	//window.open("home.jsp");
	window.location.reload("<%=basePath%>user/home");//刷新当前页面
	//document.execCommand("Refresh");//刷新窗口
	//window.location.href="<%=basePath%>";
	//Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('不刷新！');</script>");
	//parent.location.reload();
	//opener.location.reload()
	//top.location.reload()
	//$.fn.disableF5();
	//window.location.replace("<%=basePath%>user/home");
	//window.location.href();
	//window.history.back();
}