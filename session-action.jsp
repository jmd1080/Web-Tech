<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Login</title>
</head>

<body>

<%-- Source http://www.roseindia.net/quickguide/tomcat/Logout.shtml --%>
<%@page import="java.util.*" %>
<%String str = request.getParameter("username");

session.setAttribute("username", request.getParameter("username"));%>
Welcome to <%= session.getAttribute( "username" ) %>

<% if (session.getAttribute("username").equals("")){%>
<a href="login.jsp"><b>Login </b></a>
<%}
else{%>
<a href="logout.jsp"><b>Logout</b></a>
<%}
%>

</body>
</html>
