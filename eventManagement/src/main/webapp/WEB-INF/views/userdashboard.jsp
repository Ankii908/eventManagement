<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Events</title>
    <style>
        * {
            box-sizing: border-box;
        }

		 body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f7f7f7;
        }

        .container {
            width: 735px;
            margin: 115px auto 0;
            background-color: white;
            padding: 25px 18px 18px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.12);
        }

        h2 {
            text-align: center;
            margin: 8px 0 18px;
            font-size: 22px;
            color: #222;
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

        .book-btn {
            background-color: #d9d9d9;
            border: 1px solid #c5c5c5;
            border-radius: 4px;
            padding: 5px 13px;
            font-size: 12px;
            cursor: pointer;
        }

        .book-btn:hover {
            background-color: #c8c8c8;
        }

        .booked-btn {
            background-color: #8bc48b;
            color: white;
            border: 1px solid #72ad72;
            border-radius: 4px;
            padding: 5px 13px;
            font-size: 12px;
            cursor: default;
        }

        .logout {
            text-align: center;
            margin-top: 15px;
        }

        .logout a {
            color: #0000ee;
            font-size: 12px;
            text-decoration: underline;
        }

        .no-events {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Available Events</h2>
    <c:choose>
        <c:when test="${not empty events}">
            <table>
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Details</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="event" items="${events}">
                        <tr>
                            <td>${event.eventName}</td>
                            <td>${event.eventDate}</td>
                            <td>${event.eventLocation}</td>
                            <td>${event.eventDetails}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${bookedEventIds.contains(event.id)}">
                                        <button  type="button" class="booked-btn" disabled> Booked</button>
                                    </c:when>
                                    <c:otherwise>
                                        <form  action="${pageContext.request.contextPath}/bookEvent"  method="post"  style="margin: 0;">
                                            <input type="hidden"  name="eventId"  value="${event.id}">
                                            <button type="submit"  class="book-btn"> Book Now</button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>

        <c:otherwise>
            <div class="no-events">
                No events are currently available.
            </div>
        </c:otherwise>
    </c:choose>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/logout"> Log Out</a>
    </div>
</div>
<!-- SUCCESS ALERT -->
<c:if test="${not empty bookingSuccess}">
    <script>
        alert("${bookingSuccess}");
    </script>
</c:if>

<!-- ERROR ALERT -->
<c:if test="${not empty bookingError}">
    <script>
        alert("${bookingError}");
    </script>
</c:if>

</body>
</html>