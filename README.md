# ExamGrid — Automated Examination Seating & Invigilation Management System

[![Java](https://img.shields.io/badge/Java-17%2B-ED8B00?logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.4-6DB33F?logo=springboot&logoColor=white)](https://spring.io/projects/spring-boot)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.1-005F0F?logo=thymeleaf&logoColor=white)](https://www.thymeleaf.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-7952B3?logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![OpenPDF](https://img.shields.io/badge/OpenPDF-2.0.3-red)](https://github.com/LibrePDF/OpenPDF)
[![Build Status](https://img.shields.io/badge/Tests-20%2F20%20Passing-brightgreen)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

> **CS3603-1 Java and Spring Framework Laboratory Mini Project**  
> **Department of Computer Science & Engineering**  
> **NMAM Institute of Technology, Nitte (Deemed to be University)**  
> Academic Year: 2025–2026 | V Semester B.Tech CSE

---

## 👥 Project Team Members

| Sl. No. | Name | USN | Project Role & Ownership |
|:---:|:---|:---:|:---|
| 1 | **Prajwal Jogi** | `NNM25CS522` | **System Architecture & Public Student Seat Lookup** |
| 2 | **Prajwal Acharya** | `NNM25CS521` | **Database Management (MySQL 3NF) & Admin Portal** |
| 3 | **Sathwik P Shetty** | `NNM24CS224` | **Anti-Cheating Seating Allocation Engine** |
| 4 | **Satvik Hegde** | `NNM24CS225` | **Invigilation Duty Balancing & OpenPDF Generation** |

---

## 📦 Project Deliverables & Downloads

- 📦 **[ExamGrid_Best_Final.zip](ExamGrid_Best_Final.zip)** (53.9 MB) — Standalone distribution with pre-built application JAR and 1-click Windows launchers (`run.bat` / `run.ps1`).
- 📄 **[05_Final_Lab_Project_Report.pdf](docs/reports/05_Final_Lab_Project_Report.pdf)** (40 Pages) — Complete official department report with Certificate, Declaration, Literature Survey, System Design, Algorithms, and Test Results.
- 📄 **[ExamGrid_Abstract.pdf](docs/reports/ExamGrid_Abstract.pdf)** (1 Page) — Executive summary and project abstract.
- 📚 **Full IEEE Report Series in [`docs/reports/`](docs/reports/):**
  - [`01_Project_Proposal_and_SRS.pdf`](docs/reports/01_Project_Proposal_and_SRS.pdf) — Software Requirements Specification
  - [`02_System_Design_and_ERD_Specification.pdf`](docs/reports/02_System_Design_and_ERD_Specification.pdf) — Architectural Design & ER Diagram
  - [`03_Allocation_Algorithm_and_Backend_Spec.pdf`](docs/reports/03_Allocation_Algorithm_and_Backend_Spec.pdf) — Core Allocation Algorithms
  - [`04_REST_API_and_Testing_Report.pdf`](docs/reports/04_REST_API_and_Testing_Report.pdf) — REST API Specification & Test Suite
  - [`05_Final_Lab_Project_Report.pdf`](docs/reports/05_Final_Lab_Project_Report.pdf) — Comprehensive Final Project Report

---

## 🎤 The Simplified 4-Person Viva Plan

```
┌─────────────────────┐   ┌────────────────────┐   ┌─────────────────────┐   ┌──────────────────────┐
│                     │   │                    │   │                     │   │                      │
│   1. Prajwal Jogi   │   │ 2. Prajwal Acharya │   │ 3. Sathwik P Shetty │   │   4. Satvik Hegde    │
│                     │   │                    │   │                     │   │                      │
│    Introduction &   ├──►│  Database (MySQL)  ├──►│    Anti-Cheating    ├──►│   Faculty Duties &   │
│                     │   │                    │   │                     │   │                      │
│ Student Seat Lookup │   │  & Admin Records   │   │  Seating Algorithm  │   │ Printable PDF Charts │
│                     │   │                    │   │                     │   │                      │
└─────────────────────┘   └────────────────────┘   └─────────────────────┘   └──────────────────────┘
```

### 👤 Person 1: Prajwal Jogi (`NNM25CS522`) — Introduction & Student Lookup
* **What you own:** The Problem Statement, Objective & The Student Search Portal.
* **What you do on laptop:**
  1. Open browser to: `http://localhost:8080/seat-lookup`
  2. Type USN `NNM24CS224`, click **Search**.
  3. Show the instant result card displaying: Hall Name, Exam Date, Time Slot, Row, and Bench Number.
* **What you say (Keep it simple):**
  > *"Good morning Sir/Ma'am. In colleges, preparing exam seating arrangements using manual spreadsheets takes hours and leads to copying when students of the same class sit next to each other. We built **ExamGrid** to fully automate this.*  
  > *This is our **Public Student Lookup Portal**: on exam morning, students don't need to log in or remember any passwords. They simply enter their USN and instantly see their allotted Hall, Row, and Bench number without causing crowds near notice boards."*
* **Examiner Q&A:**
  * *Q: Why don't students need to log in?*  
    *A: On exam morning, hundreds of students check their seats simultaneously. Removing login friction prevents server authentication bottlenecks and avoids password lockouts.*

---

### 👤 Person 2: Prajwal Acharya (`NNM25CS521`) — Database & Admin Management
* **What you own:** MySQL Database Schema (3NF) & Admin Record Management.
* **What you do on laptop:**
  1. Navigate to: `http://localhost:8080/login`
  2. Log in with: Username `ADMIN`, Password `admin123`.
  3. Show the Admin Dashboard cards: **148 Students**, **10 Faculty Members**, **4 Examination Halls**, **8 Exams** across 3 slots.
  4. Click **Halls** or **Exams** in the top navigation bar to demonstrate CRUD forms.
* **What you say (Keep it simple):**
  > *"I handled the database architecture and backend administrative data management. Our system runs on MySQL with Spring Data JPA and Hibernate ORM.*  
  > *Our relational schema consists of 7 normalized tables: Students, Faculty, Halls, Exams, Seat Allocations, Invigilation Duties, and Users.*  
  > *The Exam Cell uses this portal to configure examination halls, grid dimensions, and student records with strict server-side validation against negative capacities or duplicate USNs."*
* **Examiner Q&A:**
  * *Q: Which database and ORM are you using?*  
    *A: MySQL 8 with Spring Data JPA and Hibernate. We use Spring Data repositories for automatic transactional queries.*

---

### 👤 Person 3: Sathwik P Shetty (`NNM24CS224`) — Anti-Cheating Seating Logic
* **What you own:** The Seating Engine & Neighbor Conflict Resolution.
* **What you do on laptop:**
  1. Click **Allocation** in the navigation bar.
  2. Click **"1. Generate seating"** on the first examination slot (`2026-11-20 09:30-12:30`).
  3. Point out the success banner: *"Seating generated successfully"*.
* **What you say (Keep it simple):**
  > *"I handled the anti-cheating seating allocation algorithm.*  
  > *Our engine places students into hall grids row-by-row. For every seat, it verifies two direct neighbors: the student to the **Left** and the student in **Front**.*  
  > *It strictly guarantees that adjacent students are from different branches or different subjects so that copying is impossible.*  
  > *If extra desks are available, the algorithm intelligently introduces buffer empty seats rather than forcing peers of the same subject to sit side-by-side."*
* **Examiner Q&A:**
  * *Q: How does the algorithm prevent cheating?*  
    *A: By checking `(row, col - 1)` and `(row - 1, col)`. If any neighbor shares the same subject or branch, that student is held in a round-robin queue until a compatible seat is reached.*

---

### 👤 Person 4: Satvik Hegde (`NNM24CS225`) — Faculty Duties & PDF Export
* **What you own:** Faculty Invigilation Duty Assignment & Printable OpenPDF Reports.
* **What you do on laptop:**
  1. On the Allocation page, click **"2. Assign invigilators"** on the same slot.
  2. Click **"Download PDF"** next to Hall LH-101.
  3. The PDF opens instantly in the browser showing the color-coded seating grid, hall header, and student signature lines.
* **What you say (Keep it simple):**
  > *"I handled faculty invigilation duty assignment and printable PDF reports.*  
  > *For invigilation, the system assigns 1 faculty member for every 30 students ($\lceil N / 30 \rceil$). It uses a greedy fairness algorithm that balances duties so no teacher is overloaded, and strictly prevents double-booking a professor across two halls at the same time.*  
  > *Using the OpenPDF library, the Exam Cell can download printable landscape Seating Charts and Attendance Sheets with student signature columns with a single click."*
* **Examiner Q&A:**
  * *Q: Which library generates the PDF?*  
    *A: OpenPDF 2.0.3 (LGPL/MPL open-source library), which streams styled PDF bytes directly through Spring MVC HTTP responses without requiring external command-line tools.*

---

## 📖 5-Minute Targeted Reading List for Each Person

You do not need to read the entire 40-page report. Read only your assigned 2–4 pages:

| Team Member | File to Read | Specific Pages / Sections to Focus On |
|:---|:---|:---|
| **Prajwal Jogi** | [`ExamGrid_Abstract.pdf`](docs/reports/ExamGrid_Abstract.pdf) & [`05_Final_Lab_Project_Report.pdf`](docs/reports/05_Final_Lab_Project_Report.pdf) | Abstract (Page 1) + Report 05: Pages 1–4 (Problem Statement, Motivation, Scope) |
| **Prajwal Acharya** | [`05_Final_Lab_Project_Report.pdf`](docs/reports/05_Final_Lab_Project_Report.pdf) | Chapter 4: Pages 7–10 (ER Diagram Fig 4.2, 7 Relational Tables, JPA Entity Relationships) |
| **Sathwik P Shetty** | [`05_Final_Lab_Project_Report.pdf`](docs/reports/05_Final_Lab_Project_Report.pdf) | Chapter 5: Pages 11–13 (Seating Flowchart Fig 5.1, Left & Front Neighbor Checking) |
| **Satvik Hegde** | [`05_Final_Lab_Project_Report.pdf`](docs/reports/05_Final_Lab_Project_Report.pdf) | Chapter 5: Pages 13–14 & 19 (Invigilation Duty Formula, OpenPDF Document Structure Fig 5.3) |

---

## 🚀 Quick Start — How to Run the Project

### Prerequisites
- **JDK 17 or higher** installed (`java -version`).
- *(Optional)* MySQL 8.0 running locally on port 3306. (If MySQL is not detected, the 1-click script automatically runs in high-speed in-memory H2 mode).

---

### Option 1: 1-Click Launch (Recommended for Windows)

Simply double-click:
```cmd
run.bat
```
*(Or in PowerShell: `./run.ps1`)*

**What the launcher does automatically:**
1. Checks for local MySQL on port 3306. If unavailable, falls back to in-memory H2 so the app starts immediately with zero configuration.
2. Checks for pre-built JAR in `target/` or builds it via Maven wrapper.
3. Automatically sets Hibernate reserved keyword quoting (`globally_quoted_identifiers=true`).
4. Seeds 148 students, 10 faculty, 4 halls, and 8 exams automatically on first boot.
5. Launches at **`http://localhost:8080`**.

---

### Option 2: Run via Command Line / Terminal

#### Using Pre-built Standalone JAR:
```bash
java -Dspring.jpa.properties.hibernate.globally_quoted_identifiers=true -jar target/examgrid-1.0.0.jar
```

#### Using Maven Wrapper:
- **Windows (Command Prompt / PowerShell):**
  ```cmd
  .\mvnw.cmd spring-boot:run
  ```
- **macOS / Linux:**
  ```bash
  ./mvnw spring-boot:run
  ```

---

## 🔑 Default Login Credentials

| Portal / Role | URL | Username | Password | Notes |
|:---|:---|:---:|:---:|:---|
| **Public Seat Lookup** | `/seat-lookup` | *None* | *None* | Search with USN (e.g. `NNM24CS224`) |
| **Exam Cell (Admin)** | `/login` | `ADMIN` | `admin123` | Full CRUD & Allocation Control |
| **Faculty Portal** | `/login` | `FAC101` | `Welcome@123` | View assigned invigilation duties |
| **Student Portal** | `/login` | `NNM24CS224` | `Welcome@123` | View personal seat & exam schedule |

---

## 🧪 Automated Testing & Verification

The project includes 20 comprehensive unit and integration tests covering the Seating Engine, Duty Allocation, Entity Validation, and Web Controllers.

Run all tests:
```bash
./mvnw test
# Or on Windows:
.\mvnw.cmd test
```

### Test Suite Summary:
```
[INFO] Running com.examgrid.service.SeatingAllocationServiceTest
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0
[INFO] Running com.examgrid.service.InvigilationAllocationServiceTest
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0
[INFO] Running com.examgrid.controller.AllocationWebControllerTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0
[INFO] Running com.examgrid.repository.RepositoryIntegrationTest
[INFO] Tests run: 6, Failures: 0, Errors: 0, Skipped: 0
[INFO] -------------------------------------------------------
[INFO] BUILD SUCCESS - 20/20 Tests Passed (100%)
```

---

## 📂 Project Directory Structure

```
ExamGrid/
├── .mvn/                     # Maven wrapper configuration
├── docs/                     # Project documentation & resources
│   ├── latex/                # IEEE LaTeX report source files (.tex, figures, .sty)
│   ├── postman/              # Postman collection for REST API testing
│   ├── reports/              # All 6 PDF project reports
│   │   ├── 01_Project_Proposal_and_SRS.pdf
│   │   ├── 02_System_Design_and_ERD_Specification.pdf
│   │   ├── 03_Allocation_Algorithm_and_Backend_Spec.pdf
│   │   ├── 04_REST_API_and_Testing_Report.pdf
│   │   ├── 05_Final_Lab_Project_Report.pdf
│   │   └── ExamGrid_Abstract.pdf
│   └── schema.sql            # MySQL 8 table DDL script
├── src/
│   ├── main/
│   │   ├── java/com/examgrid/
│   │   │   ├── config/       # DataSeeder (seeds 148 students, 10 faculty, 4 halls)
│   │   │   ├── controller/   # Web & REST Controllers (/seat-lookup, /allocation, /api/**)
│   │   │   ├── dto/          # Java Records & API DTOs
│   │   │   ├── entity/       # 7 JPA Entities (Student, Faculty, Hall, Exam, Allocation, etc.)
│   │   │   ├── exception/    # Global Exception Handler & ControllerAdvice
│   │   │   ├── repository/   # Spring Data JPA Repositories
│   │   │   ├── security/     # Spring Security Filter Chain & Role-Based Access Control
│   │   │   └── service/      # SeatingAlgorithm, InvigilationService, PdfExportService
│   │   └── resources/
│   │       ├── static/       # CSS, JavaScript (Bootstrap 5, FontAwesome)
│   │       ├── templates/    # Thymeleaf HTML Templates (fragments, layout, dashboard)
│   │       └── application.properties # Spring Boot configuration
│   └── test/                 # 20 JUnit 5 & MockMvc unit/integration tests
├── ExamGrid_Best_Final.zip   # Complete standalone project ZIP distribution
├── mvnw                      # Linux/macOS Maven wrapper script
├── mvnw.cmd                  # Windows Maven wrapper batch file
├── pom.xml                   # Maven dependencies and build plugins
├── run.bat                   # 1-Click Windows Command Prompt launcher
├── run.ps1                   # 1-Click Windows PowerShell launcher
└── README.md                 # Project documentation and viva guide
```

---

## 🛡️ Security & Technical Highlights

1. **Anti-Cheating Seating Engine:** Two-dimensional grid constraint verification (`Left != Current` and `Front != Current`) with buffer seat generation.
2. **Duty Balancing Algorithm:** Greedy minimum-workload assignment prevents faculty overload and eliminates time collisions.
3. **OpenPDF Integration:** Server-side document rendering streaming landscape color-coded PDF charts and sign-in attendance sheets directly to HTTP response streams.
4. **Spring Security Architecture:** Role-Based Access Control (`ROLE_ADMIN`, `ROLE_FACULTY`, `ROLE_STUDENT`) with public access permitted for emergency student lookups.
5. **Proactive Security Compliance:** Zero hardcoded production secrets, strict parameter binding via JPA Criteria/JPQL preventing SQL injection, and robust XSS protection via Thymeleaf HTML escaping.

---

## 📜 License & Acknowledgements

Developed as part of the **Java and Spring Framework Laboratory (CS3603-1)** curriculum at **NMAM Institute of Technology, Nitte**.

Licensed under the [MIT License](LICENSE).
