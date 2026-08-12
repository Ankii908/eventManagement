<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: #f5f6f8;
        font-family: Arial, sans-serif;
    }

    .register-container {
        width: 100%;
        max-width: 450px;
        margin: 60px auto;
    }

    .register-card {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 35px 40px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    }

    .register-title {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
        font-size: 28px;
        font-weight: 600;
    }

    .register-card label {
        font-weight: 500;
        margin-bottom: 7px;
        color: #444;
    }

    .register-card .form-control {
        height: 45px;
        border-radius: 5px;
        border: 1px solid #ccc;
        padding: 10px 12px;
    }

    .register-card .form-control:focus {
        border-color: #198754;
        box-shadow: 0 0 0 0.15rem rgba(25, 135, 84, 0.15);
    }

    .register-submit {
        height: 45px;
        font-weight: 500;
        border-radius: 5px;
        margin-top: 10px;
    }

    .login-link {
        display: block;
        text-align: center;
        margin-top: 18px;
        text-decoration: none;
        color: #0d6efd;
        font-size: 14px;
    }

    .login-link:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>
	<body>
	    <div class="register-container">
	        <div class="register-card">
	            <h2 class="register-title">User Registration</h2>
	            <form action="saveUser" method="post" onsubmit="return validatePassword();">
	                <div class="mb-3">
	                    <label>Username</label><input type="text" name="username" placeholder="Enter username" class="form-control" required>
	                </div>
	                <div class="mb-3">
	                    <label>Email</label><input type="email" name="email" placeholder="Enter email" class="form-control" required>
	                </div>
	                <div class="mb-3">
	                    <label>Password</label><input type="password" id="password" name="password" placeholder="Enter password" class="form-control" required>
	                </div>
	                <div class="mb-3">
	                    <label>Confirm Password</label> <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" class="form-control" required>
	                </div>
	                <button type="submit" class="btn btn-success w-100 register-submit">Register</button>

	                <a href="${pageContext.request.contextPath}/login" class="login-link"> Already have an account? Login</a>

	            </form>

	        </div>

	    </div>

<script>

	function validatePassword() {
		debugger;
	    var password = document.getElementById("password").value;
	    var confirmPassword = document.getElementById("confirmPassword").value;
	    if (password !== confirmPassword) {
	        alert("Password and Confirm Password do not match!");
	        return false;
	    }
	    return true;
	}
	
</script>
</body>

</html>