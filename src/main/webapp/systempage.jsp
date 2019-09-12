<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <script src="res/js/jquery-1.11.3.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#a1").click(function () {
                $("#div1").toggle();
            });
            $("#a2").click(function () {
                $("#div1").toggle();
            });
            $(".a3").click(function () {
                $("#div2").toggle();
            });
        })
        function gaimijs(){
            var password=$("[name='password']").val();
            var newpass=$("[name='newpass']").val();
            var newpass2=$("[name='newpass2']").val();
            var pass=$("[name='pass']").val();
            var ids=$("[name='ids']").val();
            if (password.length===0||newpass.length===0||newpass2.length===0||password!==pass||newpass==pass||newpass!==newpass2){
                alert("请按要求填写！");
            }else {
            $.post(
                "/gaimiurl",
                {
                    password:newpass,
                    ids:ids
                },
                function(passStr){
                    if (passStr.length===0){
                        alert("修改失败！请根据要求填写！")
                    }else {
                        alert("修改成功，请重新登陆。。。");
                        window.location.href='/';
                    }
                },
                "text"
            )
        }}
        function onpassword() {
            var password=$("[name='password']").val();
            var pass=$("[name='pass']").val();
            if (password.length!==0&&password===pass){
                document.getElementById('error-password').innerHTML="";
            }else {
                document.getElementById('error-password').innerHTML="原密码错误";}
        }
        function onnewpass() {
            var newpass=$("[name='newpass']").val();
            var newpass2=$("[name='newpass2']").val();
            var pass=$("[name='pass']").val();
            if (newpass.length!==0){
                if (newpass===pass){
                    document.getElementById('error-newpass').innerHTML="请输入新的密码！";
                }else {
                    if (newpass===newpass2&&newpass.length!==0){
                        document.getElementById('error-newpass2').innerHTML="";
                    }else {
                        document.getElementById('error-newpass2').innerHTML="两次密码输入不一致";
                    }
                document.getElementById('error-newpass').innerHTML="";}
            }else {
                document.getElementById('error-newpass').innerHTML="密码不能为空";}
        }
        function onnewpass2() {
            var newpass=$("[name='newpass']").val();
            var newpass2=$("[name='newpass2']").val();
            if (newpass2.length!==0&&newpass===newpass2){
                document.getElementById('error-newpass2').innerHTML="";
            }else {
                document.getElementById('error-newpass2').innerHTML="两次密码输入不一致";}
        }
        function byid(ids) {
            $.post(
                "/findbyid",
                {ids:ids},
                function (finddata) {
                    alert(finddata)
                },
                "text"
            )
        }
    </script>
</head>
<body>
<h1 align="center">用户管理</h1>
<h3 align="center">欢迎${loginuser.username}!!!<a id="a1" href="#">修改密码</a></h3>
<div id="div1" style="margin:0 auto;border: 1px blue solid; width: 395px;display: none">
    <form>
        <table>
            <tr>
                <td>原密码：</td>
                <td>
                    <input type="password" name="password" onblur="onpassword()"/>
                    <input type="hidden" name="pass" value="${loginuser.password}"/>
                    <input type="hidden" name="ids" value="${loginuser.ids}"/>
                </td>
                <td><span id="error-password">*</span></td>
            </tr>
            <tr>
                <td>新密码：</td>
                <td>
                    <input type="password" name="newpass" onblur="onnewpass()"/>
                </td>
                <td><span id="error-newpass">*</span></td>
            </tr>
            <tr>
                <td>重复密码：</td>
                <td>
                    <input type="password" name="newpass2" onblur="onnewpass2()"/>
                </td>
                <td><span id="error-newpass2">*</span></td>
            </tr>
            <tr>
                <td>
                   <a id="a2" href="#">收起！</a>
                </td>
                <td>
                    <input type="button" value="确认修改" onclick="gaimijs()"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<table style="border: 2px blue;margin: auto;" >
  <tr>
    <td>编号</td>
    <td>账号</td>
    <td>密码</td>
    <td>电话</td>
    <td>邮箱</td>
    <td>操作</td>
  </tr>
  <s:forEach items="${userlist}" var="list">
    <tr>
      <td>${list.ids}</td>
      <td>${list.username}</td>
      <td>${list.password}</td>
      <td>${list.phone}</td>
      <td>${list.email}</td>
      <td>
        <a href="#" onclick="byid(ids=${list.ids})" class="a3">编辑
        <input type="hidden" name="findbyids" value="${list.ids}"/>
        </a>
        <a href="deleteuser?ids=${list.ids}" onClick="return confirm('Warring!!!您确定永久删除该用户吗？');" >删除</a>
      </td>
        <td>
        </td>
    </tr>
  </s:forEach>
</table>
<div id="div2" style="margin:0 auto;border: 1px blue solid; width: 395px;display: none">
    <form>
        <table><s:forEach items="${findfromuser}" var="list2">
            <td>${list2[status.index]}</td>+${list2.password}+${list2.username}
        </s:forEach>
            <tr>
                <td>账号：</td>
                <td>
                    <input type="text" name="newname" value="${list2.username}" onblur=""/>
                </td>
                <td><span id="error-newname">*</span></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td>
                    <input type="text" name="newphone" value="${list2.phone}" onblur=""/>
                </td>
                <td><span id="error-newphone">*</span></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <input type="text" name="newemail" value="${list2.email}" onblur=""/>
                </td>
                <td><span id="error-newemail">*</span></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="确认修改" onclick="gaiuser()"/>
                </td>
            </tr>
            </table>
    </form>
</div>
</body>
</html>