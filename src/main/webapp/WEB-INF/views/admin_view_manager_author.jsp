<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/21/2024
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
    <h3 class="border border-0">Quản Lí Tác Giả</h3>
</div>
<div class="row">
    <div class="col-sm-5 col-xs-12"><a class="btn btn-danger my-5 px-4" onclick="addauthor()" role="button">Thêm Tác Giả
        Mới
        <i
                class="bi bi-plus-circle-dotted"></i></a></div>
</div>
<div class="row">
    <div class="col-sm-4 col-xs-12">
        <form:form action="/addAuthor" method="post" id="formaddauthor" style="display: none"
                   modelAttribute="newauthor">
            <div class="mb-3">
                <label class="form-label fw-bold">Tên Tác Giả</label>
                <form:input path="name" type="text" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-danger">Thêm Tác Giả</button>
        </form:form>
    </div>
</div>
<div class="row bg-light">
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark text-center">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên Tác Giả</th>
            <th scope="col">Ngày Thêm</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${listauthor}" var="item" varStatus="status">
            <tr>
                <th scope="row" class="text-center">${status.index +1}</th>
                <td>${item.name}</td>
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
