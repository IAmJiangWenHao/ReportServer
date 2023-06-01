<%@page import="com.report.dbutils.dao.SCDAOImpl"%>
<%@page import="com.report.dbutils.dao.SCDAO"%>
<%@page import="com.report.javabeans.ExpClass"%>
<%@page import="com.report.javabeans.Project"%>
<%@page import="com.report.javabeans.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/tlds/reporttag_library" prefix="mytag" %>
<!--script type="text/javascript" src="${pageContext.request.contextPath}/script/scriptV1.js?v=1.0"></script-->
<!DOCTYPE html>
<html>
  <%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    
   

  %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title >学生个人中心 </title>    
  </head>
  <body>
    <style>
            .topbar-item{
        padding: 10px; 
        border-right: 1px solid white;
        cursor:hand;
        background-color: rgba(240, 240, 240, 1)
      }
      .topbar-item:hover{
        background-color: gainsboro


      }
    </style>
    <div style="display:flex;font-size: 26px;background-color: buttonface;">
      <a href="student.jsp" class="topbar-item" style="color: black;text-decoration:none;"> 实验报告上传</a>
      <div class="topbar-item"><a style="color: black;text-decoration:none;" href="exit.jsp">安全退出</a></div>
      <div class="topbar-item"><a style="color: black;text-decoration:none;" href="WEB-INF/set_password_email.jsp">修改密码</a></div>
      <div class="topbar-item"><a style="color: black;text-decoration:none;" href="message.jsp">学生个人中心</a></div>
    </div>  
    <div style="display: flex; flex-direction:column;align-items: center;font-size: 30px;line-height: 50px;">
        <div  >${sessionScope.user.fullname}</div> 

      <div>id:${sessionScope.user.username}</div>
      <div>email:${sessionScope.user.email}</div>
      <div>test:${sessionScope}</div>
    </div> 
</body>
</html>