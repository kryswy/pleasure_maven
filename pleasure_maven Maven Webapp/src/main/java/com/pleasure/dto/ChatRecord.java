package com.pleasure.dto;

/**
 * Created by Administrator on 2016/12/27.
 */
public class ChatRecord {
    private int id;
    private String username;
    private int direction;
    private String msg;
    private String filesrc;
    private String createtime;
    private int isread;


    public ChatRecord() {
    }

    public ChatRecord(String username, int direction, String msg, String filesrc, String createtime, int isread) {
        this.username = username;
        this.direction = direction;
        this.msg = msg;
        this.filesrc = filesrc;
        this.createtime = createtime;
        this.isread = isread;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDirection() {
        return direction;
    }

    public void setDirection(int direction) {
        this.direction = direction;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getFilesrc() {
        return filesrc;
    }

    public void setFilesrc(String filesrc) {
        this.filesrc = filesrc;
    }

    public int getIsread() {
        return isread;
    }

    public void setIsread(int isread) {
        this.isread = isread;
    }

    @Override
    public String toString() {
        return "ChatRecord [" +
                "id=" + id +
                ", username=" + username +
                ", direction=" + direction +
                ", msg='" + msg  +
                ", filesrc='" + filesrc  +",createtime=" + createtime + ",isread=" + isread +
                "]";
    }
}
