<link rel="stylesheet" href="/static/editor.md-master/css/editormd.preview.css" />
<base target="_blank">
<body>
<div class="headDiv">
    <div style="width: 60%; ">
        <p>
            <strong style="color: rgba(250,250,250,0.8);font-size: 30px" id="title-h1"></strong>

            by <a href="/hint/show">
                <strong id="title-h4"></strong>
            </a>
        </p>
    </div>
    <div style="position:absolute;width: 40%;right: 5%;text-align: right;top: 25px">
        <div id="share-show" onclick="alert('连接已复制至粘贴板')" data-clipboard-text="" class="right-box"><i style="line-height: 35px;width: 40px" class="fa fa-external-link"></i></div>
    </div>
</div>
<div id="test-markdown-view">
    <!-- Server-side output Markdown text -->
    <textarea style="display:none;"></textarea>
</div>

</body>

<script src="/static/js/jquery-3.4.1.min.js"></script>
<script src="/static/editor.md-master/editormd.js"></script>
<script src="/static/editor.md-master/lib/marked.min.js"></script>
<script src="/static/editor.md-master/lib/prettify.min.js"></script>
<script src="/static/js/clipboard.js"></script>
<style>
    body a{
        color: #4183c4;
        text-decoration: none;
    }
    body{
        background-color: rgba(30,30,30,1);
    }
    .markdown-body h1, .markdown-body h2 , .markdown-body hr, .markdown-body h3{
        border-bottom: 1px solid rgba(250,250,250,0.1);
    }
    .right-box{
        text-align: center;
        color: grey;float: right;
        line-height: 80px;
    }
    .right-box:hover {
        background-color: rgba(250,250,250,0.1);
        color: rgba(250, 250 ,250 ,0.8);
        cursor: pointer;
    }
    strong{
        margin: 4px;
    }
    #test-markdown-view{
        width:90%;margin:auto;background-color: rgba(30, 30 ,30 ,1);color: gray;
    }
    .headDiv{
        width:90%;margin:auto;color: rgba(250,250,250,0.8);
    }
    /*定义滚动条高宽及背景
高宽分别对应横竖滚动条的尺寸*/
    ::-webkit-scrollbar
    {
        width:10px;
        height:4px;
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
<script type="text/javascript">

    let noteTitle = "";
    let noteId = "";
    $(function() {
        $.ajax({
            url: "/query/notePad/myNoteNById?nId=${nId}",
            method: "get",
            success: function (rel) {
                noteTitle = rel.data.noteTitle;
                noteId = rel.data.noteResourceId;
                $('#title-h1').text(rel.data.noteTitle);
                $('#title-h4').text(rel.data.authorName);
                let testView = editormd.markdownToHTML("test-markdown-view", {
                    markdown : rel.data.htmlContent, // Also, you can dynamic set Markdown text
                    htmlDecode : true,  // Enable / disable HTML tag encode.
                    htmlDecode : "style,script,iframe",  // Note: If enabled, you should filter some dangerous HTML tags for website security.
                    theme: "dark"
                });
            },
            contentType:"application/json"
        });
    });


</script>
