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
<title>注册</title>
<jsp:include page="warterMark.jsp" />
<style type="text/css">
	body{
		font-size: 13px;
		width: 1300px;
	}
</style>

<script type="text/javascript">
	var field = '';//判断用户名是否已注册，0是没注册，1是已注册
	
	function userNameBlur(){
		//用户名是否存在
		checkUserName();
	}
	function registerClick(){
		//$("[name=userName]").unbind("userNameBlur");
		var userName = $("[name=userName]").val();
		var userPwd = $("[name=userPwd]").val();
		var userOrPwd = $("[name=userOrPwd]").val();
		var userNameNick = $("[name=userNameNick]").val();
		console.info(userNameNick);
		checkUserName();
		//console.info(field);
		if (userName == null || userName == "") {
			$("#UName").trigger("click");
		}else if(field != '0'){
			$("#UuName").trigger("click");
		}else if(userNameNick == null || userNameNick == ""){
			$("#UNameNick").trigger("click");
		}else if(userPwd == null || userPwd == ""){
			$("#UPwd").trigger("click");
		}else if(userOrPwd == null || userOrPwd == ""){
			$("#truePwd").trigger("click");
		}else if(userOrPwd != userPwd){
			$("#OrPwd").trigger("click");
		}else{
			registerSub(userName,userPwd,userNameNick);
		}
	}
	//注册
	function registerSub(userName,userPwd,userNameNick){
		$.ajax({
			url:"<%=basePath%>user/regi",
			type:"post",
			data:{
				userName:userName,
				userPwd:userPwd,
				userNick:userNameNick
			},
			success:function(data){
				//console.info(data);
				if(data == 0){
					$("#registerTip").trigger("click");
				}else{
					//console.info(2);
					$("#my-registers").modal({
				        relatedTarget: this,
				        onConfirm: function() {
				          window.location.href="<%=basePath%>user/index";
				        }
				      });
				}
			}
		});
	}
	//检查用户是否存在
	function checkUserName(){
		var userName = $("[name=userName]").val();
		if(userName != null && userName != ''){
			$.ajax({
				url:"<%=basePath%>user/checkUser",
				type:"post",
				data:{
					userName:userName
				},
				success:function(data){
					if(data == 1){
						//已注册
						$("#UuName").trigger("click");
						field = 1;
					}else{
						//未注册
						$("#tip_userName").empty();
						field = 0;
					}
				},
				error:function(){
					$("#UuName").trigger("click");
				}
			});
		}else{
			$("#UName").trigger("click");
		}
		return;
	}
	$(document).ready(function() {
		
	});
</script>
</head>

<body style="background-image: url('<%=basePath%>resources/i/maixiang.jpg');">
	<div class="am-container">
		<div class="am-g" style="height:80px;">
			标题
		</div>
		<div class="am-g">
			<div class="am-u-sm-3">&nbsp;&nbsp;</div>
			<div class="am-u-sm-6">
				<section class="am-panel am-panel-default">
				  <div class="am-panel-bd">
				    <form class="am-form" action="userLogin"
								method="post" id="sub">
								<fieldset>
									<div class="am-form-group" style="margin-top: 15px;">
											<label for="doc-ipt-userName-1">账户名：</label> 
											<input type="text" onblur="userNameBlur();" id="doc-ipt-userName-1" name="userName" autocomplete="off"/>
									</div>
									<div class="am-form-group" style="margin-top: 15px;">
											<label for="doc-ipt-userNick-1">昵称：</label> 
											<input type="text" id="doc-ipt-userNick-1" name="userNameNick" autocomplete="off"/>
									</div>
									<div class="am-form-group">
											<label for="doc-ipt-pwd-1">密码：</label> 
											<input type="password" id="doc-ipt-pwd-1" name="userPwd" autocomplete="off" />
									</div>
									<div class="am-form-group">
											<label for="doc-ipt-pwd-2">确认密码：</label> 
											<input type="password" id="doc-ipt-pwd-2" name="userOrPwd" autocomplete="off" />
									</div>
									<div style="text-align: center;">
										<button type="button" onclick="registerClick();" class="am-btn am-btn-warning am-btn-sm" id="register">点击注册</button>
									</div>
								</fieldset>
							</form>
				  </div>
				</section>
			</div>
			<div class="am-u-sm-3">&nbsp;&nbsp;</div>
		</div>
	</div>
	<div class="am-g" style="height:100px;"></div>
	
	<div class="am-g">
	
		<!-- 用户名提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-name'}" id="UName"
			style="display: none;">用户名提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-name">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">用户名提示</div>
				<div class="am-modal-bd">请输入用户名</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		
		<!-- 用户名昵称提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-nameNick'}" id="UNameNick"
			style="display: none;">用户名昵称提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-nameNick">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">用户名昵称提示</div>
				<div class="am-modal-bd">请输入用户名昵称</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-names'}" id="UuName"
			style="display: none;">用户名提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-names">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">用户名提示</div>
				<div class="am-modal-bd">用户名已存在，请重新输入您的用户名！</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
	
		<!-- 注册提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-register'}" id="registerTip"
			style="display: none;">注册提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-register">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">注册提示</div>
				<div class="am-modal-bd">注册失败，请重新注册！</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-registers">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">注册提示</div>
				<div class="am-modal-bd">恭喜你注册成功！</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>

		<!-- 密码提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-Pwd'}" id="UPwd" style="display: none;">密码提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-Pwd">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">密码提示</div>
				<div class="am-modal-bd">请输入密码</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>

		<!-- 确认密码提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-truePwd'}" id="truePwd"
			style="display: none;">确认密码提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-truePwd">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">确认密码提示</div>
				<div class="am-modal-bd">请输入确认密码</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>

		<!-- 两次密码提示 -->
		<button class="am-btn am-btn-primary"
			data-am-modal="{target: '#my-OrPwd'}" id="OrPwd"
			style="display: none;">确认密码提示</button>

		<div class="am-modal am-modal-alert" tabindex="-1" id="my-OrPwd">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">提示</div>
				<div class="am-modal-bd">两次密码不匹配，请重新输入！</div>
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
