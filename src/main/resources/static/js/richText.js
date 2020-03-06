$(function () {
    $('#edit').editable({
        inlineMode: false,
        alwaysBlank: true,
        language: "zh_cn",
        direction: "ltr",
    });
    $('#saveBtu').click(function () {
        let content = $('#edit > div.froala-element.not-msie.f-basic').html();
        let title = $('#edit > div.froala-element.not-msie.f-basic').find("h1").first().text();
        let noteResourceVo = {
            'noteTitle':title,
            'htmlContent':content
        };
        $.ajax({
            url: "/add/notePad/myNote",
            data: JSON.stringify(noteResourceVo),
            method: "Post",
            success: function (rel) {
                console.log(rel);
            },
            contentType:"application/json"
    });
    });
});