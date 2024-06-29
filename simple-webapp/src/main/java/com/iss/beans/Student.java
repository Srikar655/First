package com.iss.beans;

public class Student {
    private int sno;
    private String sname;

    // Constructor (if needed)
    public Student(int sno, String sname) {
        this.sno = sno;
        this.sname = sname;
    }

    // Getter for sno
    public int getSno() {
        return sno;
    }

    // Setter for sno
    public void setSno(int sno) {
        this.sno = sno;
    }

    // Getter for sname
    public String getSname() {
        return sname;
    }

    // Setter for sname
    public void setSname(String sname) {
        this.sname = sname;
    }
}