<link rel="stylesheet" href="/static/editor.md-master/css/editormd.preview.css" />
<body>
<div id="test-markdown-view">
    <!-- Server-side output Markdown text -->
    <textarea style="display:none;"></textarea>
</div>
</body>
<base target="_blank">
<script src="/static/js/jquery-3.4.1.min.js"></script>
<script src="/static/editor.md-master/editormd.js"></script>
<script src="/static/editor.md-master/lib/marked.min.js"></script>
<script src="/static/editor.md-master/lib/prettify.min.js"></script>
<script type="text/javascript">

    $(function() {
        let testView = editormd.markdownToHTML("test-markdown-view", {
            markdown : "### PurebBook\n" +
                "\n" +
                "\n" +
                "> markdown编辑器：https://pandao.github.io/editor.md/\n" +
                "技术支持 [YesionHu](https://github.com/Yesionio \"YesionHu\")\n" +
                "\n" +
                "#### 前言：\n" +
                "- 这是一个简单的文档工具网页，本人技术有限很多地方无法满足大家的需要还请多多包含（如果其他建议可以联系我）\n" +
                "- 网页提供免费的空间为从事IT工作的小伙伴们编写自己的文档使用，如有侵权请联系小破站开发\n" +
                "\n" +
                "##### e-mail： FIVFIBo@gmail.com", // Also, you can dynamic set Markdown text
            htmlDecode : true,  // Enable / disable HTML tag encode.
            htmlDecode : "style,script,iframe",  // Note: If enabled, you should filter some dangerous HTML tags for website security.
            theme: "dark"
        });

    });


</script>
<style>

    .markdown-body h1, .markdown-body h2 , .markdown-body hr, .markdown-body h3{
        border-bottom: 1px solid rgba(250,250,250,0.1);
    }

    strong{
        margin: 4px;
    }
    #test-markdown-view{
        width:90%;margin:auto;color: #888888;background-color: rgba(30, 30 ,30 ,1);
    }
    /*定义滚动条高宽及背景
高宽分别对应横竖滚动条的尺寸*/
    ::-webkit-scrollbar
    {
        width:4px;
        height:1%;
        border-radius:10px;
        background-color: rgba(30, 30 ,30 ,0);
    }
    /*定义滚动条轨道
       内阴影+圆角*/
    ::-webkit-scrollbar-track
    {
        -webkit-box-shadow:inset 0 0 6px rgba(0, 0 ,0 ,0);
        border-radius:6px;
        background-color: rgba(0, 0 ,0 ,0);
    }
    /*定义滑块
     内阴影+圆角*/
    ::-webkit-scrollbar-thumb
    {
        border-radius:6px;
        background-color:gray;
    }
    #layout > header, .btns {
        width: auto;
    }


</style>