<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/21/2024
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
    }

    .card-custom {
        border: none;
        border-radius: 1rem;
    }

    .card-header-custom {
        background-color: #343a40;
        color: white;
        border-top-left-radius: 1rem;
        border-top-right-radius: 1rem;
    }

    .card-body-custom {
        padding: 2rem;
    }

    .table-custom {
        margin-top: 1rem;
    }

    .table-custom th, .table-custom td {
        vertical-align: middle;
    }

    .table-custom thead th {
        background-color: #343a40;
        color: white;
    }
</style>
<body>
<div class="container my-5">
    <div class="row">
        <div class="col-12 text-center mb-5">
            <h1>Bảng Điều Khiển Doanh Thu Admin</h1>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header card-header-custom text-center">
                    <h5>Tổng Đơn Hàng</h5>
                </div>
                <div class="card-body card-body-custom text-center">
                    <h2 class="text-primary">${sumoder}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header card-header-custom text-center">
                    <h5>Tổng Doanh Thu</h5>
                </div>
                <div class="card-body card-body-custom text-center">
                    <h2 class="text-success">$<fmt:formatNumber value="${sumTotle}" pattern="#,##0 'đ'"/></h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header card-header-custom text-center">
                    <h5>Tổng Sản Phẩm</h5>
                </div>
                <div class="card-body card-body-custom text-center">
                    <h2 class="text-warning">${sumproduct}</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card card-custom">
                <div class="card-header card-header-custom">
                    <h5>Đơn Hàng Gần Đây</h5>
                </div>
                <div class="card-body card-body-custom">
                    <table class="table table-striped table-custom">
                        <thead>
                        <tr>
                            <th scope="col">Mã Đơn Hàng</th>
                            <th scope="col">Khách Hàng</th>
                            <th scope="col">Ngày</th>
                            <th scope="col">Tổng</th>
                            <th scope="col" class="text-center">Trạng Thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${top3oder}" var="t">
                            <tr>
                                <td>${t.id}</td>
                                <td>${t.user.fullname}</td>
                                <td>${t.createTime} / ${t.createDate}</td>
                                <td><fmt:formatNumber value="${t.priceTotal}" pattern="#,##0 'đ'"/></td>
                                <td class="text-center fw-bold ${t.status == "CHUA_XAC_NHAN" ? "text-danger":
                (t.status == "DA_XAC_NHAN" ? "text-warning":
                (t.status == "DANG_GIAO_HANG" ? "text-primary" :
                (t.status == "DA_GIAO_HANG" ? "text-success":
                (t.status == "DA_HUY" ?"text-secondary":"")))) }">
                                        ${t.status.description}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
