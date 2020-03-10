<link rel="stylesheet" href="/static/editor.md-master/css/editormd.preview.css" />
<body>
<div id="test-markdown-view">
    <!-- Server-side output Markdown text -->
    <textarea style="display:none;"></textarea>
</div>
<div style="position:absolute;width: 40%;right: 6%;text-align: right;top: 25px">
    <div class="right-box">
        <svg style="width: 25px;height: 25px"  t="1583574237055" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2559" width="200" height="200"><path d="M917.91 98.85h-812a40.35 40.35 0 0 0-40.3 40.3v655.09a40.35 40.35 0 0 0 40.3 40.3h302.81l103.24 93 106.89-93h299.06a40.35 40.35 0 0 0 40.3-40.3V139.15a40.35 40.35 0 0 0-40.3-40.3z m-16.3 679.09H597.68l-85.07 74-82.16-74H122.21V155.45h779.4z" p-id="2560" fill="#bfbfbf"></path><path d="M190.89 275.33h642.05v56.6H190.89zM190.89 439.91h448.09v56.6H190.89zM190.89 599.71h253.42v56.6H190.89z" p-id="2561" fill="#bfbfbf"></path></svg>
    </div>
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
            markdown : "## PurebBook\n " +
                "\n" +
                "\n" +
                "> markdown编辑器：https://pandao.github.io/editor.md/\n" +
                "技术支持 [YesionHu](https://github.com/Yesionio \"github\")\n" +
                "使用的时候请务必采用[谷歌Chrome](https://www.google.com/intl/zh-CN/chrome/ \"官网\")浏览器\n" +
                "\n" +
                "#### 前言：\n" +
                "- 这是一个简单的文档工具网页，由于本人技术有限，很多功能无法满足到大家的需求，还请多多包含（如果改进的建议或问题欢迎反馈）\n" +
                "- 网页提供免费的空间为热爱电脑软件的的小伙伴们编写自己的文档使用，如有侵权请联系及时\n" +
                "\n" +
                "##### e-mail： FIVFIBo@gmail.com", // Also, you can dynamic set Markdown text
            htmlDecode : true,  // Enable / disable HTML tag encode.
            htmlDecode : "style,script,iframe",  // Note: If enabled, you should filter some dangerous HTML tags for website security.
            theme: "dark"
        });

    });
    $('body').dblclick(function () {
        window.parent.hideMenu();
    })

</script>
<style>
    .right-box{
        border-radius: 3px;
        text-align: center;
        color: grey;float: right;
        line-height: 80px;
    }
    .right-box:hover {
        background-color: rgba(250,250,250,0.1);
        color: rgba(250, 250 ,250 ,0.8);
        cursor: pointer;
    }
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
</style>