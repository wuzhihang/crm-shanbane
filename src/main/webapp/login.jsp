<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>用户登录</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
</head>
<body style="padding-top: 80px;">
<div class="container well well-lg" style="width: 420px;">
  <h1 class="text-center" style="padding:30px 0">用户登录</h1>
  <form class="form-horizontal" method="POST" action="login.htm">
    <div>
	  <div class="form-group">
        <div class="input-group">
          <div class="input-group-addon">
			<span class="glyphicon glyphicon-user"></span>
		  </div>
          <input class="form-control" type="email" name="username" placeholder="电子邮箱">
        </div>
      </div>
     
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-addon">
			<span class="glyphicon glyphicon-lock"></span>
		  </div>
          <input class="form-control" type="password" name="pwd" placeholder="密码">
        </div>
      </div>
	  <div class="form-group">
        <button class="btn btn-success  btn-lg btn-block" type="submit">
          <span class="glyphicon glyphicon-ok"></span> 登录
        </button>
	  </div>
	</div>
  </form>
</div>

<div class="modal fade" id="errInfo">
  <div class="modal-xs modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">登录失败</h4>
      </div>
      <div class="modal-body">
        <h3>${errCode}</h3>
      </div>
      <div class="modal-footer">
        <button class="btn btn-default" type="button" data-dismiss="modal">确定</button>
      </div>
    </div>
  </div>
</div>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  var errCode = "${errCode}";
  if (errCode) {
    $('#errInfo').modal('show');
  }
});
</script>
</body>
</html>
