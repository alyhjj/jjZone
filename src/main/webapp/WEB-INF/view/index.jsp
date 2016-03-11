<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html class="no-js">
<head>
<%-- <base href="<%=basePath%>resources/"> --%>
<jsp:include page="warterMark.jsp" />
<title>分享精彩，留住回忆</title>
<style type="text/css">
	body{
		font-size: 15px;
		width: 1300px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//回车事件
		$(this).keydown(function (e){
			if(e.which == "13"){
				login();
			}
		})
		
		$("#login").click(function() {
			login();
		})
	});
	
	function login(){
		var userName = $("[name=userName]").val();
		var userPwd = $("[name=userPwd]").val();
		if (userName == null || userName == "") {
			$("#UName").trigger("click");
		}else if(userPwd == null || userPwd == ""){
			$("#UPwd").trigger("click");
		}else{
			var user = {
					userName:userName,
					userPwd:userPwd
			}
			$.ajax({
				url:"<%=basePath%>user/login",
				type:"post",
				dataType:"json",
				data:user,
				success:function(data){
					if(data != 1){
						$("#my-submits").trigger("click");
					}else{
						window.location.href="<%=basePath%>user/home";
					}
				},error:function(){
					$("#my-submits").trigger("click");
				}
			});
		}
	}
</script>
</head>

<body style="background-image: url('<%=basePath%>resources/i/I MISS YOU.jpg');">
	<div class="am-container">
		<div class="am-g" style="height:80px;"></div>
		<div class="am-g">
			<div class="am-u-sm-7" >
				<%-- ${user.userName }---${user.userPwd } --%>
			</div>
			<div class="am-u-sm-5">
				<!-- 登陆框 -->
				<section class="am-panel am-panel-warning">
				  <header class="am-panel-hd">
				    <h3 class="am-panel-title">账号密码登录</h3>
				  </header>
				  <div class="am-panel-bd">
				    <form class="am-form">
								<fieldset>
									<div class="am-form-group" style="margin-top: 15px;">
										<input type="text" name="userName"
											placeholder="请输入账号" autocomplete="off" value="${user.userName }"/>
									</div>
									<div class="am-form-group">
										<input type="password" name="userPwd" placeholder="请输入密码" autocomplete="off" value="${user.userPwd }"/>
									</div>
									<div style="float:right;margin-top: 20px;">
										<button id="login" type="button"
											class="am-btn am-btn-warning am-btn-sm">登录</button>
										<a href="<%=basePath%>user/register"><button type="button"
												class="am-btn am-btn-sm" style="background-color: #F0A890;color: white;">注册</button> </a>
									</div>
								</fieldset>
							</form>
				  </div>
				</section>
			</div>
		</div>
	</div>
	<div class="am-g" style="height:160px;"></div>
	<div class="am-g">
	
	<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-submit'}"  id="my-submits" style="display: none;">登录提示</button>
			
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-submit">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">登录提示</div>
				<div class="am-modal-bd">！登录失败！</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>
	
	<!-- 用户名提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-name'}"  id="UName" style="display: none;">用户名提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-name">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">用户名提示</div>
				<div class="am-modal-bd">请输入用户名</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		
		<!-- denglu提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-login'}"  id="loginTipp" style="display: none;">用户名提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-login">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">登录提示</div>
				<div class="am-modal-bd">请重新输入登录</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-registers'}"  id="registers" style="display: none;">注册提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-registers">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">注册提示</div>
				<div class="am-modal-bd">恭喜你注册成功！</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		
		
		<!-- 密码提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-Pwd'}"  id="UPwd" style="display: none;">密码提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-Pwd">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">密码提示</div>
				<div class="am-modal-bd">请输入密码</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<div class="am-g">
		<footer data-am-widget="footer" class="am-footer"
			data-am-footer="{  }"  style="font-size: 13px;">
		<div class="am-footer-switch">
			<span class="am-footer-ysp" data-rel="mobile"
				data-am-modal="{target: '#am-switch-mode'}">Provence</span> <span
				class="am-footer-divider">|</span> <a id="godesktop"
				data-rel="desktop" class="am-footer-desktop" href="javascript:void(0);">电脑版</a>
		</div>
		<div class="am-footer-miscs ">
			<p>
				由 <a href="javascript:void(0);" title="forever" target="_blank">forever</a> 提供技术支持 CopyRight©2014 AllMobilize Inc. 京ICP备13033158
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
			<i class="am-gotop-icon am-icon-chevron-up" style="height:25px;padding-top: 4px;"></i> </a>
	</div>

</body>
</html>
