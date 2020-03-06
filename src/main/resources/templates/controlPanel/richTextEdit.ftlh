<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="/static/richText/css/froala_editor.min.css" rel="stylesheet" type="text/css">
    <style>

        section {
            width: 80%;
            margin: auto;
            text-align: left;
        }
        #saveBtu{
            color: gray;
            box-shadow: 0 0 0 1px gray;
            position: fixed;bottom: 5%;right: 20%;width: 70px;height: 30px;
            line-height: 30px;text-align: center;
            border-radius: 4px;
        }
        #saveBtu:hover{
            color: #1b1e21;
            background-color: gray;
            position: fixed;bottom: 5%;right: 20%;width: 70px;height: 30px;
            line-height: 30px;text-align: center;
            border-radius: 4px;cursor: pointer;
        }
    </style>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/static/richText/js/froala_editor.min.js"></script>
    <!--[if lt IE 9]>
    <script src="/static/richText/js/froala_editor_ie8.min.js"></script>
    <![endif]-->
    <script src="/static/richText/js/plugins/tables.min.js"></script>
    <script src="/static/richText/js/plugins/lists.min.js"></script>
    <script src="/static/richText/js/plugins/colors.min.js"></script>
    <script src="/static/richText/js/plugins/media_manager.min.js"></script>
    <script src="/static/richText/js/plugins/font_family.min.js"></script>
    <script src="/static/richText/js/plugins/font_size.min.js"></script>
    <script src="/static/richText/js/plugins/block_styles.min.js"></script>
    <script src="/static/richText/js/plugins/video.min.js"></script>
    <script src="/static/richText/js/langs/zh_cn.js"></script>
</head>

<body>
    <section id="editor">
        <div id='edit' style="color: rgba(200,200,200,0.8);width: 100%;height: 100%">
            <h1>点击编辑主题</h1>

        </div>
        <div id="saveBtu">
            save
        </div>
    </section>

    </div>
    <script src="/static/js/richText.js"></script>
</body>
</html>
