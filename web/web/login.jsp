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

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>登录</title>
</head>

<body>
  <style>
    dfv {
      height: 100%;
      width: 100%;
      position: absolute;

    }

    form {
      height: 100%;
    }

    table {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
     table tbody{
      box-shadow: 0 0 2px 2px rgba(30, 30, 4, 0.1);

    }


    table tbody:hover{
      box-shadow: 0 0 10px 5px rgba(30, 30, 4, 0.3);
    }

    table tbody tr {
      display: flex;
      border-radius: 20px;
      width: auto;
      height: auto;
      padding: 10px;
      font-size: 26px;
      background-color: #fff;
      position: relative;
      justify-content: space-between
    }
    table tbody tr td a{
      color: #000;
      text-decoration:none;
    }
    table tbody tr td a:hover{
      box-shadow: 0 0 10px 5px rgba(30, 30, 4, 0.3);
    }
    table tbody tr td input{
      border: 0;
      background-color: #fff;
    }
    table tbody tr td input:hover{
      border: 0;
      box-shadow: 0 0 10px 5px rgba(30, 30, 4, 0.3);
    }
  </style>

  <script type="text/javascript"> //这里是JavaScript
    window.onload = function () {
      document.getElementById("img").onclick = function () {
        /*document.getElementById()通过元素的id来获取元素，
         .getElementById("img")先获取"img" 元素；
         然后.onclick()，点击触发一个事件，这个事件发生会执行funciton()函数。               
         目的:点击id为img的页面元素时会触发funciton函数。生成验证码*/
        this.src = "CheckcodeServlet?time" + new Date().getTime();
        //new Date().getTime()增加时间戳来更换验证码图片
      };
    };

  </script>
  <script type="text/javascript">
    //检查输入是否为空
    function Check() {
      const username = document.form1.username.value;
      const password = document.form1.password.value;
      const checkcode = document.form1.checkcode.value;

      if (!username) {
        alert("用户名不能为空！");
        document.form1.username.focus();
        return false;
      }

      if (!password) {
        alert("密码不能为空！");
        document.form1.password.focus();
        return false;
      }

      if (!checkcode) {
        alert("验证码不能为空！");
        document.form1.checkcode.focus();
        return false;
      }

      return true;
    }
  </script>

  <dfv>
    <form action="LoginServlet" method="post" name="form1" onSubmit="return Check()">
      <!-- form属性action="LoginServlet"中，LoginServlet待后续实现，用于处理请求-->
      <table>

        <tr>
          <td>用户名</td>
          <td><input style="width:100%;height:30px;" type="text" name="username" size="20">
            <div style="color: red">${requestScope.login_error}</div>
            <div style="color: red">${requestScope.checkcode_error}</div>     </td>
        </tr>
        <tr>
          <td>密&nbsp;&nbsp;码</td>
          <td><input style="width: 412px;height:30px;" type="password" name="password" size="20"></td>
        </tr>
        <tr>
          <td >验证码</td>
          <td style="display:flex;width: 412px;"><input style="width: 262px;height:30px;" type="text" name="checkcode" size="15">
            <img style="width:150px;height:32px;" id="img" src="CheckcodeServlet" alt="[验证码待续]" align="center">
            <!-- id为img的页面元素,显示验证码图像；src="CheckcodeServlet"中，CheckcodeServlet待后续实现-->
          </td>
        </tr>
          <tr>
            <td><input style="font-size: 26px;" type="submit" value="登录">
            </td>
            <td>
              <font><a style="padding: 5px;" href="forgetPassword.jsp">忘记密码 </a> </font>
            </td>
          </tr>
      </table>
    </form>

    </div>
    <%
      User user = (User) session.getAttribute("user");
      if (user != null) {
        if (user.getRole().equals("student") && user.getEmail() != null) {
          response.sendRedirect("students.jsp");
        }
        if (user.getRole().equals("teacher") && user.getEmail() != null) {
          response.sendRedirect("teacher.jsp");
        }
      }
    %>
</body>

</html>