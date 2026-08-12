<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Event Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: #f5f6f8;
        font-family: Arial, sans-serif;
    }

    .login-container {
        width: 100%;
        max-width: 420px;
        margin: 80px auto;
    }

    .login-card {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 35px 40px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    }

    .login-title {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
        font-size: 28px;
        font-weight: 600;
    }

    .login-card label {
        font-weight: 500;
        margin-bottom: 7px;
        color: #444;
    }

    .login-card .form-control {
        height: 45px;
        border-radius: 5px;
        border: 1px solid #ccc;
        padding: 10px 12px;
    }

    .login-card .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
    }

    .login-btn {
        height: 45px;
        font-weight: 500;
        border-radius: 5px;
        margin-top: 10px;
    }

    .register-btn {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        color: #198754;
        font-size: 14px;
    }

    .register-btn:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2 class="login-title">Event Login</h2>
            <form action="login" method="post">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 login-btn">Login  </button>
                <a href="${pageContext.request.contextPath}/register" class="register-btn">Don't have an account? Register</a>
            </form>
        </div>
    </div>
</body>
</html>