<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<title>Random</title>
</head>
<% double r = Math.random(); %>
<%= r %>
<% if (r < 0.5) { %>
<p>The dish of the day is duck.</p>
<% } else { %>
<p>Duck is off the menu.</p>
<% } %>
<hr/>
</html>
