<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/16/2024
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Login ADM</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<body>
<div class="row justify-content-center mt-5">
    <div class="col-sm-5 col-xs-12">
        <h2 class="text-center">Đăng Nhập ADM</h2>
        <p class="text-center text-danger">${messagenullusernameandpassword_admin}</p>
        <form action="/loginadmin" method="post">
            <div class="mb-3">
                <label class="form-label">Tài khoản</label>
                <input name="username_admin" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input id="password-input" name="spassword_admin" type="password" class="form-control">
                    <button class="btn btn-outline-secondary" type="button" id="toggle-password">
                        <i class="far fa-eye" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="mb-3">
                <input type="submit" class="form-control bg-danger text-white" value="Đăng Nhập">
            </div>
        </form>
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
