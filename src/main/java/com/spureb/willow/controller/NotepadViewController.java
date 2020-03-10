package com.spureb.willow.controller;

import com.spureb.willow.service.NoteResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
public class NotepadViewController {



    @Autowired
    NoteResourceService noteResourceService;

    @Autowired
    HttpServletRequest request;

    @GetMapping(value = "/show/myNote/view")
    public ModelAndView myNoteView(Integer nId) {
        ModelAndView view = new ModelAndView();
        view.addObject("nId",nId);
        view.addObject("host",request.getServerName());
        view.setViewName("controlPanel/show_md");
        return view;
    }
    @GetMapping(value = "/share/myNote/view")
    public ModelAndView shareMyNoteView(Integer nId) {
        ModelAndView view = new ModelAndView();
        view.addObject("nId",nId);
        view.setViewName("controlPanel/show_share_md");
        return view;
    }


    @GetMapping(value = "/notepad/myNote/view")
    public ModelAndView notepadMyNoteView() {
        ModelAndView view = new ModelAndView();
        view.setViewName("notepad/myNote");
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

}
