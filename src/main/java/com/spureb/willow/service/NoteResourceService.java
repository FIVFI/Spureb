package com.spureb.willow.service;

import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.NoteResourceVo;

public interface NoteResourceService {

    BaseResponse getNotePadMyNoteList(NoteResourceVo noteResourceVo);

    NoteResourceVo getNotePadById(Integer id);

    BaseResponse addNotePadMyNote(NoteResourceVo noteResourceVo);
    BaseResponse updateNotePadMyNote(NoteResourceVo noteResourceVo);
}
