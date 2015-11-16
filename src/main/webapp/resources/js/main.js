$(document).ready(function(){
	$("#login").click(function(){
		$("#submit").css("display","none");
		$("#sub").css("display","block");
	});	
	
	// 定义方法实现滚动效果
	function handbook() {
		// 1.使用scrollLeft方法获取当前隐藏在左边的长度
		var lengths = $("#scroll").scrollTop();
		/* alert(lengths); */
		if (lengths > $("#scroll").height() * 3) {
			$("#scroll").scrollTop(0);
		} else {
			// 设置该长度增加
			$("#scroll").scrollTop(lengths + 1);
		}
	}
	// 使用时间间隔函数来每隔一定时间调用一次滚动方法
	var times = setInterval(handbook, 55);
	$("#scroll").hover(function() {
		clearInterval(times);
	}, function() {
		times = setInterval(handbook, 55);
	});

	// 定义方法实现滚动效果
	function handbook1() {
		// 1.使用scrollLeft方法获取当前隐藏在左边的长度
		var lengths = $("#scrol").scrollTop();
		if (lengths > $("#scrol").height() * 3) {
			$("#scrol").scrollTop(0);
		} else {
			// 设置该长度增加
			$("#scrol").scrollTop(lengths + 1);
		}
	}
	// 使用时间间隔函数来每隔一定时间调用一次滚动方法
	var time = setInterval(handbook1, 55);
	$("#scrol").hover(function() {
		clearInterval(time);
	}, function() {
		time = setInterval(handbook1, 55);
	});
	
});

