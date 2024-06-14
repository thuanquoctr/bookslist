<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/26/2024
  Time: 1:09 PM
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
                        <h5><i class="bi bi-bag-dash-fill"></i> Giỏ Hàng</h5>
                    </div>
                    <div class="col-md-1">
                        <h5><i class="bi bi-arrow-right"></i></h5>
                    </div>
                    <div class="col-md-3">
                        <h5 class="text-danger fw-bold"><i class="bi bi-bag-check-fill"></i> Đặt Hàng</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row p-2" style="border-radius: 5%">
            <div class="col-md-8 bg-white p-3 border border-dark-subtle">
                <div class="row">
                    <h5 class="text-center">Địa Chỉ Giao Hàng</h5>
                </div>
                <div class="row">
                    <form id="my_form_oder" action="/save_oder" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-semibold"><i class="bi bi-info-circle"></i> Thông Tin Người Nhận
                                <span
                                        class="text-danger fw-bold">*</span></label>
                            <select class="form-select" name="address_id" aria-label="Default select example">
                                <option value="" selected>Chọn Địa Chỉ</option>
                                <c:forEach var="option" items="${listaddress}">
                                    <option value="${option.id}">Tên: ${option.name} , SĐT: ${option.phone} , Đường
                                        : ${option.street} , Địa Chỉ: ${option.city}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <a class="btn btn-light text-danger my-2 fw-bold" href="/add_address" role="button">Thêm Địa
                                Chỉ
                                Khác <i class="bi bi-plus-circle"></i></a>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold"><i class="bi bi-card-checklist"></i> Ghi Chú Đơn Hàng</label>
                            <textarea class="form-control" name="receiver_note"
                                      placeholder="Nhập ghi chú..."></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold"><i class="bi bi-cash-stack"></i> Phương Thức Thanh
                                Toán <span
                                        class="text-danger fw-bold">*</span></label>
                            <select class="form-select" name="payment_methods" aria-label="Default select example">
                                <option value="" selected>Vui lòng chọn...</option>
                                <option value="TTKNH">Thanh Toán Khi Nhận Hàng</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold"><i class="bi bi-truck"></i> Phương Thức Vận Chuyển
                                <span
                                        class="text-danger fw-bold">*</span></label>
                            <select class="form-select" name="shipping_method" aria-label="Default select example">
                                <option value="" selected>Vui lòng chọn...</option>
                                <option value="GHN">Giao Hàng Nhanh</option>
                                <option value="GHTK">Giao Hàng Tiết Kiệm</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4 p-3 border border-dark-subtle">
                <h5 class="text-center">Đơn Hàng</h5>
                <hr>
                <div class="row">
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold"> Tạm tính</p>
                        <p class="text-end fw-bold"><fmt:formatNumber value="${total}"
                                                                      pattern="#,##0 'đ'"/> VNĐ</p>
                    </div>
                </div>
                <div class="row">
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold"><i class="bi bi-coin text-warning fs-4"></i> ${(coin*1000).intValue()}</p>
                        <p>
                            <c:choose>
                                <c:when test="${useCoin}">
                                    <a href="/offCoin"><i class="bi bi-toggle-on fs-2 text-success"></i></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/onCoin"><i class="bi bi-toggle-off fs-2 text-secondary"></i></a>
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold"><i class="bi bi-cash-stack fs-4"></i> Tổng Số Tiền</p>
                        <p class="text-end fw-bold"><fmt:formatNumber value="${total_cart}"
                                                                      pattern="#,##0 'đ'"/> VNĐ</p>
                    </div>
                </div>
                <div class="row mb-3">
                    <input onclick="document.getElementById('my_form_oder').submit()" type="button"
                           class="form-control text-white bg-danger fw-bold"
                           value="Hoàn Tất Đơn Hàng">
                </div>
            </div>
        </div>
        <div class="row">
            <table class="table mt-1">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Ảnh</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Thành Tiền</th>
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
                        <td><fmt:formatNumber value="${item.book.selling_price}" pattern="#,##0 'đ'"/></td>
                        <td>${item.quantity}</td>
                        <td><fmt:formatNumber value="${item.book.selling_price * item.quantity}"
                                              pattern="#,##0 'đ'"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <p>
            <a class="text-danger fw-bold" style="text-decoration: none ; color: black;font-weight: normal"
               href="/cart"><i class="bi bi-arrow-left"></i> Giỏ Hàng Của Bạn</a></p>
    </div>
</div>

