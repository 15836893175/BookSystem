package com.ltc.pojo;

public class Loginfo {
    private Integer ids;
    private String loguser;
    private String logdate;
    private String logaction;

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

    public String getLoguser() {
        return loguser;
    }

    public void setLoguser(String loguser) {
        this.loguser = loguser;
    }

    public String getLogdate() {
        return logdate;
    }

    public void setLogdate(String logdate) {
        this.logdate = logdate;
    }

    public String getLogaction() {
        return logaction;
    }

    public void setLogaction(String logaction) {
        this.logaction = logaction;
    }

    @Override
    public String toString() {
        return "loginfo{" +
                "ids=" + ids +
                ", loguser='" + loguser + '\'' +
                ", logdate='" + logdate + '\'' +
                ", logaction='" + logaction + '\'' +
                '}';
    }
}
