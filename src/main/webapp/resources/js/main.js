$(document).ready(function(){
	$("#login").click(function(){
		$("#submit").css("display","none");
		$("#sub").css("display","block");
	});	
	
	// ���巽��ʵ�ֹ���Ч��
	function handbook() {
		// 1.ʹ��scrollLeft������ȡ��ǰ��������ߵĳ���
		var lengths = $("#scroll").scrollTop();
		/* alert(lengths); */
		if (lengths > $("#scroll").height() * 3) {
			$("#scroll").scrollTop(0);
		} else {
			// ���øó�������
			$("#scroll").scrollTop(lengths + 1);
		}
	}
	// ʹ��ʱ����������ÿ��һ��ʱ�����һ�ι�������
	var times = setInterval(handbook, 55);
	$("#scroll").hover(function() {
		clearInterval(times);
	}, function() {
		times = setInterval(handbook, 55);
	});

	// ���巽��ʵ�ֹ���Ч��
	function handbook1() {
		// 1.ʹ��scrollLeft������ȡ��ǰ��������ߵĳ���
		var lengths = $("#scrol").scrollTop();
		if (lengths > $("#scrol").height() * 3) {
			$("#scrol").scrollTop(0);
		} else {
			// ���øó�������
			$("#scrol").scrollTop(lengths + 1);
		}
	}
	// ʹ��ʱ����������ÿ��һ��ʱ�����һ�ι�������
	var time = setInterval(handbook1, 55);
	$("#scrol").hover(function() {
		clearInterval(time);
	}, function() {
		time = setInterval(handbook1, 55);
	});
	
});

