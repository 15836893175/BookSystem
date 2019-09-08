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
                            window.location.href = '/finduser'
                        }
                    },
                    "text"
                )

            }}
            $(document).ready(function(){
                $("#btn1").click(function () {
                    //$("#div1").toggle();
                    $("#div2").toggle();
                });
                $("#btn2").click(function () {
                   // $("#div1").toggle();
                    $("#div2").toggle();
                })
            })

        function zhuce() {
            var zhuname=$("[name='zhuname']").val();
            var zhupass=$("[name='zhupass']").val();
            var zhuphone=$("[name='zhuphone']").val();
            var zhuemail=$("[name='zhuemail']").val();
            var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
            var reg2=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;

            if (zhuname.length===0||zhupass.length===0||zhuphone.length===0||zhuemail.length===0&&reg.test(zhuphone)&&reg2.test(zhuemail)){
                alert("请按要求填写！");
            }else {
                    $.post(
                        "/zhuceuser",
                        {
                            username: zhuname,
                            password: zhupass,
                            phone: zhuphone,
                            email: zhuemail
                        },
                        function (textzhuce) {
                            if (textzhuce.length===0) {
                                alert("注册失败！")
                            } else {
                                alert("注册成功！正在跳转...");
                                window.location.href = '/'
                            }
                        },
                        "text"
                    )}

        }

        function onzhuname() {
            var zhuname=$("[name='zhuname']").val();
            if (zhuname.length!==0){
                document.getElementById('error-name').innerHTML="";
            }else {
                document.getElementById('error-name').innerHTML="账号输入有误";}
            $.post(
                "/zhuce",
                {
                    username: zhuname
                },
                function(textdata){
                    if (textdata.length===0) {
                        document.getElementById('error-name').innerHTML="账号已被注册";
                    }else {
                        document.getElementById('error-name').innerHTML="";
                    }
                    },
                    "text")
        }
        function onzhupass() {
            var zhupass=$("[name='zhupass']").val();
            if (zhupass.length!==0){
                document.getElementById('error-zhupass').innerHTML="";
            }else {
                document.getElementById('error-zhupass').innerHTML="密码输入有误";}
        }
        function onzhucpass() {
            var zhucpass=$("[name='zhucpass']").val();
            var zhupass=$("[name='zhupass']").val();
            if (zhucpass.length!==0&&zhupass==zhucpass){
                document.getElementById('error-zhucpass').innerHTML="";
            }else {
                document.getElementById('error-zhucpass').innerHTML="两次输入密码不一致";}
        }
        function onzhuphone() {
            var zhuphone=$("[name='zhuphone']").val();
            var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
            if (zhuphone.length!==0&&reg.test(zhuphone)){
                document.getElementById('error-zhuphone').innerHTML="";
            }else {
                document.getElementById('error-zhuphone').innerHTML="电话输入有误";}
        }
        function onzhuemail() {
            var zhuemail=$("[name='zhuemail']").val();
            var reg=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
            if (zhuemail.length!==0&&reg.test(zhuemail)){
                document.getElementById('error-zhuemail').innerHTML="";
            }else {
                document.getElementById('error-zhuemail').innerHTML="邮箱输入有误";}
        }
    </script>
</head>
<body>
<div id="div1" style="margin:0 auto;border: 1px blue solid; width: 350px;text-align: center">
<FORM>
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
                <input type="password" name="password">
            </TD>
        </TR>
        <TR>
            <TD>
            </TD>
            <TD>
                <input type="button" value="注册" id="btn1">
                <input type="button" value="登录" onclick="login1()">
            </TD>
        </TR>
    </TABLE>
</FORM>
</div>
<div id="div2" style="margin:0 auto;border: 1px blue solid;width: 350px;text-align: center;display: none">
    <form>
        <table>
            <tr>注册</tr>
            <tr>
                <td>账号：</td>
                <td>
                    <input type="text" name="zhuname" onblur="onzhuname()"/>
                </td>
                <td ><font id="error-name">*</font></td>
            </tr>
            <tr>
                <TD>密码：</TD>
                <TD>
                    <input type="password" name="zhupass" onblur="onzhupass()">
                </TD>
                <td><span id="error-zhupass">*</span></td>
            </tr>
            <tr>
                <TD>重复密码：</TD>
                <TD>
                    <input type="password" name="zhucpass" onblur="onzhucpass()">
                </TD>
                <td><span id="error-zhucpass">*</span></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td>
                    <input type="text" name="zhuphone" onblur="onzhuphone()"/>
                </td>
                <td><span id="error-zhuphone">*</span></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <input type="text" name="zhuemail" onblur="onzhuemail()"/>
                </td>
                <td><span id="error-zhuemail">*</span></td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <input type="button" value="返回" id="btn2">
                    <input type="reset" value="重置"/>
                    <input type="button" value="注册" onclick="zhuce()">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
