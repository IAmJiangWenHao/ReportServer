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
    <div style=" width: 800px;height:800px;position:absolute;top:5%;left:20%;">
      <h1 style="padding-left:100px;display:inline-block"><font color="blue">实验报告上传</font></h1> 
      <div style="display:inline-block">--xxx</div> 
      <div style="display:inline-block"> 
        <font style="font-size:15px;color:red">&nbsp;&nbsp;&nbsp;&nbsp; 
        <a <%@page import="com.report.javabeans.ExpClass"%>
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
    <div style=" width: 800px;height:800px;position:absolute;top:5%;left:20%;">
      <h1 style="padding-left:100px;display:inline-block"><font color="blue">实验报告上传</font></h1> 
      <div style="display:inline-block">--xxx</div> 
      <div style="display:inline-block"> 
        <font style="font-size:15px;color:red">&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="exit.jsp">安全退出</a></font></div> 
      <!-- 课程 -->
      
        <div id="course1">
          <h3 style="display:inline-block"><div id="">面向对象系统分析与设计实验202</div> </h3>             
          <!-- 实验项目 -->
                    
            <div id="project11">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">顺序图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj11">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file11" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn11" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project12">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">状态图和活动图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj12">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file12" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn12" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project13">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">构件图和部署图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj13">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file13" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn13" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project14">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">数据建模与正逆向工程</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj14">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file14" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn14" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project15">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">系统建模与实现</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj15">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file15" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn15" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
          
        </div>
      
      <div style=" width: 800px;height:80px;position:absolute;bottom:15%">
        <hr><p align="center"><font color="blue">
    版权 ©2023  信息科学系.</font>
<br>邮箱地址: report_load@163.com

      </p></div>
    </div> 

      <script>
var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
function fileChange(target) {
  var fileSize = 0;
  var filetypes = [".pdf"];
  var filepath = target.value;
  var filemaxsize = 1024 * 8;//8M
  if (filepath) {
    var isnext = false;
    var fileend = filepath.substring(filepath.lastIndexOf("."));
    if (filetypes && filetypes.length > 0) {
      for (var i = 0; i < filetypes.length; i++) {
        if (filetypes[i] === fileend) {
          isnext = true;
          break;
        }
      }
    }
    if (!isnext) {
      alert("不接受此文件类型！");
      target.value = "";
      return false;
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

function getFile(id) {
  var prj = id.parentElement.parentElement.parentElement;
  var courseID = prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  var projectID = prj.getElementsByTagName("div")[0].innerHTML.toString();
  const durl = getAppPath() + "/browsePDFV1.do?projectID=" + encodeURIComponent(projectID) + "&&courseID=" + encodeURIComponent(courseID);
  //browsePDF.do 后端传送实验报告
  window.open(durl);
}
function openPostWindow(id){
     var prj = id.parentElement.parentElement.parentElement;
     var data=new Array;
     var key=new Array;
     key[0]="courseID";
     key[1]="projectID";
  data[0]= prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  data[1]= prj.getElementsByTagName("div")[0].innerHTML.toString();

    //创建form表单，以下是form表单的各种参数
    let tempForm = document.createElement("form");
    tempForm.id = "tempForm";
    tempForm.method = "post";
    tempForm.action = getAppPath() + "/browsePDFV1.do";
    //tempForm.target = 'blank';
    tempForm.download = ""
    //创建标签 <input></input> 标签 然后设定属性，最后追加为 form标签的子标签
    for (let i in data) {
       alert(key[i],data[i])
        let hideInput = document.createElement("input")
        hideInput.type = "hidden"
        hideInput.name =key[i]
        hideInput.value = data[i]
        tempForm.appendChild(hideInput)
    }
    if (document.all) {
      tempForm.attachEvent("onsubmit", function () {
      });        //IE
    } else {
      let subObj = tempForm.addEventListener("submit", function () {
      }, false);    //firefox
    }
    document.body.appendChild(tempForm);
    if (document.all) {
      tempForm.fireEvent("onsubmit");
    } else {
      tempForm.dispatchEvent(new Event("submit"));
    }
    tempForm.submit();//提交POST请求
    document.body.removeChild(tempForm);//删除整个form标签

  };  
  
 

function upload(id) {
  var s;
  s = document.getElementById(id).parentElement.id;
  var prj = document.getElementById(s).parentElement;
  const courseID = prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  const projectID = prj.getElementsByTagName("div")[0].innerHTML.toString();
  //alert(courseID);
  //alert(projectID);
  //return;
  //var course = prj.parentElement.getElementsByTagName("div")[0].innerHTML;
  const fileid = document.getElementById(s).getElementsByTagName("input")[0];
  var uploadFile;
  const result = document.getElementById(s).getElementsByTagName("div")[0];
  const btn = document.getElementById(s).getElementsByTagName("input")[1];
  const step = document.getElementById(s).getElementsByTagName("div")[2];
  if (fileid.value === "")
  {
    alert("文件不可空！");
    fileid.focus();
    return false;
  }
  var files = fileid.files;
  if (files.length === 0) {
    return;
  }
  uploadFile = files[0];
  var formData = new FormData();
  formData.append("projectId", projectId);//项目名
  formData.append("courseId", courseId);//课程名
  formData.append("file", uploadFile); // 后端通过 'file' 获取
  //1.创建请求对象
  const xhr = new XMLHttpRequest();
  //2.设置请求行(get请求数据写在url后面)
  xhr.open("post", "/WebApp_report/uploadCourseServlet");//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //upload.do 后端处理上传文件
  //3.设置请求头(get请求可以省略,post不发送数据也可以省略)
  // 如果使用 formData可以不写 请求头 写了 无法正常上传文件
  //  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  // XHR2.0新增 上传进度监控
  xhr.upload.onprogress = function (event) {
    var percent = event.loaded / event.total * 100 + '%';
    //console.log(percent);
    // 设置进度条内部step的 宽度
    step.style.width = percent;
    //console.log(step.id);
  };
  //4.请求主体发送(get请求为空，或者写null，post请求数据写在这里，如果没有数据，直接为空或者写null)
  xhr.send(formData);
  //注册回调函数
  xhr.onload = function () {
    console.log(xhr.responseText);
    if (xhr.readyState === 4) {
      //判断响应码 2XX 表示成功
      if (xhr.status >= 200 && xhr.status <= 300) {
        //处理结果    
        // console.log("test Post");//状态码
        //设置 result 显示的文本内容
        fileid.value = "";
        if (xhr.response.toString() === "文件上传成功！") {
          var fileName = "${user.username}-${user.fullname}-";
          fileName += prj.getElementsByTagName("div")[0].innerHTML.toString();
          result.innerHTML = "<a href='#'id='" + new Date().getTime() + "' onclick='getFile(this)'>" + "<img style='vertical-align: middle;' height='20px;' width='20px' src='img/check.jpg'/>检查上传</a>";
          step.innerHTML = "100%";
        } else
          step.innerHTML =xhr.response.toString();
      }
    }
  };  
}
/*
function reload() {
  //1.创建请求对象
  const xhr = new XMLHttpRequest();
  //2.设置请求
  xhr.open("post", "/WebApp_report/LoadData.do");
  //3.发送请求
  xhr.send();
  //注册回调函数
  xhr.onload = function () {
    console.log(xhr.responseText);
    if (xhr.readyState === 4) {
      //判断响应码 2XX 表示成功
      if (xhr.status >= 200 && xhr.status <= 300) {
        //处理结果    
        if (xhr.response.toString() === "courseData数据更新！") {
          console.log("courseData已更新");
        }
      }
    }
  }; 
}
</script>
</body>
</html>>安全退出</a></font></div> 
      <!-- 课程 -->
      
        <div id="course1">
          <h3 style="display:inline-block"><div id="">面向对象系统分析与设计实验202</div> </h3>             
          <!-- 实验项目 -->
                    
            <div id="project11">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">顺序图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj11">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file11" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn11" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project12">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">状态图和活动图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj12">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file12" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn12" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project13">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">构件图和部署图设计</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj13">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file13" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn13" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project14">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">数据建模与正逆向工程</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj14">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file14" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn14" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
                    
            <div id="project15">
              <b><div id="prj" style="height:40px;width:200px;display:inline-block;padding-left:15px">系统建模与实现</div></b>
              <div style="display:inline-block;padding-left:10px" id="prj15">
                <div id="result" style="width:100px;display:inline-block;">
                  
                    <img style="vertical-align:bottom" height="20px;" width="20px" src="img/undone.jpg">
                    <font color="#FF0000">未上传&nbsp;</font>
                  
                </div>
                &nbsp;&nbsp;
                <input type="file" id="file15" style="width:140px;" onchange="fileChange(this);">
                <input type="button" id="btn15" value="上传" onclick="upload(this.id)"> 
                <div id="progress" class="progress" style="display:inline-block;">
                  <div style="text-align:center" id="step" class="step"> </div>                                    
                </div>                
              </div>                   
            </div> 
          
        </div>
      
      <div style=" width: 800px;height:80px;position:absolute;bottom:15%">
        <hr><p align="center"><font color="blue">
    版权 ©2023  信息科学系.</font>
<br>邮箱地址: report_load@163.com

      </p></div>
    </div> 

      <script>
var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
function fileChange(target) {
  var fileSize = 0;
  var filetypes = [".pdf"];
  var filepath = target.value;
  var filemaxsize = 1024 * 8;//8M
  if (filepath) {
    var isnext = false;
    var fileend = filepath.substring(filepath.lastIndexOf("."));
    if (filetypes && filetypes.length > 0) {
      for (var i = 0; i < filetypes.length; i++) {
        if (filetypes[i] === fileend) {
          isnext = true;
          break;
        }
      }
    }
    if (!isnext) {
      alert("不接受此文件类型！");
      target.value = "";
      return false;
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

function getFile(id) {
  var prj = id.parentElement.parentElement.parentElement;
  var courseID = prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  var projectID = prj.getElementsByTagName("div")[0].innerHTML.toString();
  const durl = getAppPath() + "/browsePDFV1.do?projectID=" + encodeURIComponent(projectID) + "&&courseID=" + encodeURIComponent(courseID);
  //browsePDF.do 后端传送实验报告
  window.open(durl);
}
function openPostWindow(id){
     var prj = id.parentElement.parentElement.parentElement;
     var data=new Array;
     var key=new Array;
     key[0]="courseID";
     key[1]="projectID";
  data[0]= prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  data[1]= prj.getElementsByTagName("div")[0].innerHTML.toString();

    //创建form表单，以下是form表单的各种参数
    let tempForm = document.createElement("form");
    tempForm.id = "tempForm";
    tempForm.method = "post";
    tempForm.action = getAppPath() + "/browsePDFV1.do";
    //tempForm.target = 'blank';
    tempForm.download = ""
    //创建标签 <input></input> 标签 然后设定属性，最后追加为 form标签的子标签
    for (let i in data) {
       alert(key[i],data[i])
        let hideInput = document.createElement("input")
        hideInput.type = "hidden"
        hideInput.name =key[i]
        hideInput.value = data[i]
        tempForm.appendChild(hideInput)
    }
    if (document.all) {
      tempForm.attachEvent("onsubmit", function () {
      });        //IE
    } else {
      let subObj = tempForm.addEventListener("submit", function () {
      }, false);    //firefox
    }
    document.body.appendChild(tempForm);
    if (document.all) {
      tempForm.fireEvent("onsubmit");
    } else {
      tempForm.dispatchEvent(new Event("submit"));
    }
    tempForm.submit();//提交POST请求
    document.body.removeChild(tempForm);//删除整个form标签

  };  
  
 

function upload(id) {
  var s;
  s = document.getElementById(id).parentElement.id;
  var prj = document.getElementById(s).parentElement;
  const courseID = prj.parentElement.getElementsByTagName("div")[0].innerHTML.toString();
  const projectID = prj.getElementsByTagName("div")[0].innerHTML.toString();
  //alert(courseID);
  //alert(projectID);
  //return;
  //var course = prj.parentElement.getElementsByTagName("div")[0].innerHTML;
  const fileid = document.getElementById(s).getElementsByTagName("input")[0];
  var uploadFile;
  const result = document.getElementById(s).getElementsByTagName("div")[0];
  const btn = document.getElementById(s).getElementsByTagName("input")[1];
  const step = document.getElementById(s).getElementsByTagName("div")[2];
  if (fileid.value === "")
  {
    alert("文件不可空！");
    fileid.focus();
    return false;
  }
  var files = fileid.files;
  if (files.length === 0) {
    return;
  }
  uploadFile = files[0];
  var formData = new FormData();
  formData.append("projectId", projectId);//项目名
  formData.append("courseId", courseId);//课程名
  formData.append("file", uploadFile); // 后端通过 'file' 获取
  //1.创建请求对象
  const xhr = new XMLHttpRequest();
  //2.设置请求行(get请求数据写在url后面)
  xhr.open("post", "/WebApp_report/uploadCourseServlet");//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //upload.do 后端处理上传文件
  //3.设置请求头(get请求可以省略,post不发送数据也可以省略)
  // 如果使用 formData可以不写 请求头 写了 无法正常上传文件
  //  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  // XHR2.0新增 上传进度监控
  xhr.upload.onprogress = function (event) {
    var percent = event.loaded / event.total * 100 + '%';
    //console.log(percent);
    // 设置进度条内部step的 宽度
    step.style.width = percent;
    //console.log(step.id);
  };
  //4.请求主体发送(get请求为空，或者写null，post请求数据写在这里，如果没有数据，直接为空或者写null)
  xhr.send(formData);
  //注册回调函数
  xhr.onload = function () {
    console.log(xhr.responseText);
    if (xhr.readyState === 4) {
      //判断响应码 2XX 表示成功
      if (xhr.status >= 200 && xhr.status <= 300) {
        //处理结果    
        // console.log("test Post");//状态码
        //设置 result 显示的文本内容
        fileid.value = "";
        if (xhr.response.toString() === "文件上传成功！") {
          var fileName = "${user.username}-${user.fullname}-";
          fileName += prj.getElementsByTagName("div")[0].innerHTML.toString();
          result.innerHTML = "<a href='#'id='" + new Date().getTime() + "' onclick='getFile(this)'>" + "<img style='vertical-align: middle;' height='20px;' width='20px' src='img/check.jpg'/>检查上传</a>";
          step.innerHTML = "100%";
        } else
          step.innerHTML =xhr.response.toString();
      }
    }
  };  
}
/*
function reload() {
  //1.创建请求对象
  const xhr = new XMLHttpRequest();
  //2.设置请求
  xhr.open("post", "/WebApp_report/LoadData.do");
  //3.发送请求
  xhr.send();
  //注册回调函数
  xhr.onload = function () {
    console.log(xhr.responseText);
    if (xhr.readyState === 4) {
      //判断响应码 2XX 表示成功
      if (xhr.status >= 200 && xhr.status <= 300) {
        //处理结果    
        if (xhr.response.toString() === "courseData数据更新！") {
          console.log("courseData已更新");
        }
      }
    }
  }; 
}
</script>
</body>
</html>