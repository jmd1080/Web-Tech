<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<title>AIESEC UK NTT</title>
<link rel="stylesheet" type="text/css" media="screen" href="../style.css"/>
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" media="screen" href="../ie8.css"/>
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" media="screen" href="../ie6.css"/>
<![endif]-->
</head>
<body>
<%@page import=
"java.util.*,
javax.naming.*,
java.sql.*,
javax.sql.*"
%>
<%
Context i = new InitialContext();
Context e = (Context) i.lookup("java:/comp/env");
DataSource d = (DataSource) e.lookup("jdbc/data");
Connection con = d.getConnection();

String username;
String forename;
String surname;
String email;

boolean isTrainer = false;

if (session.getAttribute( "username" ) != null) {
    username = session.getAttribute( "username" ).toString();
}
else {
    response.sendRedirect("../../login.html");
    return;
}

String sql="SELECT * FROM app.users where"
+" username=?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,username);

ResultSet rs = ps.executeQuery();

if (rs.next())
{
    forename = rs.getString("forename");
    surname = rs.getString("surname");
    email = rs.getString("email");
}
else {
    session.invalidate();
    response.sendRedirect("../../login.html");
    return;
}

sql="SELECT t.picture, t.about FROM app.trainers t, app.TRAINER_RELATIONS r"
+" WHERE (t.id = r.trainerid) AND (r.userid = ?) ";

ps = con.prepareStatement(sql);

ps.setInt(1,rs.getInt("id"));
rs = ps.executeQuery();

String picture = "";
String description = "";

if (rs.next())
{
    isTrainer = true;
    picture = rs.getString("picture");
    description = rs.getString("about");
}
%>
<header>
<a href="../index.html"><img src="../logo.png" alt="NTT logo"/></a>
<nav><div class="navigate">
<ul>
<li>
<a href="../about.html">About</a>
</li>
<li>
<a href="../partners.html">Partners</a>
</li>
<li>
<a href="../events.html">Events</a>
</li>
<li>
<a href="../team.html">Trainers</a>
</li>
<li>
<a href="../login.html">Log in</a>
</li>
</ul>
</div></nav>
</header>
<div class="info double">
<h1 class = "maintitle">Welcome <%=forename%>!</h1>
<div class = "leftcol">
<div class="box">
<h2> User Info </h2>
<p>
<strong> 
Username: 
</strong>
<%=username%> 
</p>
<p>
<strong>
Forename: 
</strong>
<%=forename%>
</p>
<p>
<strong>
Surname: 
</strong>
<%=surname%>
</p>
<p>
<strong>
Email: 
</strong>
<%=email%>
</p>
<% if (isTrainer) { %>
    <hr/>
    <h2> Trainer Info </h2>
    <p>
    <strong>
    Trainer Description: 
    </strong>
    </p>
    <p>
    <%=description%>
    </p>
<% } %>
</div>
</div>
<div class = "rightcol">
<div class = "sideimage">
<% if (!isTrainer) { %>
<img src="../info/pictures/sillouete.png" alt="Placeholder" height="300" width="300"/>
<%} else {%>
<img src="<%="../info/pictures/"+picture%>" alt="Placeholder" height="300" width="300"/>
<%}%>
</div>
</div>
<div class="endinfo"></div>
</div>
<footer>
<nav><div class="navigate">
<ul>
<li>
<a href="../about.html">About</a>
</li>
<li>
<a href="../partners.html">Partners</a>
</li>
<li>
<a href="../events.html">Events</a>
</li>
<li>
<a href="../team.html">Trainers</a>
</li>
<li>
<a href="../login.html">Log in</a>
</li>
<li>
<a href="contact.html" title="contact">Contact Us</a>
- &#x00A9; AIESEC UK NTT 2012
</li>
</ul>
</div></nav>
</footer>
</body>
</html>
