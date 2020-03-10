
<link rel="stylesheet" href="/static/editor.md-master/css/editormd.css" />
<div id="test-editor" style="position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <textarea id = "mdTextContent" style="display:none;padding: 10px"></textarea>
</div>
<div id="showBtu">
    save
</div>
<div class="tilt-popup">
    <div class="form-item">
        <table style="height: 55px;width: 410px;margin: auto;color: white">

            <tr>
                <td>
                    <div class="label-title" id="backUp">
                        <i style="line-height: 55px;width: 55px;" class="fa fa-mail-reply"></i>
                    </div>
                </td>
                <td>
                    <input id="title" name="title" required="required" placeholder="文本标题" autocomplete="off"/>
                </td>
                <td style="width: 55px">
                    <div class="label-title" id="saveBtu">
                        <i style="line-height: 55px;width: 55px;" class="fa fa-check"></i>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
<script src="/static/js/jquery-3.4.1.min.js"></script>
<script src="/static/editor.md-master/editormd.min.js"></script>
<script type="text/javascript">
    $(function() {

        var editor = editormd("test-editor", {
            path   : "/static/editor.md-master/lib/"
            ,theme: "dark"
            ,editorTheme:"lesser-dark"
            ,previewTheme:"dark"
            ,toolbarIcons : function() {
                // Or return editormd.toolbarModes[name]; // full, simple, mini
                // Using "||" set icons align right.
                return ["undo", "redo", "|", "bold", "del","italic","quote","ucwords","lowercase","|", "h1", "h2","h3","h4","h5", "|", "list-ul", "list-ol", "hr","|","link","reference-link","image","code","code-block","table","html-entities", "||", "watch", "preview", "clear", "help"]
            }
            ,saveHTMLToTextarea : true //方便post提交
            ,tex : true, // 开启科学公式TeX语言支持，默认关闭
        });
    });

    $.ajax({
        url: "/query/notePad/myNoteNById?nId=${nId}",
        method: "get",
        success: function (rel) {
            $('#title').val(rel.data.noteTitle);
            $('#mdTextContent').text(rel.data.htmlContent);
        },
        contentType:"application/json"
    });

    //显示标题填写
    $('#showBtu').click(function () {$('.tilt-popup').fadeIn();});
    //保存文章
    $('#saveBtu').click(function () {
        let noteResourceVo = {
            'noteTitle':$('#title').val(),
            'htmlContent':$('#mdTextContent').text(),
            'editType': 1,
            'resourceType': 1,
            "noteResourceId" : "${nId}"
        };
        $.ajax({
            url: "/update/notePad/myNote",
            data: JSON.stringify(noteResourceVo),
            method: "Post",
            success: function (rel) {
                window.parent.closeAddIndex();
            },
            contentType:"application/json"
        });
    });
    //返回按钮
    $('#backUp').click(function () {
        $('.tilt-popup').hide();
    });
    //监听输入框文字
    $('#title').on("input",function () {
        if(this.value.length){
            $('#saveBtu').show();
        }else{
            $('#saveBtu').hide();
        }
    })
</script>
<style>
    body{
        background: #1b1e21;
    }
    #showBtu{
        color: white;
        box-shadow: 0 0 0 1px white;
        background-color: rgba(200,200,200,0.1);
        position: fixed;bottom: 5%;right: 10%;width: 70px;height: 30px;
        line-height: 30px;text-align: center;
        border-radius: 4px;

    }
    #showBtu:hover{
        color: #1b1e21;
        background-color: white;
        cursor: pointer;
    }
    .tilt-popup{
        position: fixed;top: 0;left: 0;right: 0;bottom: 0;height: 100%;
        text-align: center;
        z-index: 999;
        background-color: rgba(30,30,30,0.8);
        display: none;
    }
    .form-item{
        text-align: center;
        margin-top: 16%;
        height: 55px;
    }
    .form-item input{
        outline-style: none ;
        border-bottom: 1px solid rgba(200,200,200,0.6);
        border-top:0;
        border-left:0;
        border-right:0;
        border-radius: 4px;
        background-color: rgba(0, 0, 0, 0);
        color: white;
        font-family: 'Open Sans', sans-serif;
        font-size: 1em;
        height: 55px;
        padding: 0 16px;
        transition: all 0.2s ease-in;
        width: 300px;
    }
    .label-title{
        width: 55px;height: 55px;
        border-radius: 4px;
        text-align: center;color: rgba(200,200,200,0.6);
    }
    .label-title:hover{
        color: white;
        cursor: pointer;
    }
</style>