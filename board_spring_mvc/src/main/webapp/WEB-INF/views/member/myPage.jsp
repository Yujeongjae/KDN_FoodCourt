<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
<style>
	.form-group {
		width: 600px;
	}
	.form-title {
		font-size: 30px;
		font-style: bold;
		padding: 10px;
	}
</style>
<script type="text/javascript">
	var pwConfirm = false;
	
	function back(){
		history.back()
	}
	
	function check(){
		var pw = document.getElementById("password").value;
		var pc = document.getElementById("password_confirm").value;
		if(pw == pc){
			document.getElementById("frm").submit();
		}
		else{
			alert("두 비밀번호가 일치하지 않습니다.");
			document.getElementById("password_confirm").value = "";
		}
	}
</script>
</head>
<body>
<center>
<form class="form-horizontal" action = "updateMember.do?mno=${member.mno}" id = "frm" method = "POST">
<fieldset>
	<legend class="form-title">UPDATE</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="mno">ID</label>
      <div class="col-lg-10">
        <div class="form-control" id="mno" name = "mno" value = "${member.mno}" align = "left">${member.mno}</div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="password">Password</label>
      <div class="col-lg-10">
        <input class="form-control" type = "password" name = "password" id="password" value = "${member.password}" >
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="password">Confirm Password</label>
      <div class="col-lg-10">
        <input class="form-control" type = "password" name = "password_confirm" id="password_confirm">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="mname">Name</label>
      <div class="col-lg-10">
        <input class="form-control" id="mname" name = "mname" type="text" value = "${member.mname}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="phone">Phone</label>
      <div class="col-lg-10">
        <input class="form-control" id="phone" name = "phone" type="text" value = "${member.phone}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="email">Email</label>
      <div class="col-lg-10">
        <input class="form-control" id="email" name = "email" type="text" value = "${member.email}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="checkbox">Menu</label>
      <div class="col-lg-10">
        <input type="checkbox" value="김치찌개"/>김치찌개
        <input type="checkbox" value="된장찌개"/>된장찌개
        <input type="checkbox" value="부대찌개"/>부대찌개
        <input type="checkbox" value="순두부찌개"/>순두부찌개
        
        <span class="help-block">Please select the menu you want to receive notifications</span>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
	    <button class="btn btn-primary" type="button" onclick ="check()">Submit</button>
        <button class="btn btn-default" type="button" onclick ="back()">Cancel</button>
      </div>
    </div>
</fieldset>
</form>
</center>
</body>
</html>