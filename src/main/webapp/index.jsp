<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Employee Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Icons (Font Awesome CDN) -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            min-height: 100vh;
        }

        /* Navbar Styling */
        nav {
            background-color: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 24px;
            font-weight: 600;
            color: #fff;
            letter-spacing: 1px;
        }

        .nav-links a {
            margin-left: 25px;
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #333;
        }

        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.15);
            padding: 50px;
            margin: 60px auto;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 1000px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            width: 250px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .container i {
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 15px;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 16px;
            color: #666;
            margin-bottom: 15px;
        }

        button {
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #388e3c;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
                padding: 30px;
                margin: 40px 20px;
            }

            nav {
                flex-direction: column;
                align-items: flex-start;
            }

            .nav-links {
                margin-top: 10px;
            }

            .nav-links a {
                display: block;
                margin: 10px 0 0 0;
            }
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="logo">EMS</div>
    <div class="nav-links">
        <a href="admin.jsp">Admin Login</a>
        <a href="manager.jsp">Manager Login</a>
        <a href="employee.jsp">Employee Login</a>
    </div>
</nav>

<!-- Dashboard Section -->
<div class="dashboard-container">
    <div class="container">
        <i class="fas fa-user-shield"></i>
        <h1>Admin</h1>
        <h2>Portal Access</h2>
        <button onclick="location.href='admin.jsp'">Admin Login</button>
    </div>

    <div class="container">
        <i class="fas fa-user-tie"></i>
        <h1>Manager</h1>
        <h2>Portal Access</h2>
        <button onclick="location.href='manager.jsp'">Manager Login</button>
    </div>

    <div class="container">
        <i class="fas fa-user"></i>
        <h1>Employee</h1>
        <h2>Portal Access</h2>
        <button onclick="location.href='employee.jsp'">Employee Login</button>
    </div>
</div>

</body>
</html>
