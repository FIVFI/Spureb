<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/static/theme/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="/static/js/jquery-3.4.1.min.js"></script>
    <script src="/static/js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/static/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body>
    <#list noteResourceList as item>
        <div class="pen-list addTab" data-url="/notepad/myNote/view?nId=${item.noteResourceId}" data-id="note_tbl${item.noteResourceId}" data-name="${item.noteTitle}">
            <i style="color: gray" class="fa fa-file-text"></i>
            <span>${item.noteTitle}</span>
        </div>
    <#else>
        <div class="pen-list addTab" data-url="/hint/show" data-id="hint1001" data-name="提示">
            <i style="color: gray" class="fa fa-info-circle"></i>
            <span>空的</span>
        </div>
    </#list>
<div class="panel-add-bottom">
    <div><span>+</span></div>
</div>
<script>

</script>
</body>
</html>
