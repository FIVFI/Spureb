package com.spureb.willow.mapper;

import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.entity.ResourceVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NotePadMapper {

    List<NoteResourceVo> getNotePadMyNoteList(NoteResourceVo noteResourceVo);
    NoteResourceVo getNotePadById(Integer nId);
    boolean addNotePadMyNote(NoteResourceVo noteResourceVo);
    boolean updateNotePadMyNote(NoteResourceVo noteResourceVo);
}
