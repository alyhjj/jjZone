<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html class="no-js">
<head>
<title>【账户名】</title>
<jsp:include page="warterMark.jsp" />
<!-- css -->
<link rel="stylesheet" href="<%=basePath%>resources/css/home.css">
<!-- js -->
<script src="<%=basePath%>resources/js/javascript/home.js"></script>
<script type="text/javascript">
	/* window.onbeforeunload = function(event) {
		return confirm("确定离开此页面吗？");
	} */
	
	$(document).ready(function() {
		
	});
	/* 更改头像 */
	function setT() {
		$("#setTou").trigger("click");
		selectImages();
		console.info($("#photoC").next().children().eq(1).children().eq(1));
		
		/* $("#photoC").next().children().eq(1).children().eq(1).children().each(function(){
			alert(111);
		}) */
	}
	//没有相册时，图片框显示提示
	function ii(){
		$("#photoC").parent().parent().parent().parent().children().append("<tr><td colspan='4'><div style='height:160px;'><span style='margin:150px 150px;display: block;'>该相册没有照片，请选择其他相册</span></div></td></tr>");
	}
	//相册时，遍历相册里的相片
	function mm(){
		
	}
	
	//点击相册获取图片
	function opt(photoId){
		console.info(photoId);
		$.ajax({
			url:"<%=basePath%>images/selectImages",
			type:"post",
			dataType:"json",
			data:{photoId:photoId},
			success:function(data){
				console.info(data);
			}
		});
	}
	//遍历此用户下的图的相册和相册数
	function selectImages(){
		$.ajax({
			url:"<%=basePath%>images/selectPhoto",
			type:"post",
			dataType:"json",
			success:function(data){
				//console.info(data);
				$("#photoC").empty();
				if(data.length == 0){
					//没有相册
					$("#photoC").append("<option value='0'>最新照片(0)</option>");
					//没有相册时，图片框显示提示
					ii();
				}else{
					//有相册---判断相片时间来展示最新照片的前10张
					$("#photoC").append("<option value='0' onclick='opt(0);'>最新照片（0）</option>");
					for (var i = 0; i < data.length; i++) {
						//jquery遍历map   
						/* $.each(data[i], function(key, value) {
							$("#photoC").append("<option value='"+ key +"'>"+ key +"（" + value.length + "）</option>");
						});  */
						$("#photoC").append("<option value='"+ data[i].id +"' onclick='opt("+ data[i].id +");' id='photoId"+ data[i].id +"'>"+ data[i].name +"（" + data[i].num + "）</option>");
					}
				}
			}
		});
	}
</script>
</head>

<body style="background: url('<%=basePath%>resources/i/ss.jpg') no-repeat fixed top;"
	id="bod">
	<div class="am-container">
		<header class="am-topbar am-topbar-fixed-top" style="height:10px;">
		<div class="am-container">
			<h1 class="am-topbar-brand">
				<a href="JavaScript:void(0);" onclick="titl(this);">JJZone</a>
			</h1>

			<button
				class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
				data-am-collapse="{target: '#doc-topbar-collapse'}">
				<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
			</button>

			<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
				<ul class="am-nav am-nav-pills am-topbar-nav">
					<li class="am-active"><a href="javascript:void(0);" onclick="titl(this);"><span
							class="am-icon-home uss"></span> 个人中心</a></li>
					<li class="am-dropdown" data-am-dropdown><a
						class="am-dropdown-toggle" data-am-dropdown-toggle
						href="javascript:;" onclick="xianshi();"> <span class="am-icon-male uss"></span> 装扮
					</a>
					<li>
						<ul class="am-dropdown-content" id="xianshiBack" style="width: 600px; height: 300px;">
							<!-- 装扮图片展示 -->
							<div style="background: url('<%=basePath%>resources/i/miss.jpg') no-repeat fixed top;">
								<div class="am-g" style="margin-bottom: 10px;">
									<div class="am-u-sm-2">&nbsp;</div>
									<a href="javascript:void(0);" id="tabo"><span class="sp">春天的故事</span>
									</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="javascript:void(0);"
										id="tabt"><span class="sp">神秘的紫嫣</span> </a>&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="javascript:void(0);" id="tabth"><span class="sp">心已飞远</span>
									</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="javascript:void(0);"
										id="tabf"><span class="sp">认真的雪</span> </a>
								</div>
								<!-- 1 -->
								<div class="am-g" id="tab1">
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/i love you.jpg" /> </a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/i love you.jpg" /> </a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/i love you.jpg" /> </a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/i love you.jpg" /> </a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
								</div>
								<!-- 2 -->
								<div class="am-g" id="tab2">
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/2.jpg" />
											</a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/2.jpg" />
											</a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/2.jpg" />
											</a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/2.jpg" />
											</a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
								</div>
								<!-- 3 -->
								<div class="am-g" id="tab3">
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/I MISS YOU.jpg" /> </a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/I MISS YOU.jpg" /> </a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/I MISS YOU.jpg" /> </a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail"
												src="<%=basePath%>resources/i/I MISS YOU.jpg" /> </a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
								</div>
								<!-- 4 -->
								<div class="am-g" id="tab4">
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/miss.jpg" />
											</a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/miss.jpg" />
											</a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
									<div class="am-g">
										<div class="am-u-sm-1">&nbsp;</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/miss.jpg" />
											</a>
										</div>
										<div class="am-u-sm-5">
											<a href="javascript:void(0);" onclick="changeImg(this);"><img
												class="am-thumbnail" src="<%=basePath%>resources/i/miss.jpg" />
											</a>
										</div>
										<div class="am-u-sm-1">&nbsp;</div>
									</div>
								</div>
							</div>
						</ul>
						</li>
				</ul>

				<div class="am-topbar-right">
					<ul class="am-nav am-nav-pills am-topbar-nav">
						<li id="music"><a href="javascript:void(0);"><span
								class="am-icon-play us uss"></span>&nbsp;<span id="fon">播放</span>
						</a></li>
						<li>
							<form class="am-topbar-form am-topbar-left am-form-inline"
								role="search">
								<div class="am-form-group">
									<input type="text" class="am-form-field am-input-sm"
										placeholder="搜索" style="height: 35px;" />
								</div>
							</form>
						</li>
						<li><a href="#"><span class="am-icon-user us uss"></span>
								${user.userNick }</a></li>
						<li><a id="out" href="<%=basePath%>system/exit"><span
								class="am-icon-sign-out us uss"></span> 退出</a></li>
						<li><a href="#"><span class="am-icon-cog us uss"></span>
								设置</a></li>
					</ul>
				</div>
			</div>
		</div>
		</header>

		<!-- 中部 -->
		<div class="am-g">
			<!-- 头像、个人信息 -->
			<div style="height: 140px;"></div>
			<div class="am-container">
				<div class="am-g">
					<div class="am-u-sm-2">
						<a href="javascript:void(0);" onclick="setT();">
							<img class="am-thumbnail" src="<%=basePath%>${imgAddress }"/>
						</a>
					</div>
					<div class="am-u-sm-10">
						<div style="font-size: 20px; margin-top: 110px;">
							<span style="color: #8C8262;">${user.userNick }</span>
						</div>
					</div>
				</div>

				<!-- one:全部动态 -->
				<div class="am-g" id="one">
					<div class="am-u-sm-2" style="width: 200px;">
						<ul class="am-list am-list-border">
							<li><a href="javascript:void(0);"><span
									class="am-icon-users us uss"></span>&nbsp;&nbsp;<span
									class="usp">好友动态</span> </a></li>
							<li><a href="javascript:void(0);"><span
									class="am-icon-heart us uss"></span>&nbsp;&nbsp;<span
									class="usp">特别关心</span> </a></li>
							<li><a href="javascript:void(0);"><span
									class="am-icon-at us uss"></span>&nbsp;&nbsp;<span class="usp">与我相关</span>
							</a></li>
							<li><a href="javascript:void(0);"><span
									class="am-icon-calendar us uss"></span>&nbsp;&nbsp;<span
									class="usp">那年今日</span> </a></li>
							<li><a href="javascript:void(0);" onclick="personal();"><span
									class="am-icon-user us uss"></span>&nbsp;&nbsp;<span
									class="usp">个人档</span> </a></li>
							<li><a href="javascript:void(0);" onclick="photo();"><span
									class="am-icon-camera-retro us uss"></span>&nbsp;&nbsp;<span
									class="usp">相册</span> </a></li>
						</ul>
					</div>
					<div class="am-u-sm-6" style="width: 550px;">
						<div class="am-g">
							<div class="am-alert am-alert-secondary"
								style="background-image: url('<%=basePath%>resources/i/x.jpg'); height: 40px;"
								data-am-alert>
								<button type="button" class="am-close">&times;</button>
							</div>

							<!-- hjj -->
							<div class="am-g" style="margin-left: 0px;">
								<div id="send" contenteditable="true"
									style="float: left; width: 500px; height: 50px; border: 1px solid #CCCCCC; background-color: white; overflow: auto;">
									<span id="ss" class="us" style="margin-left: 10px;">说点儿什么吧</span>
								</div>
								<div
									style="width: 50px; height: 50px; float: left; border: 1px solid #CCCCCC; background-color: #EEEEEE; border-left: 0px;">
									<span class="am-icon-folder us" id="wenjian"
										style="width: 50px; height: 50px; margin-top: 16px; margin-left: 18px;"></span>
									<div class="am-dropdown" data-am-dropdown>
										<a href="javascript:void(0);" style="display: none;"
											class="am-dropdown-toggle" id="wenjia"
											data-am-dropdown-toggle><div style="width: 28px; height: 28px; float: left; text-align: center; margin-top: 6px;">
												<span class="am-icon-smile-o us uss am-icon-sm"></span>
											</div> </a>
										<ul class="am-dropdown-content"
											style="width: 220px; margin-left: -50px;">
											<li class="tup"><a href="javascript:void(0);"
												onclick="add(this);"><span
													class="am-icon-photo us uss am-icon-sm"></span><br /> <span>图片</span>
											</a></li>
											<li class="tup"><a href="javascript:void(0);"
												onclick="add(this);"><span
													class="am-icon-music us uss am-icon-sm"></span><br /> <span>音乐</span>
											</a></li>
											<li class="tup"><a href="javascript:void(0);"
												onclick="add(this);"><span
													class="am-icon-video-camera us uss am-icon-sm"></span><br />
													<span>视频</span> </a></li>
										</ul>
									</div>
								</div>
							</div>

						</div>
						<div class="am-g"
							style="border: 1px solid #CCCCCC; height: 36px; background-color: white; display: none; border-top: 0px solid #CCCCCC;"
							id="sen">

							<div class="am-dropdown" data-am-dropdown>
								<a href="javascript:void(0);" class="am-dropdown-toggle" data-am-dropdown-toggle>
									<div style="width: 28px; height: 28px; float: left; text-align: center; margin-top: 6px;">
										<span class="am-icon-smile-o us uss am-icon-sm"></span>
									</div> 
								</a> 
								<a href="javascript:void(0);">
									<div style="width: 28px; height: 28px; float: left; text-align: center; margin-top: 6px;">
										<span class="am-icon-at us uss am-icon-sm"></span>
									</div> 
								</a> 
								<a href="javascript:void(0);">
									<div style="width: 28px; height: 28px; float: left; text-align: center; margin-top: 6px;">
										<span class="am-icon-sheqel us uss am-icon-sm"></span>
									</div> 
								</a>
								<ul class="am-dropdown-content" style="width: 400px;">
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/0.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/1.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/2.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/3.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/4.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/5.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/6.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/7.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/8.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/9.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/10.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/11.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/12.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/13.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/14.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/15.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/16.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/17.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/18.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/19.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/20.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/21.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/22.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/23.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/24.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/25.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/26.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/27.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/28.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/29.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/30.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/31.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/32.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/33.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/34.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/35.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/36.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/37.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/38.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/39.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/40.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/41.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/42.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/43.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/44.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/45.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/46.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/47.gif" /> </a></li>
									<li class="tup" onclick="tihuan(this);"><a
										href="javascript:void(0);"><img
											src="<%=basePath%>resources/i/img/48.gif" /> </a></li>
								</ul>
							</div>

							<button type="button" class="am-btn am-btn-warning am-btn-xs"
								style="float: right; margin-right: 1px; margin-top: 1px;"
								id="fabiao">&nbsp;&nbsp;&nbsp;发表&nbsp;&nbsp;</button>
						</div>

						<div class="am-g" style="height: 36px; display: none" id="clos">
							<div
								style="height: 40px; background-color: white; border: 1px solid #CCCCCC; border-top: 0px solid #CCCCCC;">
								<a href="javascript:void(0);" id="clo"
									style="float: right; margin-right: 10px; margin-top: 5px;"><span
									class="am-icon-close us uss"></span> </a> <input type="file"
									name="add" value="add"
									style="margin-left: 20px; padding-top: 10px;" />
							</div>
						</div>

						<!-- zone动态 -->
						<article class="am-comment" style="margin-top:15px;"
							data-am-scrollspy="{animation:'slide-bottom', repeat: true}">
						<a href="#link-to-user-home"> <img class="am-comment-avatar"
							src="<%=basePath%>resources/i/i.jpg">
						</a>
						<div class="am-comment-main">
							<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">某人</a> 评论于
								<time title="2013年7月27日 下午7:54 格林尼治标准时间+0800"
									datetime="2013-07-27T04:54:29-07:00">2014-7-12 15:30</time>
							</div>
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-pencil"></i>
								</a> <a href=""> <i class="am-icon-close"></i>
								</a>
							</div>
							</header>
							<div class="am-comment-bd" style="background-color: white;">
								<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
								<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
							</div>
							<footer class="am-comment-footer"
								style="background-color: white;">
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-thumbs-up"></i>
								</a> <a href=""> <i class="am-icon-thumbs-down"></i>
								</a> <a href=""> <i class="am-icon-reply"></i>
								</a>
							</div>
							</footer>
						</div>
						</article>

						<article class="am-comment" style="margin-top:15px;"
							data-am-scrollspy="{animation:'slide-bottom', repeat: true}">
						<a href="#link-to-user-home"> <img class="am-comment-avatar"
							src="<%=basePath%>resources/i/i.jpg">
						</a>
						<div class="am-comment-main">
							<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">某人</a> 评论于
								<time title="2013年7月27日 下午7:54 格林尼治标准时间+0800"
									datetime="2013-07-27T04:54:29-07:00">2014-7-12 15:30</time>
							</div>
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-pencil"></i>
								</a> <a href=""> <i class="am-icon-close"></i>
								</a>
							</div>
							</header>
							<div class="am-comment-bd" style="background-color: white;">
								<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
								<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
							</div>
							<footer class="am-comment-footer"
								style="background-color: white;">
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-thumbs-up"></i>
								</a> <a href=""> <i class="am-icon-thumbs-down"></i>
								</a> <a href=""> <i class="am-icon-reply"></i>
								</a>
							</div>
							</footer>
						</div>
						</article>

						<article class="am-comment" style="margin-top:15px;"
							data-am-scrollspy="{animation:'slide-bottom', repeat: true}">
						<a href="#link-to-user-home"> <img class="am-comment-avatar"
							src="<%=basePath%>resources/i/i.jpg">
						</a>
						<div class="am-comment-main">
							<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">某人</a> 评论于
								<time title="2013年7月27日 下午7:54 格林尼治标准时间+0800"
									datetime="2013-07-27T04:54:29-07:00">2014-7-12 15:30</time>
							</div>
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-pencil"></i>
								</a> <a href=""> <i class="am-icon-close"></i>
								</a>
							</div>
							</header>
							<div class="am-comment-bd" style="background-color: white;">
								<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
								<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
							</div>
							<footer class="am-comment-footer"
								style="background-color: white;">
							<div class="am-comment-actions">
								<a href=""> <i class="am-icon-thumbs-up"></i>
								</a> <a href=""> <i class="am-icon-thumbs-down"></i>
								</a> <a href=""> <i class="am-icon-reply"></i>
								</a>
							</div>
							</footer>
						</div>
						</article>

					</div>

					<div class="am-u-sm-3">
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd">好友推荐</div>
							<div class="am-panel-bd">
								<div class="am-container">
									<div class="am-g" style="margin-top: 10px;">
										<div style="width: 64px; float: left;">
											<img src="<%=basePath%>resources/i/2013117111520875.jpg"
												class="am-img-thumbnail am-radius">
										</div>
										<div style="width: 50px; float: left;">
											<div style="height: 25px;">
												<span class="usp">MISS</span>
											</div>
											<div style="height: 25px;">
												<span class="am-icon-heart us uss">&nbsp;&nbsp;99</span>
											</div>
										</div>
										<div style="width: 75px; float: right; margin-top: 10px;">
											<button type="button"
												class="am-btn am-btn-default am-round am-btn-xs">添加好友</button>
										</div>
									</div>
									<div class="am-g" style="margin-top: 10px;">
										<div style="width: 64px; float: left;">
											<img src="<%=basePath%>resources/i/ca558b08f9.jpg"
												class="am-img-thumbnail am-radius">
										</div>
										<div style="width: 50px; float: left;">
											<div style="height: 25px;">
												<span class="usp">MISS</span>
											</div>
											<div style="height: 25px;">
												<span class="am-icon-heart us uss">&nbsp;&nbsp;97</span>
											</div>
										</div>
										<div style="width: 75px; float: right; margin-top: 10px;">
											<button type="button"
												class="am-btn am-btn-default am-round am-btn-xs">添加好友</button>
										</div>
									</div>
									<div class="am-g" style="margin-top: 10px;">
										<div style="width: 64px; float: left;">
											<img src="<%=basePath%>resources/i/maixiang.jpg"
												class="am-img-thumbnail am-radius">
										</div>
										<div style="width: 50px; float: left;">
											<div style="height: 25px;">
												<span class="usp">MISS</span>
											</div>
											<div style="height: 25px;">
												<span class="am-icon-heart us uss">&nbsp;&nbsp;95</span>
											</div>
										</div>
										<div style="width: 75px; float: right; margin-top: 10px;">
											<button type="button"
												class="am-btn am-btn-default am-round am-btn-xs">添加好友</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- two:个人档 -->
				<div class="am-g" id="two" style="display: none;">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">
							<span class="am-icon-user us uss"> <span class="usp">个人档</span>
						</div>
						<div class="am-panel-bd">
							<div class="am-g">
								<!-- 左 -->
								<div class="am-u-sm-3">
									<div class="am-container">
										<div class="am-g" style="padding-left: 50px;">
											<img class="am-thumbnail"
												src="<%=basePath%>resources/i/i.jpg"
												style="width: 100px; height: 100px;" /> <a href="#"
												style="margin-left: 20px; font-size: 14px;"><span
												class="usp">修改头像</span> </a>
										</div>
										<div class="am-g"
											style="padding-left: 22px; text-align: center; margin-top: 10px;">
											<div style="float: left; width: 50px;">
												<div style="font-size: 14px;">
													<a href="#">111</a>
												</div>
												<div style="font-size: 14px;">
													<span class="usp">说说</span>
												</div>
											</div>
											<div
												style="height: 100px; width: 1px; border-left: 1px #ccc solid; float: left; height: 50px;"></div>
											<div style="float: left; width: 50px;">
												<div style="font-size: 14px;">
													<a href="#">111</a>
												</div>
												<div style="font-size: 14px;">
													<span class="usp">图片</span>
												</div>
											</div>
											<div
												style="height: 100px; width: 1px; border-left: 1px #ccc solid; float: left; height: 50px;"></div>
											<div style="float: left; width: 50px;">
												<div style="font-size: 14px;">
													<a href="#">111</a>
												</div>
												<div style="font-size: 14px;">
													<span class="usp">视频</span>
												</div>
											</div>
										</div>
										<div
											style="height: 1px; width: 200px; border-top: 1px #ccc solid; float: left; margin-top: 25px;"></div>
									</div>
								</div>

								<!-- 右 -->
								<div class="am-u-sm-9">
									<div class="am-tabs" data-am-tabs>
										<ul class="am-tabs-nav am-nav am-nav-tabs">
											<li class="am-active"><a href="javascript: void(0)"><span
													class="usp">空间动态</span> </a></li>
											<li><a href="javascript: void(0)"><span class="usp">个人资料</span>
											</a></li>
										</ul>

										<div class="am-tabs-bd">
											<div class="am-tab-panel am-active">
												<article class="am-comment" style="margin-top:15px;"
													data-am-scrollspy="{animation:'slide-bottom', repeat: true}">
												<a href="#link-to-user-home"> <img
													class="am-comment-avatar"
													src="<%=basePath%>resources/i/i.jpg">
												</a>
												<div class="am-comment-main">
													<header class="am-comment-hd">
													<div class="am-comment-meta">
														<a class="am-comment-author" href="#link-to-user">某人</a>
														评论于
														<time title="2013年7月27日 下午7:54 格林尼治标准时间+0800"
															datetime="2013-07-27T04:54:29-07:00">2014-7-12
														15:30</time>
													</div>
													<div class="am-comment-actions">
														<a href=""> <i class="am-icon-pencil"></i>
														</a> <a href=""> <i class="am-icon-close"></i>
														</a>
													</div>
													</header>
													<div class="am-comment-bd" style="background-color: white;">
														<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
														<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
													</div>
													<footer class="am-comment-footer"
														style="background-color: white;">
													<div class="am-comment-actions">
														<a href=""> <i class="am-icon-thumbs-up"></i>
														</a> <a href=""> <i class="am-icon-thumbs-down"></i>
														</a> <a href=""> <i class="am-icon-reply"></i>
														</a>
													</div>
													</footer>
												</div>
												</article>

												<article class="am-comment" style="margin-top:15px;"
													data-am-scrollspy="{animation:'slide-bottom', repeat: true}">
												<a href="#link-to-user-home"> <img
													class="am-comment-avatar"
													src="<%=basePath%>resources/i/i.jpg">
												</a>
												<div class="am-comment-main">
													<header class="am-comment-hd">
													<div class="am-comment-meta">
														<a class="am-comment-author" href="#link-to-user">某人</a>
														评论于
														<time title="2013年7月27日 下午7:54 格林尼治标准时间+0800"
															datetime="2013-07-27T04:54:29-07:00">2014-7-12
														15:30</time>
													</div>
													<div class="am-comment-actions">
														<a href=""> <i class="am-icon-pencil"></i>
														</a> <a href=""> <i class="am-icon-close"></i>
														</a>
													</div>
													</header>
													<div class="am-comment-bd" style="background-color: white;">
														<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
														<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
													</div>
													<footer class="am-comment-footer"
														style="background-color: white;">
													<div class="am-comment-actions">
														<a href=""> <i class="am-icon-thumbs-up"></i>
														</a> <a href=""> <i class="am-icon-thumbs-down"></i>
														</a> <a href=""> <i class="am-icon-reply"></i>
														</a>
													</div>
													</footer>
												</div>
												</article>
											</div>
											<div class="am-tab-panel">
												<div class="am-g">
													<div class="am-u-sm-10" style="font-size: 15px;">
														<span class="usp">基础资料</span>
													</div>
													<div class="am-u-sm-2" style="font-size: 15px;">
														<a href="javascript:void(0);" id="xiugai"><span
															class="usp">修改</span> </a>
													</div>
												</div>
												<div class="am-g">
													<div
														style="height: 1px; width: 730px; border-top: 1px #ccc solid; float: left; margin-top: 10px;"></div>
												</div>
												<div class="am-g" style="margin-top: 50px; font-size: 13px;">
													<table class="am-table am-table-bordered am-table-hover">
														<tr>
															<td style="text-align: center;">账户名：</td>
															<td colspan="2"><span id="forName">詠緣|.мīss.чou淰仴</span><input
																type="text" name="userName" style="display: none;"
																value="詠緣|.мīss.чou淰仴" /></td>
														</tr>
														<tr>
															<td style="text-align: center;">密码：</td>
															<td style="width: 200px;"><span id="t1">******</span>
																<span id="t2" style="display: none;">1008611</span> <input
																type="text" name="userPwd" style="display: none;"
																value="******" /></td>
															<td><input type="checkbox" id="check" />显示密码</td>
														</tr>
													</table>
												</div>
												<div class="am-g" id="saveSets"
													style="text-align: center; display: none;">
													<button id="saveSet" type="button"
														class="am-btn am-btn-warning am-btn-sm">保存</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- three:相册 -->
				<div class="am-g" id="three" style="display: none;">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">
							<span class="am-icon-camera-retro us uss"></span> <span
								class="usp">相册</span>
						</div>
						<div class="am-panel-bd">
							<div class="am-tabs" data-am-tabs>
								<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
									<li class="am-active"><a href="javascript: void(0)"><span
											class="usp">相册</span> </a></li>
									<li><a href="javascript: void(0)"><span class="usp">照片墙</span>
									</a></li>
									<li><a href="javascript: void(0)"><span class="usp">视频</span>
									</a></li>
								</ul>
								<div class="am-tabs-bd">
									<div class="am-tab-panel am-active">
										<div class="am-container">
											<!-- 相册显示 -->
											<div class="am-g" id="phot">
												<div class="am-g"
													style="margin-bottom: 10px; margin-left: 20px;">
													<button type="button" class="am-btn am-btn-default"
														onclick="shangchua();">
														<span class="am-icon-picture-o us uss"></span>&nbsp;上传图片
													</button>
													<button type="button" class="am-btn am-btn-default"
														id="chuanjia">创建相册</button>

												</div>
												<div class="am-g">
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;" />
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;"/>
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;"/>
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;"/>
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;"/>
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);"
																onclick="zhanshi(this);">
																<img src="<%=basePath%>resources/i/i.jpg" style="width: 128px; height: 130px;"/>
															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 图片展示 -->
											<div class="am-g" id="zhans" style="display: none;">
												<div class="am-g"
													style="margin-bottom: 10px; margin-left: 20px;">
													<div class="am-u-sm-2">
														<img class="am-thumbnail"
															src="<%=basePath%>resources/i/i.jpg" />
													</div>
													<div class="am-u-sm-4">
														<div class="am-g" style="margin-top: 20px;">
															<span style="font-size: 20px;">相册名称</span>
														</div>
														<div class="am-g" style="margin-top: 20px;">
															<button type="button" class="am-btn am-btn-default"
																onclick="shangchua();">
																<span class="am-icon-picture-o us uss"></span>&nbsp;上传图片
															</button>
														</div>
													</div>
													<div class="am-u-sm-6"></div>
												</div>
												<div class="am-g">
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
													<div class="am-u-sm-2">
														<div class="am-thumbnail">
															<div onmouseover="overs(this);" onmouseout="outs(this);">
																<img src="<%=basePath%>resources/i/2.jpg"
																	style="width: 130px; height: 130px;" />

																<div class="am-dropdown" id="overOut"
																	style="position: absolute; top: 10px; left: 105px; display: none;"
																	data-am-dropdown>
																	<button
																		style="background-color: #FFFFFF; width: 30px; height: 30px;"
																		class="am-btn am-dropdown-toggle"
																		data-am-dropdown-toggle>
																		<span class="am-icon-angle-down us uss"></span>
																	</button>
																	<ul class="am-dropdown-content">
																		<li><a href="#">删除</a></li>
																	</ul>
																</div>

															</div>
															<div class="am-thumbnail-caption">
																<h3>forever</h3>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>


									</div>
									<div class="am-tab-panel">
										<iframe src="<%=basePath%>resources/photoWall/index.html"
											width="950px" height="300px"></iframe>
									</div>
									<div class="am-tab-panel">测试ing。。。</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 尾部 -->
			<div class="am-g" style="margin-top: 50px;">
				<footer data-am-widget="footer" class="am-footer"
					data-am-footer="{  }" style="font-size: 13px;">
				<div class="am-footer-switch">
					<span class="am-footer-ysp" data-rel="mobile"
						data-am-modal="{target: '#am-switch-mode'}">Provence</span> <span
						class="am-footer-divider">|</span> <a id="godesktop"
						data-rel="desktop" class="am-footer-desktop"
						href="javascript:void(0);">电脑版</a>
				</div>
				<div class="am-footer-miscs ">
					<p>
						由 <a href="javascript:void(0);" title="forever" target="_blank">forever</a> 提供技术支持
						CopyRight©2014 AllMobilize Inc. 京ICP备13033158
					</p>
				</div>
				</footer>
				<div id="am-footer-modal"
					class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-default">
					<div class="am-modal-dialog">
						<div class="am-modal-hd am-modal-footer-hd">
							<a href="javascript:void(0)" data-dismiss="modal"
								class="am-close am-close-spin" data-am-modal-close>&times;</a>
						</div>
						<div class="am-modal-bd">
							您正在浏览的是 <span class="am-switch-mode-owner">forever</span> <span
								class="am-switch-mode-slogan">为您私人定制。</span>
						</div>
					</div>
				</div>
			</div>

			<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
				<a href="#top" title="回到顶部"> <span class="am-gotop-title">回到顶部</span>
					<i class="am-gotop-icon am-icon-chevron-up"></i>
				</a>
			</div>
			<!-- ge -->
			<audio src="<%=basePath%>resources/media/Fantastic-Baby.mp3"
				controls="controls" loop="loop" id="audio" style="display:none;"></audio>
		</div>
	</div>

	<!-- 隐藏 -->
	<button class="am-btn am-btn-primary"
		data-am-modal="{target: '#my-publish'}" id="publish"
		style="display: none;">发表字符长度限制</button>

	<div class="am-modal am-modal-alert" tabindex="-1" id="my-publish">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">字符长度限制</div>
			<div class="am-modal-bd">您发表长度过长！请重新输入</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>

	<!-- 创建相册 -->
	<button class="am-btn am-btn-primary"
		data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 225}"
		id="chuanjian" style="display: none;">Modal</button>

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				创建相册 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<div class="am-container">
					<div class="am-g">
						<table style="text-align: center;"> 
							<tr style="height:40px;">
								<td>相册名称：</td>
								<td><input type="text" name="photoName" /></td>
							</tr>
							<tr style="height:40px;">
								<td>相册描述：</td>
								<td><textarea style="resize:none;outline:none;font-size: 12px;width:165px;"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="am-g">
				<button type="button" class="am-btn am-btn-warning am-btn-sm">保存</button>
			</div>
		</div>
	</div>

	<!-- 上传图片 -->
	<button class="am-btn am-btn-primary"
		data-am-modal="{target: '#doc-modal-2', closeViaDimmer: 0, width: 1000, height: 500}"
		id="shangchuan" style="display: none;">上传照片</button>

	<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-2">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				上传照片 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<div class="am-container">
					<div class="am-g">
						<span class="usp">上传到：</span> <select data-am-selected>
							<option value="a">Apple</option>
							<option value="b">Banana</option>
							<option value="o">Orange</option>
							<option value="m">Mango</option>
						</select>
					</div>
					<div class="am-g">
						<%-- <jsp:include page="uploadHtml/index.html"></jsp:include> --%>
						<iframe src="<%=basePath%>resources/uploadHtml/index.html"
							width="960px" height="400px"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 更改头像 -->
	<button class="am-btn am-btn-primary"
		data-am-modal="{target: '#doc-modal-3', closeViaDimmer: 0, width: 600, height: 520}"
		id="setTou" style="display: none;">更改头像</button>
		
	<div id="draggables">
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-3">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				更改头像 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<div class="am-container">
					<div class="am-g">
						<div class="am-tabs" data-am-tabs="{noSwipe: 1}">
							<ul class="am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab2-1">相册选择</a></li>
								<li><a href="#tab2-2">本地上传</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab2-1"
									style="height: 410px;text-align: left;overflow:auto;">
										<table class="am-table am-table-striped">
											<tr>
												<td colspan="3">
													<select data-am-selected id="photoC">
														<!-- 最近一周算（最新照片） -->
														
														
													</select>
												</td>
												<td>
													<div style="margin-top: 5px;text-align: right;">
														<a href="javascript:void(0);">刷新</a>														
													</div>
												</td>
											</tr>
											
										</table>
								</div>
								<div class="am-tab-panel am-fade" id="tab2-2"
									style="height: 410px;text-align: left;overflow:auto;">
									<table class="am-table am-table-striped">
											<tr>
												<td colspan="4">
													<span class="usp">上传到相册：</span> <select data-am-selected>
														<option value="a">Apple</option>
														<option value="b">Banana</option>
														<option value="o">Orange</option>
														<option value="m">Mango</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>
													<div class="am-g-u-3">
														<img src="<%=basePath%>resources/i/2.jpg" style="height:120px;width:120px;" />
													</div>
												</td>
												<td>
													<div class="am-g-u-3">
														<img src="<%=basePath%>resources/i/2.jpg" style="height:120px;width:120px;" />
													</div>
												</td>
												<td>
													<div class="am-g-u-3">
														<img src="<%=basePath%>resources/i/2.jpg" style="height:120px;width:120px;" />
													</div>
												</td>
												<td>
													<div class="am-g-u-3">
														<img src="<%=basePath%>resources/i/2.jpg" style="height:120px;width:120px;" />
													</div>
												</td>
											</tr>
										</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>