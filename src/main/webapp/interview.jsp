<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>面试签到</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
  <script type="text/javascript">
    function sub(){
    	var select=$('input[name="RadioOptions"]:checked').val();
    	$.ajax({  
    		type:"post", 
    	    url:"customers_add.action",
    	    data:{
    	    	name:$("#name").val(),
    	    	mobile:$("#mobile").val(),
    	    	job:$("#job").val(),
    	    	major:$("#major").val(),
    	    	university:$("#university").val(),
    	    	jobYears:$("#jobYears").val(),
    	    	select:select},
    	    datatype:"json",
    	    success:function(data){
                alert(data.msg);
    	    } 
    	}) 
    } 
  </script>
  </head>
<body>
  <div class="container">
   <form>
	<h3><strong>面试签到表</strong></h3>
	<hr/>
    <div class="form-group">
      <label for="name">姓名</label>
      <input type="text" class="form-control input-sm" id="name" />
    </div>
	<div class="form-group">
      <label for="mobile">手机号码</label>
      <input type="text" class="form-control input-sm" id="mobile" />
    </div>
	<div class="form-group">
      <label for="job">应聘岗位</label>
      <input type="text" class="form-control input-sm" id="job" />
    </div>
	<div class="form-group">
      <label for="major">专业</label>
      <input type="text" class="form-control input-sm" id="major" />
    </div>
	<div class="form-group">
      <label for="university">毕业学校</label>
      <input type="text" class="form-control input-sm" id="university" />
    </div>
	<div class="form-group">
      <label for="jobYears">工作年限</label>
      <input type="text" class="form-control input-sm" id="jobYears" />
    </div>	
	<label>渠道来源</label><br/>
	<div class="form-group">
	  <label class="radio-inline">
        <input type="radio" name="RadioOptions" id="inlineRadio1" value="智联招聘" checked="true">智联招聘
      </label>
      <label class="radio-inline">
        <input type="radio" name="RadioOptions" id="inlineRadio2" value="前程无忧">前程无忧
      </label>
      <label class="radio-inline">
        <input type="radio" name="RadioOptions" id="inlineRadio3" value="58">58
      </label><br/>
	  <label class="radio-inline" style="margin-top:8px">
        <input type="radio" name="RadioOptions" id="inlineRadio4" value="赶集">赶集
      </label>
      <label class="radio-inline" style="margin-top:8px">
        <input type="radio" name="RadioOptions" id="inlineRadio5" value="人才市场">人才市场
      </label>  
    </div>
	<button type="button" class="btn btn-success btn-block" onclick="sub()">提交</button><label id="lb"></label>
   </form>
  </div>	
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>