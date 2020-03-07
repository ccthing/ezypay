<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ezypay Subscription Services</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" /> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
</head>
<body>
<nav class="navbar navbar-default">
<div class="container-fluid">
<div class="navbar-header">
<a class="navbar-brand" href="#">Ezypay</a>
</div>
<ul class="nav navbar-nav">
<li class="active"><a href="<c:url value="/dashboard.do" />">Dashboard</a></li>
<li><a href="<c:url value="/createSubscription.do" />">Add Subscription</a></li>

</ul>
</div>
</nav>
<div style="width: 600px; margin: auto;">
<h3 align="center">
<b>Ezypay Subscription Services</b>
</h3>
<form:form class="form-horizontal" role="form" action="dashboard.do" modelAttribute="subscriptionModel">
<div class="form-group">
<h2>Welcome to Ezypay Subscription Services</h2>
</div>
</form:form>
</div>

</body>
</html>