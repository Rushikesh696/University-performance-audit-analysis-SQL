# 🎓 University Performance Audit System (SQL Project)

A comprehensive SQL-based system to analyze and audit academic and administrative performance within a university environment. This project simulates a realistic educational institution’s data, enabling insights into student outcomes, faculty efficiency, course effectiveness, and departmental trends.

---

## 📌 Project Objectives

- Analyze student academic performance across courses and departments
- Evaluate faculty effectiveness based on feedback and results
- Identify trends in attendance, grades, and enrollment
- Enable data-driven academic audits and decision-making

---

## 🗂️ Dataset Overview

The project uses synthetic data generated with Faker and Python. Each CSV contains 350+ rows to simulate a mid-sized university environment.

| Table Name   | Description |
|--------------|-------------|
| `students`   | Basic student info including DOB, gender, department, etc. |
| `faculty`    | Faculty profile with department and joining date |
| `departments`| University departments and their HODs |
| `courses`    | Courses offered by each department |
| `enrollments`| Records of which students took which courses and their grades |
| `attendance` | Attendance records per student per course |
| `exams`      | Midterm and final exam schedules per course |
| `marks`      | Exam scores for each student |
| `feedback`   | Student ratings and comments for faculty and courses |


Insights Extracted from SQL Queries
High Course Load Students (2022):

Identified students who enrolled in more than 10 courses in the 2022 academic year.
🟢 Useful for tracking academic pressure or over-enrollment.

Faculty Performance Based on Feedback:

Calculated average feedback rating for each faculty member.
🟢 Supports faculty evaluations and reward systems.

Department-Wise Student Extraction (Computer Science):

Retrieved all students and their emails from the Computer Science department.
🟢 Can be used for targeted communication or departmental audits.

Demanding Courses Identification:

Listed all semester 1 courses with more than 3 credits.
🟢 Helps in identifying challenging or core courses.

Low Attendance Alert:

Found students who were absent more than 5 times in any course.
🟢 Useful for intervention, counseling, or disciplinary action.

Top Performers by Course and Exam:

Extracted students with the highest cumulative marks in each course.
🟢 Assists in generating merit lists and awards.

Feedback Gaps by Students:

Identified students who have never submitted feedback for any faculty.
🟢 Highlights participation gaps in the feedback system.

Best Performing Departments:

Calculated the department with the highest average grades (GPA-like scale).
🟢 Useful for institutional ranking and departmental benchmarking.

Faculty Teaching Breadth:

Found the number of different courses each faculty received feedback for.
🟢 Indicates teaching diversity and course handling load.

Consistent Underperformance:

Listed students who failed in 2 or more different courses.
🟢 Helps flag students for academic intervention and support.

✅ Summary of Audit Use Cases
🔹 Student Support: Identify overburdened, underperforming, or disengaged students.

🔹 Faculty Evaluation: Measure effectiveness based on feedback and course outcomes.

🔹 Curriculum Audit: Highlight tough or low-performing courses.

### Conclusion
This project demonstrates how structured university data can be leveraged using SQL to perform performance audits, academic analytics, and institutional insights. With a solid schema and meaningful queries, it helps uncover trends in student outcomes, faculty efficiency, and course effectiveness—paving the way for smarter academic decisions and transparency.

🔹 Department Monitoring: Track departmental performance and attendance trends.

🔹 Administrative Insights: Ensure feedback participation and resource balancing.

