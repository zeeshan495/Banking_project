<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
</head>
<body>
<%-- <% 
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("mail"))
	{
		userName = cookie.getValue();	
	}
	if(cookie.getName().equals("JSESSIONID"))
	{
		sessionID = cookie.getValue();
	}
	else{
		sessionID = session.getId();
	}
	}
}
	if(userName == null) 
		response.sendRedirect("index.jsp");	
	%> --%>
	<%
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null){
	response.sendRedirect("LoginForm.jsp");
}else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>
	<%String mailId = request.getParameter("mailId");
	out.println(mailId); %>
<h2>Welcome to user</h2>
<br>
<form action="logoutUrl" method="post">
<input type="submit" value="Logout" >
</form>
<br>
</body>
</html>