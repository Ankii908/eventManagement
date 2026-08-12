<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Event</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f7f7f7;
        }

        .page-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 40px;
        }

        .event-card {
            width: 490px;
            background-color: white;
            padding: 28px 20px 20px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.12);
        }

        .event-card h2 {
            text-align: center;
            margin: 8px 0 20px 0;
            color: #222;
            font-size: 23px;
        }

        .form-group {
            margin-bottom: 14px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 13px;
            color: #333;
        }

        .form-control {
            width: 100%;
            height: 35px;
            padding: 7px 10px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 13px;
            outline: none;
        }

        .form-control:focus {
            border-color: #999;
        }

        textarea.form-control {
            height: 82px;
            resize: vertical;
        }

        .create-btn {
            width: 100%;
            height: 36px;
            border: none;
            border-radius: 4px;
            background-color: #d9d9d9;
            color: #222;
            font-size: 13px;
            cursor: pointer;
        }

        .create-btn:hover {
            background-color: #c8c8c8;
        }

        .cancel-container {
            text-align: center;
            margin-top: 13px;
        }

        .cancel-container a {
            color: #0000ee;
            font-size: 12px;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="page-container">
    <div class="event-card">
        <h2>Create New Event</h2>
        <form action="${pageContext.request.contextPath}/admin/createEvent" method="post">
            <div class="form-group"><label for="eventName">Event Name: </label>
				<input type="text" id="eventName" name="eventName" class="form-control" required>
            </div>
            <div class="form-group"><label for="eventDate">Event Date: </label>
				<input type="text" id="eventDate" name="eventDate" class="form-control" placeholder="dd-MM-yyyy" required>
            </div>
            <div class="form-group"><label for="eventLocation">Event Location:</label>
				<input type="text" id="eventLocation" name="eventLocation" class="form-control" required>
            </div>
            <div class="form-group"><label for="eventDetails">Event Details:</label>
                <textarea id="eventDetails" name="eventDetails" class="form-control" required></textarea>
            </div>
            <button type="submit" class="create-btn">Create Event</button>
        </form>
        <div class="cancel-container">
            <a href="${pageContext.request.contextPath}/admin/events">Cancel</a>
        </div>
    </div>
</div>
<Scripts>
	$("#eventDate").datepicker({
	    dateFormat: "dd-mm-yy"
	});
	</Scripts>
</body>
</html>