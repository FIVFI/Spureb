<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PureBook</title>
  <script src="/static/js/jquery-3.4.1.min.js"></script>
 <link rel='stylesheet' href='/static/theme/font-awesome-4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="/static/theme/home.css">
  <script src="/static/layer/layer.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <div class="box">

    <div class="left-bar">
      <span class="fa fa-list"></span>
      <div class="menu-group">
        <span class="fa fa-television active menu_span"></span>
        <span class="fa fa-folder menu_span"></span>
<#--        <div class="building">-->
<#--          <span class="fa fa-building"></span>-->
<#--          <span class="fa fa-building"></span>-->
<#--        </div>-->
        <span class="fa fa-bookmark"></span>
        <span class="fa fa-cog menu_span"></span>
        <a href="/" class="fa fa-sign-out menu_span"></a>
      </div>

    </div>
    <div class="wrapper">

      <div class="top-bar"><span class="cloud">PureBook</span>
        <div class="cta-button"><span>+</span></div>
      </div>

      <div class="content">

        <div class="menu">
          <div class="search">
            <label> <span class="fa fa-search"></span></label>
            <input class="input-search" placeholder="搜索"/>
          </div>
          <div class="list-info">
            <span>29 Items</span>
            <span id="view-bars" class="fa fa-bars"></span>
            <span id="view-large" class="fa fa-th-large"></span>
          </div>
        </div>

        <div class="grid">
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
          <div class="card">
            <div class="number"><span>12</span></div>
            <div class="img"></div>
            <div class="product-name"><span>文件管理</span></div>
            <div class="overlay">
              <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
<script>

  let grid = $(".grid");

    window.onload = function () {
      if (layer) {
        let menu_span = $(".menu_span");

        menu_span.on('mouseenter', function(){
          layer.tips('我是另外一个tips，只不过我长得跟之前那位稍有些不一样。', this, {
            tips: [2, 'rgba(176,176,176, 0.78)'],
            time: 2000
          });
        });

        menu_span.on('click', function(){
          $('.active').removeClass("active");
          $(this).addClass("active");
        });
        $('#view-bars').on('click', function(){
          grid.css({"display":"inline"});
        });
        $('#view-large').on('click', function(){
          grid.css({"display":"flex"});
        });
      }

    };

    $(document).ready(function(){
      $('.content').scroll(function(){
        let menu = $(".menu");
        let top = $('.content').scrollTop();
        let height = parseInt(menu.css("height"));
        console.log(top+"-"+height);
        if(top-height < height) {
          menu.css({"position":'',"top":'',"z-index":'',"margin-top":"","margin-left":""});
          grid.css({"margin-top":""});
        } else {
          menu.css({"position":"fixed","top":"0px","z-index":"20","margin-top":"5px","margin-left":"30%"});
          grid.css({"margin-top":height+35});
        }
      });
    });

</script>
</body>
</html>