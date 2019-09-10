<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改页面</title>
</head>
<body>
<form action="updategoods" method="post">
   <h1>修改用户信息</h1>
   <table>
   <tr>
        <td>
           <input type="hidden" name="ids" value="${param.ids}"/>
        </td>
      </tr>
      <tr>
        <td>价值:</td>
        <td>
           <input type="number" name="amount"/>
        </td>
      </tr>
      <tr>
        <td>名称:</td>
        <td>
           <input type="text" name="goodname"/>
        </td>
      </tr>
      <tr>
        <td>简介:</td>
        <td>
           <textarea rows="10" cols="10" name="nm"></textarea>
        </td>
      </tr>
      <tr>
        <td>计量单位:</td>
        <td>
           <input type="text" name="units"/>
        </td>
      </tr>
      <tr>
        <td>仓库编号:</td>
        <td>
           <input type="number" name="storeid"/>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="submit" value="修改"/>
        </td>
      </tr>
   </table>
</form>
</body>
</html>