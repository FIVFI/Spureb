package com.spureb.willow.service.impl;

import com.spureb.willow.base.BaseErrorEnum;
import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.mapper.NotePadMapper;
import com.spureb.willow.service.NoteResourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NoteResourceServiceImpl implements NoteResourceService {

    @Resource
    NotePadMapper notePadMapper;


    @Override
    public BaseResponse getNotePadMyNoteList(NoteResourceVo noteResourceVo) {
        try {
            List<NoteResourceVo> noteResourceVoList = notePadMapper.getNotePadMyNoteList(noteResourceVo);
            return BaseResponse.create(noteResourceVoList);
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }

    @Override
    public NoteResourceVo getNotePadById(Integer id) {
        try{
            return notePadMapper.getNotePadById(id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public BaseResponse addNotePadMyNote(NoteResourceVo noteResourceVo) {
        try {
            notePadMapper.addNotePadMyNote(noteResourceVo);
            return BaseResponse.create(BaseErrorEnum.SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }
    @Override
    public BaseResponse updateNotePadMyNote(NoteResourceVo noteResourceVo) {
        try {
            notePadMapper.updateNotePadMyNote(noteResourceVo);
            return BaseResponse.create(BaseErrorEnum.SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }
}
