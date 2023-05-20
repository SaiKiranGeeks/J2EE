<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diabetes Data</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
  font-size: 18px;
  background-color: #fff;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
}

th, td {
  text-align: left;
  padding: 12px;
}

th {
  background-color: #0077b6;
  color: white;
  font-size: 20px;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

.report-button {
  background-color: #0077b6;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 20px;
  cursor: pointer;
  border-radius: 4px;
  border: none;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
}

.report-button:hover {
  background-color: #005f8b;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>

<body>
    <div style="text-align:center; margin-top: 50px;">
        <h1 style="font-size: 40px;">Diabetes Report</h1>
    </div>
    <form method="post" action="report" onsubmit="return validateForm();">
    
	<input type="hidden" name="name" value="<%= request.getParameter("name") %>">
			
    <table>
        <tr>
            <th>Date</th>
            <th>Test Time (Morning)</th>
            <th>Fasting Blood Sugar Level</th>
            <th>Breakfast Food</th>
            <th>Lunch Food</th>
            <th>Dinner Food</th>
            <th>Test Time (Night)</th>
            <th>Sugar Level After 2 Hours of Eating</th>
        </tr>
        <c:forEach var="data" items="${dataList}">
            <tr>
                <td>${data.date}</td>
                <td>${data.amTestTime}</td>
                <td>${data.fastingBloodSugarLevel}</td>
                <td>${data.breakfastFood}</td>               
                <td>${data.lunchFood}</td>                
                <td>${data.dinnerFood}</td>
                <td>${data.nightTestTime}</td>
                <td>${data.sugarLevelAfterTwoHours}</td>
            </tr>
        </c:forEach>
    </table>
    <center>
        <button class="report-button">Get Report</button>
    </center>
    </form>
</body>
</html>
