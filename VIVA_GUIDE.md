# ExamGrid — Quick Viva & External Examiner Presentation Guide

> **Project:** Automated Examination Seating & Invigilation Management System  
> **Course:** CS3603-1 Java and Spring Framework Laboratory Mini Project  
> **Institution:** NMAM Institute of Technology, Nitte (V Semester B.Tech CSE)  

---

## 👥 Team Members & Roll Numbers

| Person | Name | USN | Viva Role |
|:---:|:---|:---:|:---|
| **1** | **Prajwal Jogi** | `NNM25CS522` | Introduction & Public Student Seat Lookup |
| **2** | **Prajwal Acharya** | `NNM25CS521` | Database Architecture (MySQL 3NF) & Admin Records |
| **3** | **Sathwik P Shetty** | `NNM24CS224` | Anti-Cheating Seating Allocation Engine |
| **4** | **Satvik Hegde** | `NNM24CS225` | Faculty Duties & Printable PDF Generation |

---

## 🔄 Presentation Flow Diagram

```
┌─────────────────────────┐       ┌────────────────────────┐
│   1. Prajwal Jogi       │       │   2. Prajwal Acharya   │
│   NNM25CS522            │       │   NNM25CS521           │
│                         ├──────►│                        │
│ • Problem Statement     │       │ • MySQL Database (3NF) │
│ • Public Seat Search    │       │ • Admin Dashboard/Data │
└─────────────────────────┘       └───────────┬────────────┘
                                              │
                                              ▼
┌─────────────────────────┐       ┌────────────────────────┐
│     4. Satvik Hegde     │       │  3. Sathwik P Shetty   │
│     NNM24CS225          │       │  NNM24CS224            │
│                         │◄──────┤                        │
│ • Invigilation Formula  │       │ • Anti-Cheating Logic  │
│ • OpenPDF Reports       │       │ • Left/Front Neighbors │
└─────────────────────────┘       └────────────────────────┘
```

---

## 📋 Person-by-Person Speaking Scripts & Laptop Actions

### 👤 Person 1: Prajwal Jogi (`NNM25CS522`) — Intro & Student Lookup

* **Ownership:** Problem Statement, Motivation & The Student Search Portal.
* **On Laptop:**
  1. Open browser at: `http://localhost:8080/seat-lookup`
  2. Type USN `NNM24CS224`, click **Search**.
  3. Show the instant result card: Hall Name, Exam Date, Time Slot, Row, and Bench Number.
* **Verbatim Speech:**
  > *"Good morning Sir/Ma'am. In colleges, preparing exam seating arrangements using manual spreadsheets takes hours and leads to copying when students of the same class sit next to each other. We built **ExamGrid** to fully automate this.*  
  > *This is our **Public Student Lookup Portal**: on exam morning, students don't need to log in or remember any passwords. They simply enter their USN and instantly see their allotted Hall, Row, and Bench number without causing crowds near notice boards."*
* **Examiner Q&A:**
  * *Q: Why don't students need to log in?*  
    *A: On exam morning, hundreds of students check their seats simultaneously. Removing login friction prevents server authentication bottlenecks and avoids password lockouts.*

---

### 👤 Person 2: Prajwal Acharya (`NNM25CS521`) — Database & Admin Management

* **Ownership:** MySQL Database Schema (3NF) & Admin Record Management.
* **On Laptop:**
  1. Navigate to: `http://localhost:8080/login`
  2. Log in with: Username `ADMIN`, Password `admin123`.
  3. Show the Admin Dashboard cards: **148 Students**, **10 Faculty Members**, **4 Examination Halls**, **8 Exams** across 3 slots.
  4. Click **Halls** or **Exams** in the top navigation bar to demonstrate CRUD forms.
* **Verbatim Speech:**
  > *"I handled the database architecture and backend administrative data management. Our system runs on MySQL with Spring Data JPA and Hibernate ORM.*  
  > *Our relational schema consists of 7 normalized tables: Students, Faculty, Halls, Exams, Seat Allocations, Invigilation Duties, and Users.*  
  > *The Exam Cell uses this portal to configure examination halls, grid dimensions, and student records with strict server-side validation against negative capacities or duplicate USNs."*
* **Examiner Q&A:**
  * *Q: Which database and ORM are you using?*  
    *A: MySQL 8 with Spring Data JPA and Hibernate. We use Spring Data repositories for automatic transactional queries.*

---

### 👤 Person 3: Sathwik P Shetty (`NNM24CS224`) — Anti-Cheating Seating Logic

* **Ownership:** The Seating Engine & Neighbor Conflict Resolution.
* **On Laptop:**
  1. Click **Allocation** in the navigation bar.
  2. Click **"1. Generate seating"** on the first examination slot (`2026-11-20 09:30-12:30`).
  3. Point out the success banner: *"Seating generated successfully"*.
* **Verbatim Speech:**
  > *"I handled the anti-cheating seating allocation algorithm.*  
  > *Our engine places students into hall grids row-by-row. For every seat, it verifies two direct neighbors: the student to the **Left** and the student in **Front**.*  
  > *It strictly guarantees that adjacent students are from different branches or different subjects so that copying is impossible.*  
  > *If extra desks are available, the algorithm intelligently introduces buffer empty seats rather than forcing peers of the same subject to sit side-by-side."*
* **Examiner Q&A:**
  * *Q: How does the algorithm prevent cheating?*  
    *A: By checking `(row, col - 1)` and `(row - 1, col)`. If any neighbor shares the same subject or branch, that student is held in a round-robin queue until a compatible seat is reached.*

---

### 👤 Person 4: Satvik Hegde (`NNM24CS225`) — Faculty Duties & PDF Export

* **Ownership:** Faculty Invigilation Duty Assignment & Printable OpenPDF Reports.
* **On Laptop:**
  1. On the Allocation page, click **"2. Assign invigilators"** on the same slot.
  2. Click **"Download PDF"** next to Hall LH-101.
  3. The PDF opens instantly in the browser showing the color-coded seating grid, hall header, and student signature lines.
* **Verbatim Speech:**
  > *"I handled faculty invigilation duty assignment and printable PDF reports.*  
  > *For invigilation, the system assigns 1 faculty member for every 30 students ($\lceil N / 30 \rceil$). It uses a greedy fairness algorithm that balances duties so no teacher is overloaded, and strictly prevents double-booking a professor across two halls at the same time.*  
  > *Using the OpenPDF library, the Exam Cell can download printable landscape Seating Charts and Attendance Sheets with student signature columns with a single click."*
* **Examiner Q&A:**
  * *Q: Which library generates the PDF?*  
    *A: OpenPDF 2.0.3 (LGPL/MPL open-source library), which streams styled PDF bytes directly through Spring MVC HTTP responses without requiring external command-line tools.*

---

## 📚 5-Minute Targeted Reading Guide

| Member | Document | Sections / Pages |
|:---|:---|:---|
| **Prajwal Jogi** | `docs/reports/ExamGrid_Abstract.pdf` + `05_Final_Lab_Project_Report.pdf` | Abstract + Pages 1–4 (Problem Statement & Scope) |
| **Prajwal Acharya** | `docs/reports/05_Final_Lab_Project_Report.pdf` | Pages 7–10 (ER Diagram Fig 4.2 & 7 MySQL Tables) |
| **Sathwik P Shetty** | `docs/reports/05_Final_Lab_Project_Report.pdf` | Pages 11–13 (Seating Flowchart Fig 5.1 & Neighbor Rules) |
| **Satvik Hegde** | `docs/reports/05_Final_Lab_Project_Report.pdf` | Pages 13–14 & 19 (Invigilation Flowchart & OpenPDF Structure) |
