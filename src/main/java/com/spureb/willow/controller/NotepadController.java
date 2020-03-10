package com.spureb.willow.controller;

import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.base.BaseUserInfo;
import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.service.NoteResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NotepadController {
    @Autowired
    NoteResourceService noteResourceService;

    @PostMapping(value = "/add/notePad/myNote")
    public BaseResponse addNotePadMyNote(@RequestBody NoteResourceVo noteResourceVo){
        noteResourceVo.setByAuthor(BaseUserInfo.getCurrentUser().getUserId());
        return noteResourceService.addNotePadMyNote(noteResourceVo);
    }
    @PostMapping(value = "/update/notePad/myNote")
    public BaseResponse updateNotePadMyNote(@RequestBody NoteResourceVo noteResourceVo){
        return noteResourceService.updateNotePadMyNote(noteResourceVo);
    }
    @GetMapping(value = "/query/notePad/myNote")
    public BaseResponse queryNotePadMyNote(@RequestBody NoteResourceVo noteResourceVo){
        return noteResourceService.getNotePadMyNoteList(noteResourceVo);
    }
    @GetMapping(value = "/query/notePad/myNoteNById")
    public BaseResponse queryNotePadMyNoteById(Integer nId){
        return BaseResponse.create(noteResourceService.getNotePadById(nId));
    }
}
