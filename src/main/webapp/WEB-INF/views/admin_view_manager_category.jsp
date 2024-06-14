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
    <h3 class="border border-0">Quản Lí Danh Mục</h3>
</div>
<div class="row">
    <div class="col-sm-5 col-xs-12"><a class="btn btn-danger my-5 px-4" onclick="addcategory()" role="button">Thêm Danh
        Mục Mới
        <i
                class="bi bi-plus-circle-dotted"></i></a></div>
</div>
<div class="row">
    <div class="col-sm-4 col-xs-12">
        <form action="/add_category" method="post" id="formaddcategory" style="display: none">
            <div class="mb-3">
                <label class="form-label fw-bold">Tên Danh Mục</label>
                <input name="mycategory" type="text" class="form-control">
            </div>
            <button type="submit" class="btn btn-danger">Thêm Danh Mục</button>
        </form>
    </div>
</div>
<div class="row bg-light">
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark text-center">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên Danh Mục</th>
            <th scope="col">Sản Phẩm</th>
            <th scope="col">Ngày Thêm</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${listcategory}" var="item" varStatus="status">
            <tr>
                <th scope="row" class="text-center">${status.index +1}</th>
                <td>${item.name}</td>
                <td class="text-center">sp</td>
                <td class="text-center">${item.createDate}</td>
                <td class="text-center">
                        <%--                    <a class="btn btn-primary" href="/edit_user/${item.id}" role="button"><i--%>
                        <%--                            class="bi bi-pencil-fill"></i></a>--%>
                    <a class="btn btn-danger" href="/delete_user/${item.id}" role="button"><i
                            class="bi bi-trash3-fill"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
