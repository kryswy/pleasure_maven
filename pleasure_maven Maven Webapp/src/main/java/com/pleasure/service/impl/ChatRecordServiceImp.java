package com.pleasure.service.impl;



import org.springframework.stereotype.Service;

import com.pleasure.dao.ChatRecordDao;
import com.pleasure.dto.ChatRecord;
import com.pleasure.service.ChatRecordService;

import java.util.List;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/12/27.
 */
@Service
public class ChatRecordServiceImp implements ChatRecordService{
	@Resource
    ChatRecordDao chatRecordDao;

    public List<ChatRecord> getRecord(String usernanme){
        List<ChatRecord> chatRecords = chatRecordDao.getRecord(usernanme);
        return chatRecords;
    }

    public void saveRecord(ChatRecord chatRecord){
        chatRecordDao.saveRecord(chatRecord);
    }

    public void hasRead(String username){
        chatRecordDao.hasRead(username);
    }
    public List<String> getNoReadNames(){
        return chatRecordDao.getNoReadNames();
    }

    @Override
    public int countRecords() {
        return chatRecordDao.countRecords();
    }
}
