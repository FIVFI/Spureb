package com.spureb.willow.service;

import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.entity.ResourceVo;

import java.util.List;

public interface NoteResourceService {

    BaseResponse getNotePadMyNoteList(NoteResourceVo noteResourceVo);

    NoteResourceVo getNotePadById(Integer id);

    BaseResponse addNotePadMyNote(NoteResourceVo noteResourceVo);
    BaseResponse updateNotePadMyNote(NoteResourceVo noteResourceVo);
}
