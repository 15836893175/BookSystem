package com.ltc.pojo;

public class Orders {
    private Integer ids;
    private String ordername;
    private String date;
    private String orderuser;
    private String address;
    private String nm;

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOrderuser() {
        return orderuser;
    }

    public void setOrderuser(String orderuser) {
        this.orderuser = orderuser;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    @Override
    public String toString() {
        return "orders{" +
                "ids=" + ids +
                ", ordername='" + ordername + '\'' +
                ", date='" + date + '\'' +
                ", orderuser='" + orderuser + '\'' +
                ", address='" + address + '\'' +
                ", nm='" + nm + '\'' +
                '}';
    }
}
