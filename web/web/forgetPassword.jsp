<%@page import="java.util.Random"%>
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
    <title>忘记密码</title>
  </head>
  <body>
    <style>
          .mybody {
      height: 100%;
      width: 100%;
      position: absolute;
      background-image: url('./img/gzdx-bg.jpg');
      background-size: cover;
      background-position: center;

    }

    form {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    form .hang {
      border: 1px solid black;
      margin-bottom: 2px;
      display: flex;
      border-radius: 20px;
      width: 500px;
      height: auto;
      padding: 10px;
      font-size: 26px;
      background-color: #fff;
      position: relative;
      justify-content: space-between;
    }
    form .hang #new{
      display: flex;
    flex-direction: column;
    }
    form .hang a{
      color: #000;
      text-decoration:none;
    }
    form .hang input{
      border: 1;
      background-color: #fff;
    }

    </style>
    <% Random ran = new Random();
      int index = ran.nextInt(10000);
      request.getSession().setAttribute("index", index);
    %>
    <div class="mybody">
    <div  style="width: 500px;height:300px;position:absolute;top:10%;left:30%;">
      <form action="forgetPass.do" method="post" name="form1" onSubmit="return Check()">
        
        <div class="hang">用户名 <div id="old"><input type="text" name="username" ></div></div>
        <div class="hang">预留的邮箱 <div id="email"><input type="text" name="email" onblur=isEmail(this.value)> <input type="button" id="button" value="获取验证码"></div></div>
        <div class="hang">验证码<div id="emailcode"><input type="text" name="emailCheckcode"  placeholder="输入邮箱中收到的验证码"/></div></div>
        <div class="hang">新密码 <div id="new"><input type="password" id="idnewpass" name="newpass" ><div id="info_newpass" style="color: #ff0000;display:inline;"></div></div></div>
        <div class="hang">确认新密码 <div id="comfirm"><input type="password" id="idconfirmpass" name="confirmpass"></div>
<input type="hidden" name="index" value="${index}"/></div>
        <div class="hang"><p style="display: flex;margin:0"><input type="submit" id="submit" value="提交"></div>
      </form>
    </div>
  </div>
    <script>
      //const newpass = document.getElementsByTagName("input")[1];
      const email = document.getElementsByTagName("input")[1];
      function isEmail(strEmail) {
        if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) !== -1)
          return true;
        else
          alert(email.value + "邮箱格式错误");
      }
      function getAppPath() {
        //获取当前URL
        var curURL = window.document.location.href;
        //获取主机地址之后的路径部分（就是文件地址）
        var pathName = window.document.location.pathname;
        var pos = curURL.indexOf(pathName);
        //获取应用地址   
        var host = curURL.substring(0, pos);
        //获取带"/"的应用名，如：/***
        var webAppName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return host + webAppName;
      }
      //获取button
      const btn = document.getElementById("button");
      //const result=document.getElementById("result");
      //绑定按钮的 click 事件   
      btn.onclick = function () {
        if (!isEmail(email.value))
          return false;
        btn.disabled = true;//禁用按钮
        setBTN();
        //1.创建请求对象
        const xhr = new XMLHttpRequest();
        //2.设置请求方法和URL
        xhr.open("post", getAppPath() + "/EmailCheckcodeServlet?email=" + email.value, true);
        //3.发送
        xhr.send();
        //4. 绑定事件 处理服务端返回的结果
        //readystate 是xhr的一个属性，状态 0 1 2 3 4
        xhr.onreadystatechange = function () {
          // 如果服务器端返回了所有的结果
          if (xhr.readyState === 4) {
            //判断响应码 2XX 表示成功
            if (xhr.status >= 200 && xhr.status <= 300) {
              //处理结果    
              console.log(xhr.status);//状态码
              console.log(xhr.statusText);//状态字符串
              console.log(xhr.getAllResponseHeaders());//响应头
              console.log(xhr.response);//响应体
              //设置 result 显示的文本内容
              //result.innerHTML=xhr.response;
            } else {
            }
          }
        };
      };
      //修改按钮，控制验证码重新获取           
      var time0 = 20;
      var time = time0;
      var t;  // 验证按钮的20s计时
      //修改按钮，控制验证码重新获取
      function changeBTN() {
        if (time > 0) {
          btn.value = "(" + time + "s)" + "重新获取";
          time = time - 1;
        } else {
          btn.disabled = false;
          btn.value = "获取验证码";
          clearInterval(t);
          time = time0;
        }
      }
      function setBTN() {
        btn.value = "(" + time + "s)" + "重新获取";
        time = time - 1;
        t = setInterval("changeBTN()", 1000);  // 1s调用一次
      }

    </script>

    <script>
      const info_newpass = document.getElementById("info_newpass");
      const info_confirm = document.getElementById("info_confirm");
      const newpass = document.getElementById("idnewpass");
      const confirmpass = document.getElementById("idconfirmpass");
      newpass.onfocus = function () {
        info_newpass.innerHTML = "长度6-8位";
      };
      confirmpass.onchange = function () {
        if (confirmpass.value === newpass.value && newpass.value.length >= 4)
          info_confirm.innerHTML = "ok";
        else
        {
          info_confirm.innerHTML = "输入不匹配";
          confirmpass.focus();
        }
      };
      function Check()
      {
        for (var i = 0; i < document.form1.elements.length - 1; i++)
        {
          if (document.form1.elements[i].value === "")
          {
            alert("不允许空！");
            document.form1.elements[i].focus();
            return false;
          }
        }
        if (newpass.value.length < 6)
        {
          alert("密码长度不足！");
          document.getElementsByTagName("input")[1].focus();
          return false;
        }
       // alert(confirmpass.value)
        if (confirmpass.value !== newpass.value)
        {
          alert("两次输入不匹配！");
          document.getElementsByTagName("input")[2].focus();
          return false;
        }
        alert("修改成功");
        return true;
      }
    </script>
  </body>
</html>