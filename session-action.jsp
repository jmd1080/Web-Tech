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
