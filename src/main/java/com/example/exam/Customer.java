package com.example.exam;

import java.util.Date;

public class Customer {
    private String name;
    private String job;
    private String age;


    public Customer(String n,String j, String a){
        name = n;
        job = j;
        age = a;

    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }



    public String getJob() {
        return job;
    }
    public void setJob(String job) {
        this.job = job;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}