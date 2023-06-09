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
    <title>实验上传系统 </title>    
  </head>
  <body>
    ${mytag:LoadCourseProject(pageContext.request,pageContext.response)}
    <script>
      window.onload = function () {//Ajax实现更新项目状态
        var ratios = document.getElementsByTagName("input");//获取所有input（本页面的input只有单选按钮）
        var map = new Map();//记录单选按钮旧值
        for (var i = 0; i < ratios.length; i++) {
          map.set((i + 1).toString(), ratios[i].checked);
          //oninput事件在input的值发生改变时触发，这里监听单选按钮值得改变
          ratios[i].oninput = function () {
            var r = false;
            if (this.value === "deadline") {//是否选择截止
              //是否确认修改
              r = confirm("截止后不可再设置，确定截止？");
            }
            //取消截止
            if (this.value === "deadline" && r === false) {
              var list = document.getElementsByName(this.name);
              for (var j = 0; j < list.length; j++)
                list[j].checked = map.get(list[j].id);
              return;
            }
            ratioName = this.name;
            //确定截止，不允许再更改状态
            if (this.value === "deadline") {
              var list = document.getElementsByName(this.name);
              for (var j = 0; j < list.length; j++)
              {
                list[j].disabled = "disable";
                map.set(list[j].id, list[j].checked);
              }
            } else {
              var list = document.getElementsByName(this.name);
              for (var j = 0; j < list.length; j++)
                map.set(list[j].id, false);
              map.set(this.id, this.checked);
            }
            var formData = new FormData();//FormData 对象
            var course = ratioName.substr(0, ratioName.indexOf("-"));
            var project = ratioName.substr(ratioName.indexOf("-") + 1, ratioName.length - 1);
            //添加KV
            formData.append("project", project);//项目
            formData.append("course", course); //课程名
            formData.append("status", this.value);//状态
            var cell = document.getElementById(this.name);
            //显示实验项目状态提示信息
            cell.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            if (this.value === "open")
              cell.innerHTML += "<img style=\"vertical-align: middle;height:20px;width:20px\" src=\"./img/check.jpg\"/>已经开放";
            if (this.value === "close")
              cell.innerHTML += "<img style=\"vertical-align: middle;height:20px;width:20px\" src=\"./img/undone.png\"/>未开始";
            if (this.value === "deadline")
              cell.innerHTML += "<img style=\"vertical-align: middle;height:20px;width:20px\" src=\"./img/deadline.jpg\"/>已截止";
            //1.创建请求对象
            const xhr = new XMLHttpRequest();
            //2.设置请求行，这里用post(get请求数据写在url后面)
            //updateProject.do实现后端更新
            xhr.open("post", getAppPath() + "/updateProject.do");
            //3.设置请求头(get请求可以省略,post不发送数据也可以省略)
            //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            // 用formData可以不写请求头，写了无法正常上传文件           
            //4.请求主体发送(get请求为空，或者写null，post请求数据写在这里，
            //如果没有数据，直接为空或者写null)
            xhr.send(formData);
            //注册回调函数
            xhr.onload = function ()
            {
              if (xhr.readyState === 4)
              {
                if (xhr.status >= 200 && xhr.status <= 300)
                { //判断响应码 2XX 表示成功                           
                  console.log(xhr.response.toString());
                } else
                  console.log("响应码：" + xhr.status); //状态码
              } else
                console.log(xhr.readyState);
              ;
            };
          };
        }
        ;
      };
    </script>
    <script>
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
    </script>
    <script>
      var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
      function fileChange(target, type) {
        var fileSize = 0;
        var filepath = target.value;
        var filemaxsize = 1024 * 5;//5M
        var flag = -1;
        if (filepath) {
          var fileend = filepath.substring(filepath.lastIndexOf("."));
          // alert(fileend);
          if (type && type.length > 0) {
            //alert(fileend.indexOf(type));
            if (fileend !== ".xlsx") {
              alert("只接受xlsx类型的文件！");
              target.value = "";
              return false;
            }
          }
        } else {
          return false;
        }
        if (isIE && !target.files) {
          var filePath = target.value;
          var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
          if (!fileSystem.FileExists(filePath)) {
            alert("附件不存在，请重新输入！");
            return false;
          }
          var file = fileSystem.GetFile(filePath);
          fileSize = file.Size;
        } else {
          fileSize = target.files[0].size;
        }

        var size = fileSize / 1024;
        if (size > filemaxsize) {
          alert("附件大小不能大于" + filemaxsize / 1024 + "M！");
          target.value = "";
          return false;
        }
        if (size <= 0) {
          alert("附件大小不能为0M！");
          target.value = "";
          return false;
        }
      }
      function Check()
      {
        for (var i = 0; i < document.form1.elements.length - 1; i++)
        {
          if (document.form1.elements[i].value === "")
          {
            alert("不可空！");
            document.form1.elements[i].focus();
            return false;
          }
        }
        return true;
      }
      function cls() {
        var createCell = document.getElementById("createCourse");
        createCell.innerHTML = "";
      }

      function createCourse() {
        var createCell = document.getElementById("createCourse");
        createCell.innerHTML = "<form action=\"../uploadCourseServlet\" enctype=\"multipart/form-data\" method=\"post\" name=\"form1\" onSubmit=\"return Check()\"><table></tr><tr> <td>建课模板：</td><td><a href=\"实验课模板.xlsx\">下载</a></td></tr><tr><td>课程名：</td><td><input style=\" font-size:16px\" type=\"text\" name=\"courseName\" size=\"20\"/>(例：程序设计实验)</td></tr><tr><td>班级：</td><td><input style=\" font-size:16px\" type=\"text\" name=\"className\" size=\"20\"/>(例:信安201)</td></tr><tr> <td>文件：</td><td><input style=\" font-size:16px\" type=\"file\" name=\"file\" size=\"40\" id=\"fup\" onchange=\'fileChange(this,\".xlsx\");\'/></td><tr><td style=\"height:50px;\" align=\"right\" ><input style=\" font-size:16px\" type=\"submit\" value=\"提交\" size='30'/> </td><td align=\"left\"><input style=\" font-size:16px\" type=\"button\" value=\"关闭\" size='30' onclick=\"cls()\"/> </td></tr></table></form>";
      }
    </script>
    <div style=" width: 800px;height:800px;position: absolute;top: 10%;left: 30%;">
      <h1><font color="blue"> 实验管理</font><font style="font-size:15px;color:red">&nbsp;&nbsp;&nbsp;&nbsp; <a href="../exit">安全退出</a></font></h1>  
      <p>${sessionScope.user.fullname}好，欢迎登录</p>
      <p>
        <img style="vertical-align: middle;height:20px" alt="" width="20" src="./img/new.jpg"/>                
        <input type="button" value="创建课程" onclick="createCourse()">
      <div id="createCourse">

      </div>
    </p>

    <c:forEach var="course" items="${sessionScope.courseData}" varStatus="statusCourse">
      <h2> ${course.key}<font style="font-size:15px;color:blue">--${sessionScope.user.fullname}</font></h2><p>
      <table>  
        <c:forEach var="project" items="${course.value}" varStatus="statusProject">
          <tr style=" height: 30px;border: 1px">
            <td>&nbsp;&nbsp;<b>${project.projectId}</b></td>
            <td><!-- 3.一组单选按钮 radio（同name），只能选一个
                     request.getParameter("***")-->
              <c:if test="${project.state==0}">
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="open">开放上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="close" checked="true">关闭上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="deadline">截止
              </c:if>
              <c:if test="${project.state==1}">
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="open" checked="true">开放上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="close" >关闭上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="deadline">截止
              </c:if>
              <c:if test="${project.state==2}">
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="open">开放上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="close" >关闭上传
                <input type="radio" id="${"course".concat(statusCourse.count).concat(statusProject.count).concat(1)}"  name="${course.key.concat("-").concat(project.projectId)}" value="deadline" checked="true">截止
              </c:if>
            </td>
            <td id="${course.key.concat("-").concat(project.projectId)}">&nbsp;&nbsp;&nbsp;&nbsp;
              <c:if test="${project.state==0}" >
                <img style="vertical-align: middle;height:20px;width:20px" alt="" src="../img/undone.jpg"/>未开始
              </c:if>
              <c:if test="${project.state==1}" >
                <img style="vertical-align: middle;height:20px;width:20px" alt="" src="../img/check.jpg"/>已经开放
              </c:if>
              <c:if test="${project.state==2}" >
                <img style="vertical-align: middle;height:20px;width:20px" alt="" src="../img/deadline.png"/>已经截止
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </table>
    </c:forEach>
  </div>  
</body>
</html>