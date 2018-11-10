<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
<link rel="stylesheet" href="login.css"/>
<script type="text/javascript">
	function validEmail() {
		var mail = document.myForm.mailId.value;
		var mailFormat = /^[a-zA-Z]+[a-zA-Z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
		console.log(mail);
		if (!mailFormat.test(mail)) {
			document.getElementById("email").innerHTML = "incorrect mail id";
			return false;
		} else {
			document.getElementById("email").innerHTML = "";
			return true;
		}
	}
</script>
</head>
<body>
<div class="login">
<h2>login form</h2>
<form action="homeUrl" name="myForm" method="post">
<table>
				<tr>
					<td>mail Id</td>
					<td><input type="text" onchange="validEmail(this.value)" name="mailId"
						id="mailId"></td>
				</tr>
				<tr>
					<td colspan="2"><span  id="email" ></span></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
				<td colspan="2"><br></td>
				</tr>
				<tr id="submit">
					<td><input type="submit" value="LOGIN"></td>
					<td><a href="RegisterForm.jsp">Register here</a></td>
				</tr>
			</table>
			</form>
			</div>		
</body>
</html>