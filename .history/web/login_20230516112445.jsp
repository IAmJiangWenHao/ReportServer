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
      dfv{
        width: 500px;
        height:300px;
        position: absolute;
        top: 10%;
        left: 30%;

      }
      table div  {
				display: none;
			}
      table div .ContActive {
				display: block;
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
        tabClick(); //切换方法
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

			function tabClick() {
				var tab = document.querySelectorAll(".table button"); // 获取tab所有 li
				var cont = document.querySelectorAll(".table div") //获取content所有 li
				if (tab && cont) { //严格模式 取到tab 和 cont 之后再进行其他
					for (var i = 0; i < tab.length; i++) { //给每一个tab添加点监听点击事件
						addHover(i);
					}
					//添加点击监听
					function addHover(i) {
						tab[i].addEventListener('click', function() { //点击切换
							// tab[i].addEventListener('mouseover', function() {//悬浮切换
							setTabClass(i);
							setContClass(i)
						});
					}
					// 切换按钮的事件
					function setTabClass(num) {
						// 移出所有的TabActive名称
						for (var i = 0; i < tab.length; i++) {
							tab[i].classList.remove("TabActive");
						}
						// 点击的哪个给哪个添加TabActive
						tab[num].classList.add("TabActive");
					}
					// 切换内容的事件
					function setContClass(num) {
						// 移出所有的ContActive名称
						for (var i = 0; i < cont.length; i++) {
							cont[i].classList.remove("ContActive");
						}
						// 点击的哪个给哪个添加ContActive
						cont[num].classList.add("ContActive");
					}
				}
			}
    </script>
    
  <dfv>
 <form action="LoginServlet" method="post" name="form1" onSubmit="return Check()">
        <!-- form属性action="LoginServlet"中，LoginServlet待后续实现，用于处理请求--> 
        <table>
          <button >
            登录
          </button>
          <div>
          <tr>
            <td>用户名</td>
            <td><input style="width:150px;height:30px;" type="text" name="username" size="20"></td>
          </tr>
          <tr>
            <td>密&nbsp;&nbsp;码</td>
            <td><input style="width: 150px;height:30px;" type="password" name="password" size="20"></td>
          </tr>
          <tr>
            <td>验证码</td>
            <td><input style="width: 100px;height:30px;" type="text" name="checkcode" size="15">
              <img style="width:150px;height:32px;" id="img" src="CheckcodeServlet"  alt="[验证码待续]" align="center">
              <!-- id为img的页面元素,显示验证码图像；src="CheckcodeServlet"中，CheckcodeServlet待后续实现-->                    
            </td>
          </tr>  
          <tr><td></td>                    
            <td><input style="margin-left:40px;font-size:20px;" type="submit" value="登&nbsp;录">
              <font style="font-size:15px">&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgetPassword.jsp">忘记密码 </a> </font></td>                                   
          </tr>
          </div>
        </table>
      </form>
      <div style="color: red">${requestScope.login_error}</div>
      <div style="color: red">${requestScope.checkcode_error}</div>      
    </div>
    <%
      User user = (User) session.getAttribute("user");
      if (user != null) {
        if (user.getRole().equals("student") && user.getEmail() != null) {
          response.sendRedirect("stduents.jsp");
        }
        if (user.getRole().equals("teacher") && user.getEmail() != null) {
          response.sendRedirect("teacher/teacher.jsp");
        }
      }
    %>
  </body>
</html>