<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html><html lang="en" class="no-js"><script type="text/javascript" src="/static/plugin/jquery-easyui/jquery.min.js"></script><script type="text/javascript">    function login() {        //使用ajax来进行登陆        $.post("/login.do", $("form").serialize(), function (data) {            if (data.success) {                window.parent.location.href = '/index.do'; //window.parent: 解决页面嵌套问题            } else {                //alert(data.msg);                $("body").showbanner({                    //title : "warning",                    icon: "/static/banneralert/images/error.png",                    content: data.msg,                    sound: "/static/banneralert/sounds/sms-received1.mp3",                    addclass: "mybannerstyle2"                });            }        }, "json");    }</script><script>    function keyUp(e) {        var currKey = 0, e = e || event;        currKey = e.keyCode || e.which || e.charCode;        var keyName = String.fromCharCode(currKey);        //alert("按键码: " + currKey + " 字符: " + keyName);        if (currKey == 13) {            login();        }    }    document.onkeyup = keyUp;</script><head>    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <%--<meta charset="utf-8">--%>    <title>Genius Education</title>    <meta name="viewport" content="width=device-width, initial-scale=1.0">    <!-- CSS -->    <link rel="stylesheet" href="/static/assets/css/reset.css">    <link rel="stylesheet" href="/static/assets/css/supersized.css">    <link rel="stylesheet" href="/static/assets/css/style.css">    <link rel="stylesheet" href="/static/banneralert/banneralert.css">    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->    <!--[if lt IE 9]>    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>    <![endif]--></head><body><div class="page-container">    <h1>Login</h1>    <form method="post">        <input type="text" name="username" class="username" value="admin" placeholder="Username">        <input type="password" name="password" class="password" value="666" placeholder="Password">        <button type="button" onclick="login()">Sign me in</button>        <div class="error"><span>+</span></div>        <div>            <br/>        <p class="text-muted text-center"> <a href="#"><small>忘记密码了？</small></a> | <a href="/register.jsp">注册一个新账号</a></p>        </div>    </form>    <div class="connect">        <p>Or connect with:</p>        <p>            <a class="facebook" href="http://www.facebook.com"></a>            <a class="twitter" href="http://www.twitter.com"></a>        </p>    </div></div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><div style="text-align:center;" class="login-help">    <p>Copyright ©2018 Genius Education</p></div><!-- Javascript --><script src="/static/assets/js/jquery-1.8.2.min.js"></script><script src="/static/assets/js/supersized.3.2.7.min.js"></script><script src="/static/assets/js/supersized-init.js"></script><script src="/static/assets/js/scripts.js"></script><script src="/static/banneralert/banneralert.js"></script></body></html>