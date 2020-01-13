<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PureBook-登录界面</title>
  <link rel="stylesheet" href="/static/theme/login/style.css" media="all">
  <link rel="stylesheet" href="/static/theme/login/fort.css" media="all">
  <link rel="stylesheet" href="/static/theme/home.css">
  <style>

  </style>

</head>
<body style="user-select: none">
<div class="form-wrapper" >

  <div class="top">
    <div class="colors"></div>
  </div>

  <div class="LogoNav" id="LogoNav">
    <a href="">PureBook</a>
  </div>

  <form name="form" action="/login/verify" method="get">
    <div class="form">
      <div class="form-item">
        <input type="text" id="userId" name="userId" required="required" placeholder="账号" autocomplete="off">
      </div>
      <div class="form-item">
        <input type="password" id="passWord" name="passWord" required="required" placeholder="密码" autocomplete="off">
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
  flash();

</script>

</body>