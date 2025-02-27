<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Management System</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
<div class="container-fluid">
<div class="navbar-header">
<a class="navbar-brand" href="#">Ezypay Subscription Services</a>
</div>
<ul class="nav navbar-nav">
<li class="active"><a href="<c:url value="/dashboard.do" />">Dashboard</a></li>
<li><a href="<c:url value="/createSubscription.do" />">Add Subscription</a></li>
</ul>
</div>
</nav>
<div style="width: 800px; margin: auto;">
<h3 align="center"><b>Create subscription</b></h3>
<form:form class="form-horizontal" role="form" action="viewSubscription.do" modelAttribute="subscriptionModel">
<div class="form-group">
<label class="control-label col-sm-3" for="name">Amount:</label>
<div class="col-sm-9">
<form:input path="amount" value="" type="number" class="form-control" placeholder="Amount"/>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-3" for="name">Subscription Type:</label>
<div class="col-sm-9">
<form:select path="subscriptionType" class="form-control id='subscriptionType' ">
  <option selected></option>
  <option value="1">Daily</option>
  <option value="2">Weekly</option>
  <option value="3">Monthly</option>
</form:select>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-3" for="startDate">Start Date :</label>
<div class="col-sm-5"> 
<div class='input-group date' id='startDate'>
    <form:input path="startDate" type='text' class="form-control" placeholder="DD/MM/YYY"/>
    <span class="input-group-addon">
        <span class="glyphicon glyphicon-calendar"></span>
    </span>
</div>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-3" for="endDate">End Date:</label>
<div class="col-sm-5"> 
<div class='input-group date' id='endDate'>
    <form:input path="endDate" type='text' class="form-control" placeholder="DD/MM/YYY"/>
    <span class="input-group-addon">
        <span class="glyphicon glyphicon-calendar"></span>
    </span>
</div>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-3" for="paymentDayOrWeek">Payment Day:</label>
<div class="col-sm-9"> 
<form:input path="paymentDayOrWeek" value="" type="text" class="form-control" id="paymentDayOrWeek"/>
</div>
</div>

<div class="form-group"> 
<div class="col-sm-offset-2 col-sm-10">
<button type="submit" class="btn btn-default">Submit</button>
</div>
</div>
</form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $("#startDate").datepicker({
        todayBtn:  1,
        autoclose: true,
        format: 'dd/mm/yyyy'
    }).on('changeDate', function (selected) {
        var minDate = new Date(selected.date.valueOf());
        var newDate = new Date(selected.date.valueOf());
        var threeMonth = new Date(newDate.setMonth(newDate.getMonth()+3));
        $('#endDate').datepicker('setDate', null);
        $('#endDate').datepicker('setStartDate', minDate);
        $('#endDate').datepicker('setEndDate', threeMonth);
        changePayment();
    });

    $("#endDate").datepicker({format: 'dd/mm/yyyy'})
        .on('changeDate', function (selected) {
            //var maxDate = new Date(selected.date.valueOf());
            //$('#startDate').datepicker('setEndDate', maxDate);
    });
    
    $('#subscriptionType').change(function(){
    	changePayment();
    });
    
    function changePayment(){
    	var weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    	
    	var selected = $('#subscriptionType option:selected').val();
        if(selected == '1'){
        	$("#paymentDayOrWeek").val("Daily");
        }else if(selected == '2'){
        	 var startDate = $("#startDate").datepicker("getDate");
        	 $("#paymentDayOrWeek").val(weekday[startDate.getDay()]);
        }else if(selected == '3'){
        	var startDate = $("#startDate").datepicker("getDate");
       	 	$("#paymentDayOrWeek").val(startDate.getDate());
        }
    }
});




</script>
</body>
</html>