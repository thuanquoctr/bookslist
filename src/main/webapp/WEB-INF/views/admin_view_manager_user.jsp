<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/21/2024
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <h3 class="border border-0">Quản Lí Người Dùng</h3>
</div>
<div class="row">
    <div class="col-sm-5 col-xs-12"><a class="btn btn-danger my-5 px-4" href="#" role="button">Thêm Người Dùng Mới <i
            class="bi bi-plus-circle-dotted"></i></a></div>
</div>
<div class="row bg-light">
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark text-center">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Họ Và Tên</th>
            <th scope="col">Email</th>
            <th scope="col">Ngày Tạo</th>
            <th scope="col">Trạng Thái</th>
            <th scope="col">Quyền</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${listusers}" var="item" varStatus="status">
            <tr>
                <th scope="row" class="text-center">${status.index +1}</th>
                <td>${item.fullname}</td>
                <td>${item.email}</td>
                <td class="text-center">${item.createDate}</td>
                <td class="text-center">
                    <c:choose>
                        <c:when test="${item.enabled}">
                            <a class="btn btn-light" href="/updateenabled/${item.id}" role="button"><i
                                    class="bi bi-toggle-on fs-2 text-success"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-light" href="/updateenabled/${item.id}" role="button"><i
                                    class="bi bi-toggle-off fs-2 text-secondary"></i></a>
                        </c:otherwise>
                    </c:choose>

                </td>
                <td class="text-center">Khách Hàng</td>
                <td class="text-center">
                    <a class="btn btn-primary" href="/edit_user/${item.id}" role="button"><i
                            class="bi bi-pencil-fill"></i></a>
                    <a class="btn btn-danger" href="/delete_user/${item.id}" role="button"><i
                            class="bi bi-trash3-fill"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
