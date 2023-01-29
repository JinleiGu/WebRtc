package com.meeting.service;

import com.meeting.bean.EmployeeDep;
import com.meeting.bean.Meeting;
import com.meeting.dao.EmployeeDao;
import com.meeting.bean.Employee;

import java.util.List;


public class EmployeeService {
    private EmployeeDao employeeDao = new EmployeeDao();
    private Employee loginUser;
    public List<Employee> searchEmp(String employeename, String username, int status, int page, int count) {
        return employeeDao.searchEmp(employeename, username, status, page, count);
    }
    public int getCount(String employeename, String username, int status) {
        return employeeDao.getCount(employeename, username, status);
    }
    public Employee getLoginUser() {
        return loginUser;
    }
    public int updateEmpStatusById(int id, int status) {
        return employeeDao.updateEmpStatusById(id, status);
    }
    public int changepwdById(int id, String newpwd) {
        return employeeDao.changepwdById(id, newpwd);
    }
    public List<Employee> getUnApproveaccount() {
        return employeeDao.getUnApproveaccount();
    }

    public int login(String username, String password) {
        int result = 3;
        Employee loginEmp = employeeDao.login(username, password);
        if (loginEmp == null) {
            return result;
        }else{
            this.loginUser = loginEmp;
            return loginEmp.getStatus();
        }
    }
    public EmployeeDep getEmpByEmpId(int empid) {
        EmployeeDep employeedep = employeeDao.getEmpByEmpId(empid);
        return employeedep;
    }
    public int update(Employee employee) {
        return employeeDao.update(employee);
    }
    public int reg(Employee employee) {
        return employeeDao.reg(employee);
    }
    public List<Employee> getEmpByDepId(int depId) {
        return employeeDao.getEmpByDepId(depId);
    }

}
