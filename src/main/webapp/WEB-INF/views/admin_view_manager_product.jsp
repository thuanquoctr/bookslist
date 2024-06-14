<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/21/2024
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <h3 class="border border-0">Quản Lí Sản Phẩm</h3>
</div>
<div class="row">
    <div class="col-sm-5 col-xs-12"><a class="btn btn-danger my-5 px-4" href="/addproduct" role="button">Thêm Sản Phẩm
        Mới <i
                class="bi bi-plus-circle-dotted"></i></a></div>
</div>
<div class="row bg-light">
    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark text-center">
        <tr>
            <th scope="col">Ảnh</th>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Loại Sản Phẩm</th>
            <th scope="col">Giá Gốc</th>
            <th scope="col">Giá Bán</th>
            <th scope="col">Giảm Giá</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${listproduct}" var="item" varStatus="status">
            <tr>
                <th scope="row" class="text-center">
                    <img src="/images/${item.pictureMain}" style="width: 50px;height: 50px">
                </th>
                <td>${item.title}</td>
                <td>cate</td>
                <td>${item.list_price}</td>
                <td><fmt:formatNumber
                        value="${item.selling_price}"
                        pattern="#,##0 'đ'"/></td>
                <td class="text-center">gg</td>
                <td class="text-center ${item.quantity == 0 ? "text-danger fw-bold" : ""}">${item.quantity == 0 ?"Hết Hàng":item.quantity}</td>
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