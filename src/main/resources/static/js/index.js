//主菜单按钮
let menuBox = $('.menu-box');
// 文件列表按钮
let addTab = $('.addTab');
let tabSpill = false;
initialNote();

/* 切换选项卡 */
function tabChange() {
    $('.panel-tab-title').removeClass('panel-tab-title-active');
    $(this).addClass('panel-tab-title-active');
    $(".tab_content").hide();
    let activeTab = $(this).attr("rel");
    $("#" + activeTab).fadeIn();
    document.getElementById('tab-list').style.height="35px";
    tabSpill = false;
}

// 关闭选项卡
function closeTab(obj) {

    $('#' + $(obj).parent().attr('rel')).remove();
    $(obj).parent().remove();
    if ($(obj).parent().is('.panel-tab-title-active')) {
        $(".tab_content:last").show();
        $(".panel-tab-title:first").addClass('panel-tab-title-active');
    }
}

// 隐藏侧边菜单
function hideMenu() {
    document.getElementById('main-body').style.left = "48px";
    $("#control-panel").hide();
    closeToolMenu();
}

// 添加选项卡
function addTabPanel(id, url, title) {
    $('.panel-tab-title-active').removeClass('panel-tab-title-active');
    // 1、判断是否存在已有的选项卡
    let classList = document.getElementsByClassName('panel-tab-title');
    for (let i = 0; i < classList.length; i++) {
        let index = $(classList[i]).attr('rel');
        if (id == index) {
            // 激活选项
            $(classList[i]).addClass('panel-tab-title-active');
            let activeRel = $('.panel-tab-title-active').attr('rel');
            $(".tab_content").hide(); //Hide all content
            $("#" + activeRel).fadeIn();
            return
        }
    }
    let htmlTabList = $('<div class="panel-tab-title panel-tab-title-active" rel="' + id + '"> <div class="left-box tabLeft"><span>' + title + '</span></div> <div onclick="closeTab(this)" class="tabRight"><i class="fa fa-close"></i></div> </div>');
    //添加点击切换事件
    htmlTabList.click(tabChange);
    $('#tab-list').prepend(htmlTabList);
    //添加面板
    let htmlDiv = '<div id="' + id + '" class="tab_content"> <iframe class="show-panel" src="' + url + '"></iframe> </div>';
    $('#main-body').append(htmlDiv);
    $(".tab_content").hide(); //Hide all content
    $(".tab_content:last").fadeIn();
}

// 打开工具类菜单
function openToolMenu() {
    $("#switch-tool-open").hide();
    document.getElementById('main-body').style.right = "48px";
    $(".right-body").slideDown()();

}

//关闭工具类菜单
function closeToolMenu() {
    document.getElementById('main-body').style.right = "0";
    $(".right-body").hide();
    $("#switch-tool-open").show();
}

// 点击菜单切换选项卡
function noteChange() {
    $('.control-panel-show').hide();
    let activeTab = $(this).data('name');
    $("#control-panel-" + activeTab).fadeIn();
    document.getElementById('tab-list').style.height="35px";
    tabSpill = false;
}
//选项卡溢出
function tabListSpill() {
    if(tabSpill){
        document.getElementById('tab-list').style.height="35px";
        tabSpill = false;
    }else{
        tabSpill = true;
        document.getElementById('tab-list').style.height="auto";
    }
}


//侧边栏菜单收起
function initialNote() {
    $('.control-panel-show').hide();
    $('.control-panel-show:first').fadeIn();
}


$(function () {
    // 主菜单点击事件
    menuBox.click(function () {
        menuBox.removeClass('menu-box-active');
        $(this).addClass('menu-box-active');
        $("#control-panel").fadeIn();
        document.getElementById('main-body').style.left = "248px";
    });
    $('.black-menu').click(function () {
        hideMenu();
    });

    //给按钮添加选项卡
    addTab.click(function () {
        addTab.removeClass('pen-list-active');
        $(this).addClass('pen-list-active');
        let title = $(this).data('name');
        let dataUrl = $(this).data('url');
        let dataId = $(this).data('id');
        addTabPanel(dataId, dataUrl, title);
    });

    //菜单点击事件
    $('.notepad').click(noteChange);
    //收起侧边菜单
    $('.black-notepad').click(initialNote);
    //添加笔记
    $('.panel-add-bottom').click(function () {
        hideMenu();
        addTabPanel('addNotepad', '/notepad/myNote/add/view', '添加笔记');
    });

});



