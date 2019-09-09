<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">用户管理</h1>
<h3 align="center">欢迎${loginuser.username}!!!</h3>
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
        <a href="updategoods.jsp?ids=${list.ids}">编辑</a>
        <a href="deleteGoods?ids=${list.ids}">删除</a>
      </td>
    </tr>
  </s:forEach>
</table>
</body>
</html>