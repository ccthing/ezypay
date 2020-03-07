<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
</head>
<body>
<h1>Subscription Amount: ${subscriptionModel.amount}</h1>
<h1>Subscription Type: <c:if test="${subscriptionModel.subscriptionType == '1'}">Daily</c:if>
<c:if test="${subscriptionModel.subscriptionType == '2'}">Weekly</c:if>
<c:if test="${subscriptionModel.subscriptionType == '3'}">Monthly</c:if>
</h1>
<h1>Subscription Payment Day Or Week: ${subscriptionModel.paymentDayOrWeek}</h1>
<h1>Subscription Start Date: <fmt:formatDate pattern = "dd/mm/yyyy" value = "${subscriptionModel.startDate}" /></h1>
<h1>Subscription End Date: <fmt:formatDate pattern = "dd/mm/yyyy" value = "${subscriptionModel.endDate}" /></h1>
<h1>Invoice Date: <br>
<c:forEach items="${invoiceDate}" var="element"> 
  <fmt:formatDate pattern = "dd-MM-yyyy" value = "${element}" /><br>
</c:forEach>
</h1>
</body>
</html>