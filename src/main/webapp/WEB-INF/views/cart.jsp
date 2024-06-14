<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/16/2024
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row justify-content-center">
    <div class="col-md-10 mb-5">
        <div class="row justify-content-center my-4">
            <div class="col-md-6">
                <div class="row text-center">
                    <div class="col-md-3">
                        <h5><i class="bi bi-house-add-fill"></i> Trang Chủ</h5>
                    </div>
                    <div class="col-md-1">
                        <h5><i class="bi bi-arrow-right"></i></h5>
                    </div>
                    <div class="col-md-4">
                        <h5 class="text-danger fw-bold"><i class="bi bi-bag-dash-fill"></i> Giỏ Hàng</h5>
                    </div>
                    <div class="col-md-1">
                        <h5><i class="bi bi-arrow-right"></i></h5>
                    </div>
                    <div class="col-md-3">
                        <h5><i class="bi bi-bag-check-fill"></i> Đặt Hàng</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row p-2" style="border-radius: 5%">
            <div class="col-md-8 bg-white p-3 border border-dark-subtle">
                <table class="table mt-1">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Ảnh</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Xóa</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach items="${my_cart}" var="item" varStatus="status">
                        <tr>
                            <th scope="row">${status.index +1}</th>
                            <td>
                                <img src="/images/${item.book.pictureMain}" style="width: 50px;height: 50px">
                            </td>
                            <td>${item.book.title}</td>
                            <td>
                                <form action="/update_quantity/${item.book.id}" method="post">
                                    <input name="qty" value="${item.quantity}" type="number" min="1" max="${item.book.quantity}"
                                           onblur="this.form.submit()"
                                           class="form-control mt-3" style="width: 80px;">
                                </form>
                            </td>
                            <td><fmt:formatNumber value="${item.book.selling_price * item.quantity}"
                                                  pattern="#,##0 'đ'"/></td>
                            <td>
                                <a href="/remove_cart/${item.book.id}"><i class="bi bi-x fs-2"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${count_cart > 0}">
                        <div class="row mb-3">
                            <a style="text-decoration: none" href="/clear_cart">
                                <input type="button" class="form-control text-danger fw-bold" value="Xóa Hết Giỏ Hàng">
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row mb-3">
                            <h4 class="text-center my-4">Giỏ Hàng Trống <i class="bi bi-info-square text-danger"></i>
                            </h4>
                        </div>
                    </c:otherwise>
                </c:choose>
                <p>
                    <a class="text-danger fw-bold" style="text-decoration: none ; color: black;font-weight: normal"
                       href="/index"><i class="bi bi-arrow-left"></i> Tiếp Tục Mua Sắm</a></p>
            </div>
            <div class="col-md-4 p-3 border border-dark-subtle">
                <h5 class="text-center">Đơn Hàng</h5>
                <hr>
                <div class="row">
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Tổng Tiền</p>
                        <p class="text-end fw-bold"><fmt:formatNumber value="${total_cart}" pattern="#,##0 'đ'"/>
                            VNĐ</p>

                    </div>
                </div>
                <div class="row mb-3">
                    <form action="/check_oder_completed">
                        <input type="submit" class="form-control text-white bg-danger fw-bold" value="THANH TOÁN">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

