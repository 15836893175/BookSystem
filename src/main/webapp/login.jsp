<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="res/js/jquery-1.11.3.min.js"></script>
    <script>
        function login1() {
            var username=$("[name='username']").val();
            var password=$("[name='password']").val();
            if (username.length===0||password.length===0){
                alert("账号或密码不能为空")
            }else {
                $.post(
                    "/login",
                    {
                        username: username,
                        password: password
                    },
                    function (data) {
                        if (data.length===0) {
                            alert("登录失败，账号或密码错误！")
                        } else {
                            alert("登陆成功！正在跳转...")
                            window.location.href = ''
                        }
                    },
                    "text"
                )

            }}
    </script>
</head>
<body>
<FORM id="form1">
    <TABLE>
        <TR>
            <p>登录页面</p>
        </TR>
        <TR>
            <TD>账户：</TD>
            <TD>
                <input type="text" name="username">
            </TD>
        </TR>
        <TR>
            <TD>密码：</TD>
            <TD>
                <input type="text" name="password">
            </TD>
        </TR>
        <TR>
            <TD>
                <input type="reset" value="重置">
            </TD>
            <TD>
                <input type="button" value="登录" onclick="login1()">
            </TD>
        </TR>
    </TABLE>
</FORM>
</body>
</html>
