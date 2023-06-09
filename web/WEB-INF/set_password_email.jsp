<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setContentType("text/html;charset=UTF-8");
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
    <title>重置口令</title>
  </head>

  <body>
    <div style="width: 500px;height:300px;position: absolute;top: 10%;left: 30%;">
      <form action="SetPasswordEmail.do" method="post" name="form1" onSubmit="return Check()">
        原密码 <div id="old"><input type="password" name="oldpass" >${requestScope.password_error}</div>
        新密码 <div id="new"><input type="password" name="newpass" ><div id="info_newpass" style="color: #ff0000;display:inline;"></div></div>
        确认新密码 <div id="comfirm"><input type="password" name="confirmpass"  ><div id="info_confirm" style="color: #ff0000;display:inline;"></div> </div>
        电子邮箱 <div id="email"><input type="text" name="email" onblur=isEmail(this.value)> <input type="button" id="button" value="获取验证码"></div>
        验证码<div id="emailcode"><input type="text" name="emailCheckcode"  placeholder="输入邮箱中收到的验证码"/>${requestScope.emailCheckcode_error}</div>
        <p>
          <input type="submit" id="submit" value="提交">
      </form>
        <div id="result"></div>
    </div>
    <script>
      const info_newpass = document.getElementById("info_newpass");
      const info_confirm = document.getElementById("info_confirm");
      const newpass = document.getElementsByTagName("input")[1];
      const confirmpass = document.getElementsByTagName("input")[2];
      const email = document.getElementsByTagName("input")[3];
      newpass.onchange = function () {
        info_newpass.innerHTML = "长度6-8位";
        if (confirmpass.value === newpass.value && newpass.value.length >= 4)
          info_confirm.innerHTML = "ok";
        else
        {
          info_confirm.innerHTML = "不匹配";
        }
      };

      confirmpass.onchange = function () {
        if (confirmpass.value === newpass.value && newpass.value.length >= 4)
          info_confirm.innerHTML = "ok";
        else
        {
          info_confirm.innerHTML = "不匹配";
        }
      };

      function isEmail(strEmail) {
        if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) !== -1)
          return true;
        else
          alert(email.value + "邮箱格式错误");
      }
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
        if (confirmpass.value !== newpass.value)
        {
          alert("两次输入不匹配！");
          document.getElementsByTagName("input")[2].focus();
          return false;
        }
        return true;

      }
      //获取button
      const btn = document.getElementById("button");
      const result=document.getElementById("result");
      //绑定按钮的 click 事件   
      btn.onclick = function () {
        if (!isEmail(email.value))
          return false;
        btn.disabled = true;//禁用按钮
        setBTN();
        //1.创建请求对象
        const xhr = new XMLHttpRequest();
        //2.设置请求方法和URL
        xhr.open("post", "/Report_load_system/EmailCheckcodeServlet?email=" + email.value, true);
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
              result.innerHTML=xhr.response;
            } else {
            }
          }
        };
      };

      //修改按钮，控制验证码重新获取
      var time0 = 30;
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
  </body>
</html>
