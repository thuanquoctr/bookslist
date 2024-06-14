<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    <%@include file="css/style.css"%>
</style>
<body class="container-fluid">
<div class="row">
    <div class="col-md-3 col-xs-12">
        <%@ include file="admin_view_menu.jsp" %>
    </div>
    <div class="col-md-9 col-xs-12 px-5 border-start">
        <jsp:include page="${page_admin}"/>
    </div>
</div>
<input type="hidden" id="myicon" value="${icon}"/>
<input type="hidden" id="mytitle" value="${title}"/>
<input type="hidden" id="mymessage" value="${message}"/>
<script src="https://kit.fontawesome.com/1a00e887fc.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <%@ include file="js/app.js" %>
</script>
</body>
</html>
