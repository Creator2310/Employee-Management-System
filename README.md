# 🧾 EMS: Employee Management System

EMS (Employee Management System) is a web-based application developed using Java EE technologies. It provides a centralized platform for managing employee and manager records efficiently through role-based access. The system supports CRUD operations, clean UI design, and is scalable for future enhancements such as performance tracking, leave management, and more.

---

## 📌 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [System Requirements](#system-requirements)
- [Project Architecture](#project-architecture)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Usage Guide](#usage-guide)
- [Future Enhancements](#future-enhancements)
- [License](#license)

---

## 📚 Overview

The EMS project streamlines traditional employee record-keeping by offering:
- Role-based dashboards for Admins and Managers
- Secure login system
- Create, Read, Update, Delete (CRUD) operations for both Employees and Managers
- Centralized data control and management interface

The application is built with JSP, Servlets, JDBC, and deployed on Apache Tomcat. The UI is enhanced using Pico CSS to ensure a clean and user-friendly experience.

---

## ✨ Features

- 🔐 Role-Based Access (Admin, Manager)
- 👤 CRUD Operations for Employees and Managers
- 📊 Admin Dashboard for managing all users
- 🧩 Modular three-layer architecture (DAO, Service, Servlet)
- 📄 Clean and Responsive UI with Pico CSS
- 💾 JDBC Integration with MySQL for data persistence

---

## 🛠️ Technology Stack

### Frontend
- HTML5, CSS3
- JSP (Java Server Pages)
- Pico CSS

### Backend
- Java (JDK 17)
- Jakarta EE (Servlets, JSP)
- JDBC (Java Database Connectivity)
- Maven

### Database
- MySQL
- phpMyAdmin / MySQL Workbench

### Tools
- Apache Tomcat 10
- IntelliJ IDEA / NetBeans
- Git & GitHub

---

## 💻 System Requirements

- OS: Windows 10 or later
- Java Development Kit: JDK 17+
- Database: MySQL Server
- IDE: IntelliJ IDEA / NetBeans
- Server: Apache Tomcat 10
- Web Browser: Chrome, Firefox, or Edge
- Maven: Project build tool

---

## 🏗️ Project Architecture

The system follows a layered MVC (Model-View-Controller) architecture:

Client (Browser) │ ▼ [JSP View Layer] ←→ [Servlet Controller Layer] ←→ [Service Layer] ←→ [JDBC Layer] ←→ [MySQL Database]


---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Creator2310/Employee-Management-System
cd EMS
```

## 🧭 Usage Guide
For first time create an admin user and password in database
- Admin Credentials (default):
    - Username: admin 
    - Password: admin123

- Admin Features:
  - Manage (Add/Update/Delete/View) Employees 
  - Manage (Add/Update/Delete/View) Managers 
  - View dashboard with records

- Manager Features:
  - View personal information 
  - View list of Employees

- Future: Approve leaves, assign tasks, etc.
