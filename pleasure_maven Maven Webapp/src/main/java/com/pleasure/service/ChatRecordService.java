package com.pleasure.service;


import java.util.List;

import com.pleasure.dto.ChatRecord;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface ChatRecordService {

    List<ChatRecord> getRecord(String usernanme);


    void saveRecord(ChatRecord chatRecord);

    void hasRead(String username);
    List<String> getNoReadNames();
    int countRecords();
    }
