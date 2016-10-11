<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap 实例</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function showDetail (id, name ,age) {
  document.getElementById("edit_username").value = name;
  document.getElementById("age").value = age;
  document.getElementById('sid').value = id;
} 

function findId (id) {

  $.post("del.action",
  {
    id:id
  },
  function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
}

</script>
  
</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>		
        </button>
        <a class="navbar-brand" href="#">善班</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">咨询数据</a></li>                
          <li><a href="#">数据汇总</a></li>              
          <li><a href="#">预报数据</a></li>  
        </ul>
	    <ul class="nav navbar-nav navbar-right">
		  <li>
		    <a href="#" role="button">
		      <span class="glyphicon glyphicon-user"></span> 用户
		    </a>	  
		  </li>       
	    </ul>
      </div>
    </div>
  </nav>
  <div class="container-fluid" style="padding-top: 50px;">
	<h1>咨询数据</h1>
	<hr/>
	<div>
	  <form class="form-inline">
	    <label>开始日期</label>
	    <div class="input-group">
	      <input type="text" class="form-control" value="2016-10-06">
	      <span class="input-group-addon">
	        <span class="glyphicon glyphicon-calendar"></span>
		  </span>
		</div>
	    <label>结束日期</label>
	    <div class="input-group">
	      <input type="text" class="form-control" value="2016-10-06">
	      <span class="input-group-addon">
	        <span class="glyphicon glyphicon-calendar"></span>
		  </span>
		</div>
		<div class="form-group">
	      <button type="button" class="btn btn-danger" >查询</button>
		  <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#myadd">添加</button>
		</div>
	  </form>
	</div>
	<hr/>
	<table class="table">
	  <thead>
		<tr>
		  <th>序号</th>
		  <th>姓名</th>
		  <th>年龄</th>
		</tr>
	  </thead>
	  <tbody id="tbl">
	    <c:forEach items="${students}" var="student">
	    <tr>
	    
	      <td>
	        <button id="delete" onclick="findId('${student.id}')">删除</button>
	        &nbsp;
	        <button data-toggle="modal" data-target="#modify" onclick="showDetail('${student.id}', '${student.name}', '${student.age}')" >更新</button>
	      </td>
	      <td>${student.name}</td>
	      <td>${student.age}</td>
	    </tr>	
	    </c:forEach>
	  </tbody>	
	</table>
  </div>
  
  <div class="modal fade" id="modify" role="dialog">
    <div class="modal-lg modal-dialog">
    <form class="form-horizontal" action="update.action" method="post">
	  <div class="modal-content">
	    <div class="modal-header">
		  <button type="button" class="close" aria-label="Close" >
		   <span aria-hidden="true">&times;</span>
		  </button>
		  <h4 class="modal-title">Student</h4>
		</div>
		<form class="form-horizontal" action="update.action" method="post">
		  <div class="modal-body">  
			<div class="form-group">
			  <label class="col-sm-2 control-label">姓名</label>
			  <div class="col-sm-4">
				<input class="form-control" id="edit_username" name="name">
			  </div>
			  <label class="col-sm-2 control-label">年龄</label>
			  <div class="col-sm-4">
				<input class="form-control" id="edit_age" name="age">
			  </div>
			</div>
			<input id="sid" type="hidden" name="id" />
			
		  </div>
		
		<div class="modal-footer">
		  <button type="button" class="btn btn-success" id="modifycommit">提交</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		</div>
	  </div>
	  </form>
	</div>
  </div>
  
  
  
<div class="modal fade" id="myadd" role="dialog">
  <div class="modal-lg modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">转预报</h4>
      </div>
      <form class="form-horizontal" action="add.action" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" >姓名</label>
            <div class="col-sm-4">
			  <input class="form-control" name="name" id="sname">
		    </div>
            <label class="col-sm-2 control-label">年龄</label>
			<div class="col-sm-4">
			  <input class="form-control" name="age" id="sage">
			</div>
		 </div>
		 <div class="form-group">
		   <label class="col-sm-2 control-label">班级</label>
		   <div class="col-sm-4">
		     <input class="form-control" id="grade">
		   </div>
		 </div> 
 		</div>
	    <div class="modal-footer">
	      <button type="button" class="btn btn-success" id="commit">提交</button>
	      <button type="button" class="btn btn-default" id="cancel" data-dismiss="modal">取消</button>
	    </div>
      </form>  
    </div>
  </div>
</div>
  
  <div class="modal fade" id="yesnoremove" role="dialog">
    <div class="modal-xs modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
		  <button type="button" class="close" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		  <h4 class="modal-title">转预报</h4>
		</div>
		<div class="modal-body">
		    <h3><label>您确定要删除吗</label></h3>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-success" onclick="remove(this)" >确定</button>
		  <button type="button" class="btn btn-default" id="cancel" data-dismiss="modal">取消</button>
		</div>
		
	  </div>
	</div>
  </div>
   <script type="text/javascript">
$("#commit").click(function(){
  $.post("add.action",
  {
    name:$("#sname").val(),
    age:$("#sage").val()
  },
  function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});

$("#modifycommit").click(function(){
  $.post("add.action",
  {
    name:$("#edit_username").val(),
    age:$("#edit_age").val()
  },
  function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});



  </script>
</body>
</html>