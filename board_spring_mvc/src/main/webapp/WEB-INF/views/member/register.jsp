<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
<form class="form-horizontal">
<fieldset>
	<legend>REGISTER</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="id">ID</label>
      <div class="col-lg-10">
        <input class="form-control" id="mno" type="text" placeholder="ID">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="password">Password</label>
      <div class="col-lg-10">
        <input class="form-control" id="password" type="password" placeholder="Password">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="name">Name</label>
      <div class="col-lg-10">
        <input class="form-control" id="mname" type="text" placeholder="Name">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="phone">Phone</label>
      <div class="col-lg-10">
        <input class="form-control" id="phone" type="text" placeholder="Phone">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="email">Email</label>
      <div class="col-lg-10">
        <input class="form-control" id="email" type="text" placeholder="Email">
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
        <button class="btn btn-default" type="reset">Cancel</button>
        <button class="btn btn-primary" type="submit">Submit</button>
      </div>
    </div>
</fieldset>
</form>
</body>
</html>