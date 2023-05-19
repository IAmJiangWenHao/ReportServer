<%@page import="com.report.javabeans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  response.setHeader("Pragma", "no-cache");
  response.addHeader("Cache-Control", "must-revalidate");
  response.addHeader("Cache-Control", "no-cache");
  response.addHeader("Cache-Control", "no-store");
  response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
    <body>
      <%
     session.removeAttribute("user");

          response.sendRedirect("login.jsp");

    %>
    </body>
</html>