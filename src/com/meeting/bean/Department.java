package com.meeting.bean;

public class Department {
    private int id;
    private int departmentid;
    private String departmentname;

    public Department() {
    }

    public Department(int departmentid, String departmentname) {
        this.departmentid = departmentid;
        this.departmentname = departmentname;
    }
    public int getid() {
        return id;
    }

    public void setid(int id) {
        this.id = id;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }
}
