<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/29/2024
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <h3 class="border border-0 my-5">Quản Lí Đơn Hàng</h3>
</div>
<div class="row bg-light">
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark text-center">
        <tr>
            <th>Mã Đơn Hàng</th>
            <th>Người Đặt</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${list_oder}" var="item" varStatus="status">
            <tr>
                <td>${item.code_oder}</td>
                <td>${item.receiver_name}</td>
                <td>${item.createDate} / ${item.createTime}</td>
                <td class="text-center fw-bold ${item.status == "CHUA_XAC_NHAN" ? "text-danger":
                (item.status == "DA_XAC_NHAN" ? "text-warning":
                (item.status == "DANG_GIAO_HANG" ? "text-primary" :
                (item.status == "DA_GIAO_HANG" ? "text-success":
                (item.status == "DA_HUY" ?"text-secondary":"")))) }">
                        ${item.status.description}
                </td>
                <td class="text-center"><a class="btn btn-danger" href="/status_oder/${item.id}" role="button">Xem</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>