package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/welcome")
public class WelcomeServlet extends HttpServlet {
    private static final List<Student> students = new ArrayList<>();

    static {
        students.add(new Student("S1", "Student One", "Dep 1", 35));
        students.add(new Student("S2", "Student Two", "Dep 1", 70));
        students.add(new Student("S3", "Student Three", "Dep 1", 60));
        students.add(new Student("S4", "Student Four", "Dep 1", 90));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("students", students);
        request.getRequestDispatcher("welcome.jsp").forward(request, response);
    }
}

class Student {
    private String id;
    private String name;
    private String department;
    private int mark;

    public Student(String id, String name, String department, int mark) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.mark = mark;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDepartment() {
        return department;
    }

    public int getMark() {
        return mark;
    }
}
