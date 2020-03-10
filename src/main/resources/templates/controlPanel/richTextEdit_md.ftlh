
<link rel="stylesheet" href="/static/editor.md-master/css/editormd.css" />
<div id="test-editor" style="position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <textarea id = "mdTextContent" style="display:none;"></textarea>
</div>
<div id="showBtu">
    save
</div>
<div class="hint-popup">
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
                    <div class="label-title" id="saveBtu" style="display: none">
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
           let editor = editormd("test-editor", {
                path : '/static/editor.md-master/lib/',
                theme : "dark",
                previewTheme : "dark",
                editorTheme : "lesser-dark"//lesser-dark
               ,toolbarIcons : function() {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return ["undo", "redo", "|", "bold", "del","italic","quote","ucwords","lowercase","|", "h1", "h2","h3","h4","h5", "|", "list-ul", "list-ol", "hr","|","link","reference-link","image","code","code-block","table","html-entities", "||", "watch", "preview", "clear", "help"]
                },
                codeFold : true,
                //syncScrolling : false,
                saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
                searchReplace : true,
                //watch : false,                // 关闭实时预览
                htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                //toolbar  : false,             //关闭工具栏
                //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                emoji : true,
                taskList : true,
                tocm            : true,         // Using [TOCM]
                tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart : true,             // 开启流程图支持，默认关闭
                sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "./php/upload.php",
                onload : function() {
                    console.log('onload', this);
                }
            });

        //显示标题填写
        $('#showBtu').click(function () {
            $('.hint-popup').fadeIn();
            // console.log(editor.getHTML());
        });
        //保存文章
        $('#saveBtu').click(function () {
            let noteResourceVo = {
                'noteTitle':$('#title').val(),
                'htmlContent':$('#mdTextContent').text(),
                'editType': 1,
                'resourceType': 1
            };
            $.ajax({
                url: "/add/notePad/myNote",
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
            $('.hint-popup').hide();
        });
        //监听输入框文字
        $('#title').on("input",function () {
            if(this.value.length){
                $('#saveBtu').show();
            }else{
                $('#saveBtu').hide();
            }
        });
        $('body').dblclick(function () {
            window.parent.hideMenu();
        })
    });

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
    .hint-popup{
        position: fixed;top: 0;left: 0;right: 0;bottom: 0;height: 100%;
        text-align: center;
        z-index: 999;
        background-color: rgba(20,20,20,0.8);
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