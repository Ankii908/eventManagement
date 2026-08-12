<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Event Management</title>

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
            width: 1115px;
            margin: 0 auto;
            padding: 30px 0 40px;
        }

        .top-section {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.10);
        }

        h2 {
            text-align: center;
            margin: 5px 0 20px;
            font-size: 22px;
            color: #222;
        }

        .create-event-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #d9d9d9;
            border: 1px solid #c5c5c5;
            border-radius: 4px;
            color: #222;
            text-decoration: none;
            text-align: center;
            font-size: 13px;
            cursor: pointer;
        }

        .create-event-btn:hover {
            background-color: #c8c8c8;
        }

        .admin-title {
            margin-top: 35px;
            margin-bottom: 30px;
            font-size: 16px;
            color: #222;
        }

        .event-management {
            width: 675px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 25px 18px 18px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.12);
        }

        .event-management h2 {
            margin-bottom: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }

        th {
            background-color: #eeeeee;
            font-weight: bold;
            text-align: left;
            padding: 9px;
            border: 1px solid #d4d4d4;
        }

        td {
            padding: 9px;
            border: 1px solid #d4d4d4;
            color: #333;
        }

        .view-btn {
            background-color: #d9d9d9;
            border: 1px solid #c5c5c5;
            border-radius: 4px;
            padding: 5px 13px;
            font-size: 12px;
            cursor: pointer;
        }

        .view-btn:hover {
            background-color: #c8c8c8;
        }

        .users-section {
            margin-top: 18px;
        }

        .users-title {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .user-row {
            padding: 7px;
            border: 1px solid #d4d4d4;
            margin-bottom: 4px;
            font-size: 12px;
            background-color: #fafafa;
        }

        .no-users {
            padding: 10px;
            border: 1px solid #d4d4d4;
            font-size: 12px;
            color: #666;
            text-align: center;
        }

        .no-events {
            text-align: center;
            padding: 20px;
            color: #666;
            font-size: 13px;
        }

        .bottom-links {
            text-align: center;
            margin-top: 20px;
        }

        .bottom-links a {
            color: #0000ee;
            font-size: 12px;
            text-decoration: underline;
            margin: 0 10px;
        }

        .success-message {
            margin: 15px auto;
            width: 675px;
            padding: 10px;
            background-color: #dff0d8;
            border: 1px solid #b8d8a8;
            color: #3c763d;
            border-radius: 4px;
            font-size: 12px;
        }

        .error-message {
            margin: 15px auto;
            width: 675px;
            padding: 10px;
            background-color: #f2dede;
            border: 1px solid #ebcccc;
            color: #a94442;
            border-radius: 4px;
            font-size: 12px;
        }

    </style>

</head>


<body>


<div class="page-container">
    <div class="event-management">
        <h2>Event Management</h2>
        <c:choose>
            <c:when test="${not empty events}">
                <table>
                    <thead>
                        <tr>
                            <th>Event Name</th>
                            <th>Date</th>
                            <th>Location</th>
                            <th>View Users</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="event" items="${events}">
                            <tr>
                                <td> ${event.eventName}</td>
                                <td>${event.eventDate}</td>
                                <td>${event.eventLocation}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/event/users"  method="get"style="margin: 0;">
										<input type="hidden" name="eventId" value="${event.id}">
										<button type="submit" class="view-btn">View Users </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-events">No events are currently available.</div>
            </c:otherwise>
        </c:choose>
        <c:if test="${not empty selectedEvent}">
            <div class="users-section">
                <div class="users-title">
                    Users Registered for ${selectedEvent.eventName}:
                </div>
                <c:choose>
                    <c:when test="${not empty registeredUsers}">
                        <c:forEach var="user" items="${registeredUsers}">
                            <div class="user-row">
                                ${user.username}
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="no-users">
                            No users have registered for this event.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
        <div class="bottom-links">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                Create Event
            </a>
            <a href="${pageContext.request.contextPath}/logout">
                Log Out
            </a>
        </div>
    </div>
</div>
</body>
</html>