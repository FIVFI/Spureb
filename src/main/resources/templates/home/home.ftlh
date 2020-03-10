<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pure Book</title>
    <link rel="stylesheet" href="/static/theme/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="/static/js/jquery-3.4.1.min.js"></script>
    <script src="/static/js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/static/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<style>
    body{
        background: rgba(30,30,30,1);
    }
    .pen-file{
        position: absolute;width: 100%;bottom: 35px;top:35px;
        overflow: auto;

     }
  .pen-list{
      width: 100%;
      background-color: rgba(0,0,0,0);
      color: rgba(250, 250 ,250 ,0.7);
      height: 35px;
      overflow:hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
  }
  .pen-list i{
      line-height: 35px;
      margin-left: 15px;
  }
  .pen-list span{
      line-height: 35px;
      font-size: 13px;
      margin-left: 5px;
  }
  .pen-list:hover{
      width: 100%;
      transition: all 0.2s ease-in;
      background-color: rgba(200,200,200,0.1);
      height: 35px;
      text-overflow:inherit;
      overflow:visible;
  }
  .pen-list-active{
      width: 100%;
      transition: all 0.2s ease-in;
      color: white;
      background-color: rgba(100,100,100,0.2);
      height: 35px;
  }
    .control-panel-show{
        width: 100%;height: 100%;
    }
</style>
<body>
<div class="header-body">
    <div class="left-box" style="line-height: 48px;width: 150px;text-align: center;">PureBook</div>
    <a href="/logout"><div class="right-box"><i style="line-height: 48px;width: 50px;" class="fa fa-sign-out"></i></div></a>
</div>
<div class="left-body">
<#--    <div class="menu-box"><i class="fa fa-users"></i></div>-->
    <div class="menu-box menu-box-active"><i class="fa fa-book "></i></div>
<#--    <div class="menu-box"><i class="fa fa-cloud "></i></div>-->
<#--    <div class="menu-box"><i class="fa fa-user "></i></div>-->
    <div id="control-panel" class="control-panel">
        <div class="control-panel-show">
            <div class="panel-title">
                <div class="left-box"><span style="color: gray;font-size: 13px;line-height: 35px;margin-left: 20px">笔记本</span></div>
                <div class="right-box black-menu"><i style="line-height: 35px;width: 40px" class="fa fa-angle-left"></i></div>
            </div>
            <div class="pen-file">
                <div class="pen-list notepad" data-name="myNote">
                    <i style="color: seagreen" class="fa fa-bookmark"></i>
                    <span>文档</span>
                </div>
<#--                <div class="pen-list notepad" data-name="myCollect">-->
<#--                    <i style="color: darkred" class="fa fa-bookmark"></i>-->
<#--                    <span>文章</span>-->
<#--                </div>-->
<#--                <div class="pen-list notepad" data-name="noteCommunity">-->
<#--                    <i style="color: rebeccapurple" class="fa fa-bookmark"></i>-->
<#--                    <span>社区</span>-->
<#--                </div>-->
<#--                <div class="pen-list notepad" data-name="library">-->
<#--                    <i style="color: saddlebrown" class="fa fa-bookmark"></i>-->
<#--                    <span>图书馆</span>-->
<#--                </div>-->
            </div>
        </div>

        <div class="control-panel-show" id="control-panel-myNote">
            <div class="panel-title">
                <div class="left-box box black-notepad"><i style="line-height: 35px;width: 40px" class="fa fa-caret-left"></i></div>
                <div class="left-box"><span style="color: gray;font-size: 13px;line-height: 35px;margin-left: 10px">文档</span></div>
                <div class="right-box black-menu"><i style="line-height: 35px;width: 40px" class="fa fa-angle-left"></i></div>
            </div>
            <div class="pen-file">
                <#if noteResourceList?exists>
                    <#list noteResourceList as item>
                        <div class="pen-list addTab" data-url="/show/myNote/view?nId=${item.noteResourceId}" data-id="note_tbl${item.noteResourceId}" data-name="${item.noteTitle}">
                            <i style="color: gray" class="fa fa-file-text"></i>
                            <span>${item.noteTitle}</span>
                        </div>
                    <#else>
                        <div class="pen-list addTab" data-url="/hint/show" data-id="hint1001" data-name="提示">
                            <i style="color: gray" class="fa fa-info-circle"></i>
                            <span>空的</span>
                        </div>
                    </#list>
                </#if>
            </div>
            <div class="panel-add-bottom">
                <div><span>+</span></div>
            </div>
        </div>
        <div class="control-panel-show" id="control-panel-myCollect">
            <div class="panel-title">
                <div class="left-box box black-notepad"><i style="line-height: 35px;width: 40px" class="fa fa-caret-left"></i></div>
                <div class="left-box"><span style="color: gray;font-size: 13px;line-height: 35px;margin-left: 10px">收藏</span></div>
                <div class="right-box black-menu"><i style="line-height: 35px;width: 40px" class="fa fa-angle-left"></i></div>
            </div>
            <div class="pen-file">
                    <div class="pen-list addTab" data-url="/hint/show" data-id="hint1001" data-name="提示">
                        <i style="color: gray" class="fa fa-info-circle"></i>
                        <span>空的</span>
                    </div>
            </div>
            <div class="panel-add-bottom">
                <div><span>+</span></div>
            </div>
        </div>
    </div>
</div>
<div class="right-body">
    <div id="switch-tool-up" onclick="closeToolMenu()"><i class="fa fa-chevron-up"></i></div>
    <div class="tool-menu-box"><i class="fa fa-home"></i></div>
    <div class="tool-menu-box"><i class="fa fa-clock-o "></i></div>
    <div class="tool-menu-box"><i class="fa fa-comment "></i></div>
    <div class="tool-menu-box"><i class="fa fa-plus "></i></div>
</div>
<div id="switch-tool-open" onclick="openToolMenu()">
    <i class="fa fa-caret-left "></i>
</div>
<div id="main-body" ondblclick="hideMenu()" >
    <div id="tab-list" >
        <div id="showTab" onclick="tabListSpill()" class="right-box"><i style="line-height: 35px;width: 40px;" class="fa fa-align-justify"></i></div>
    </div>
    <div id="showIndexPage" class="tab_content"> <iframe class="show-panel" src="/test/show"></iframe> </div>
</div>
<#--    tab切换    -->
<script src="/static/js/index.js"></script>
<script>
    function closeAddIndex() {
        window.location.reload();
    }
</script>
</body>
</html>
