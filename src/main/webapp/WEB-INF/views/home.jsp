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
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css"
        rel="stylesheet"
/>
<style>
    <%@include file="css/style.css"%>
</style>
<body class="container-fluid">
<%@ include file="header.jsp" %>
<div class="row">
    <%@ include file="menu.jsp" %>
</div>
<main>
    <jsp:include page="${page}"/>
    <input type="hidden" id="myicon" value="${icon}"/>
    <input type="hidden" id="mytitle" value="${title}"/>
    <input type="hidden" id="mymessage" value="${message}"/>
</main>
<footer class="row">
    <%@ include file="footer.jsp" %>
</footer>

<script src="https://kit.fontawesome.com/1a00e887fc.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <%@ include file="js/app.js" %>
</script>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"
></script>
<script type="module">
    import {Input, initMDB} from "mdb-ui-kit";

    document.addEventListener("DOMContentLoaded", () => {
        initMDB({Input});
    });
</script>
</body>
</html>
