<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="register.css">
<script type="text/javascript">
	function mailMessage(inputMail) {
		var mailFormat = /^[a-zA-Z]+[a-zA-Z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
		if (!mailFormat.test(inputMail)) {
			document.getElementById("email").innerHTML = "incorrect mail id";
			return false;
		} else {
			document.getElementById("email").innerHTML = "";
			return true;
		}
	}
	function lengthMessage(inputData) {
		if (inputData.length < 4) {
			document.getElementById("uname").innerHTML = "atleast 4 characters";
			return false;
		} else {
			document.getElementById("uname").innerHTML = "";
			return true;
		}
	}
	function pwdLength(inputData) {
		if (inputData.length < 4) {
			document.getElementById("pwd").innerHTML = "atleast 4 characters";
			return false;
		} else {
			document.getElementById("pwd").innerHTML = "";
			return true;
		}
	}
	function pwdMatch(inputData) {
		var password = document.myForm.Password.value;
		if (inputData != password) {
			document.getElementById("repwd").innerHTML = "Password doesnot match";
			return false;
		} else {
			document.getElementById("repwd").innerHTML = "";
			return true;
		}
	}
</script>
<title>Register</title>
</head>
<body>
	<div class="register">
		<h2>Welcome to User Registration</h2>
		<form action="SaveUrl" name="myForm" 
			method="post">
			<table>
				<tr>
					<td>UserName</td>
					<td><input type="text" onchange="lengthMessage(this.value)"
						id="userName" name="uName"></td>
				</tr>
				<tr>
					<td colspan="2"><span id="uname"></span></td>
				</tr>
				<tr>
					<td>FullName</td>
					<td><input type="text" id="fullName" name="fName" required></td>
				</tr>
				<tr>
					<td colspan="2"><span id="fname"></span></td>
				</tr>
				<tr>
					<td>Mail</td>
					<td><input type="email" onchange="mailMessage(this.value)"
						id="mailId" name="mail"></td>
				</tr>
				<tr>
					<td colspan="2"><span id="email"></span></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" onchange="pwdLength(this.value)"
						id="password" name="Password"></td>
				</tr>
				<tr>
					<td colspan="2"><span id="pwd"></span></td>
				</tr>
				<tr>
					<td>Retype_Password</td>
					<td><input type="password" onchange="pwdMatch(this.value)"
						name="Repassword"></td>
				</tr>
				<tr>
					<td colspan="2"><span id="repwd"></span></td>
				</tr>
				<tr>
					<td><input type="submit" value="Register"></td>
				</tr>
			</table>		
		</form>
		</div>


</body>
</html>