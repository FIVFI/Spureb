package com.spureb.willow.controller;

import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.entity.UserVo;
import com.spureb.willow.service.NoteResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class NotepadViewController {


    @Autowired
    NoteResourceService noteResourceService;

    @GetMapping(value = "/notepad/myNote/view")
    public ModelAndView myNoteView(Integer nId) {
        ModelAndView view = new ModelAndView();
        view.addObject("nId",nId);
        view.setViewName("controlPanel/show_md");
        return view;
    }
    @GetMapping(value = "/notepad/myCollect/view")
    public ModelAndView myCollectView() {
        ModelAndView view = new ModelAndView();
        view.setViewName("notepad/myCollect");
        return view;
    }
    @GetMapping(value = "/notepad/noteCommunity/view")
    public ModelAndView noteCommunityView() {
        ModelAndView view = new ModelAndView();
        view.setViewName("notepad/noteCommunity");
        return view;
    }
    @GetMapping(value = "/notepad/library/view")
    public ModelAndView libraryView() {
        ModelAndView view = new ModelAndView();
        view.setViewName("notepad/library");
        return view;
    }
    @GetMapping(value = "/notepad/myNote/add/view")
    public ModelAndView notepadMyNoteAddView() {
        ModelAndView view = new ModelAndView();
        view.setViewName("controlPanel/richTextEdit_md");
        return view;
    }
    @GetMapping(value = "/notepad/myNote/update/view")
    public ModelAndView notepadMyNoteUpdateView(Integer nId) {
        ModelAndView view = new ModelAndView();
        view.addObject("nId",nId);
        view.setViewName("controlPanel/richTextUpdate_md");
        return view;
    }

    /**
     * 前端主页入口
     * @return
     */
    @GetMapping(value = "/login/verify")
    public ModelAndView loginVerify() {
        ModelAndView view = new ModelAndView();
        UserVo userVo = new UserVo();
        userVo.setCompanyId(1);
        userVo.setUserId(1001);
        userVo.setUserName("Spureb");
        view.addObject("user", userVo);
        NoteResourceVo noteResourceVo = new NoteResourceVo();
        noteResourceVo.setByAuthor(1001);
        view.addObject("user", userVo);
        view.addObject("noteResourceList", noteResourceService.getNotePadMyNoteList(noteResourceVo).getData());
        view.setViewName("home/home");
        return view;
    }

}
