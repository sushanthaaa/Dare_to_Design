<%
// Remove the session attribute for email
session.removeAttribute("email");
// Invalidate the session
session.invalidate();
// Redirect to the main page
response.sendRedirect("mainpage.jsp");
%>
<script>
  alert("You have logged out. Please login again to view the page.");
</script>