<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Login</title>
</head>

<body>

<%-- Source http://www.roseindia.net/quickguide/tomcat/Logout.shtml --%>
<%@page import=
"java.util.*,
javax.naming.*,
java.sql.*,
javax.sql.*,
java.security.*,
com.AeSimpleMD5"
%>
<%
Context i = new InitialContext();
Context e = (Context) i.lookup("java:/comp/env");
DataSource d = (DataSource) e.lookup("jdbc/data");
Connection con = d.getConnection();

AeSimpleMD5 md5 = new AeSimpleMD5();

String username = request.getParameter("username");
String password = request.getParameter("pword");

// Get the salt (used to prevent use of rainbow tables)

String sql="SELECT * FROM app.users where"
+" username=?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,username);

ResultSet rs = ps.executeQuery();

int salt = 0;

if (rs.next())
{
    salt = rs.getInt("salt");
}

// Get the md5 Hash
String md5hash = md5.MD5(password + salt);

sql="SELECT * FROM app.users where"
+" username=? and password=?";

ps = con.prepareStatement(sql);

ps.setString(1,username);
ps.setString(2,md5hash);

rs = ps.executeQuery();

if (rs.next())
{
    session.setAttribute("username", request.getParameter("username"));
    response.sendRedirect("log.jsp");
}

if(ps!=null){
    ps.close();
}
if(rs!=null){
    rs.close();
}

if(con!=null){
    con.close();
}

%>

</body>
</html>
