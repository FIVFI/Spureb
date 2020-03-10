<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PureBook-登录界面</title>
  <link rel="stylesheet" href="/static/theme/login/style.css" media="all">
  <link rel="stylesheet" href="/static/theme/login/fort.css" media="all">
  <link rel="stylesheet" href="/static/theme/home.css">

</head>
<body style="user-select: none">
<div class="form-wrapper" >

  <div class="top">
    <div class="colors"></div>
  </div>

  <div class="LogoNav" id="LogoNav">
    <a href="">PureBook</a>
  </div>

  <form name="form" action="/login" method="Post" style="margin-bottom: 100px">
    <div class="form">
      <div class="form-item">
        <input type="text" id="username" name="username" required="required" placeholder="账号" autocomplete="off">
      </div>
      <div class="form-item">
        <input type="password" id="password" name="password" required="required" placeholder="密码" autocomplete="off">
      </div>
      <div class="button-panel">
        <input type="submit" class="button" title="Sign In" value="登录">
      </div>
    </div>
  </form>

</div>

<div class="div_bottom">
  技术支持 <a href="https://github.com/Yesionio" target="_blank" class="support-span">Yesion Hu</a>
</div>
<script src="/static/theme/login/fort.js"></script>
<script type="text/javascript">
  window.onload = function () {
    flash();
    var msg = "${msg!''}";
    if (msg !== "") {
      alert(msg);
    }
  };

</script>

</body>