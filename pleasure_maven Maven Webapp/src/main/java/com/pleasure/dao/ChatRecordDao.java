package com.pleasure.dao;



import java.util.List;

import com.pleasure.dto.ChatRecord;

/**
 * Created by Administrator on 2016/12/27.
 */
public interface ChatRecordDao {
    List<ChatRecord> getRecord(String username);
    void saveRecord(ChatRecord chatRecord);
    void hasRead(String username);
    List<String> getNoReadNames();
    int countRecords();
}
