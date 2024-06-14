<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/26/2024
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row justify-content-center">
    <div class="col-md-4">
        <div class="row">
            <h3 class="text-center my-3">Thêm Địa Chỉ</h3>
            <form:form action="/createAddress" method="post" modelAttribute="newAddress">
                <div class="mb-3">
                    <label class="form-label">Tên Người Nhận</label>
                    <form:input path="name" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số Điện Thoại</label>
                    <form:input path="phone" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tên Đường</label>
                    <form:input path="street" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Địa Chỉ</label>
                    <form:input path="city" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                    <input type="submit" class="form-control bg-danger text-white" value="Thêm"/>
                    <a style="text-decoration: none" href="/check_oder_completed">
                        Quay lại ?
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
