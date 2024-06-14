<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row justify-content-center">
    <div class="col-md-10 mb-5">
        <div class="row justify-content-center my-4">
            <div class="col-md-6">
                <div class="row text-center">
                    <div class="col-md-5">
                        <h5><i class="bi bi-house-add-fill"></i> Trang Chủ</h5>
                    </div>
                    <div class="col-md-1">
                        <h5><i class="bi bi-arrow-right"></i></h5>
                    </div>
                    <div class="col-md-6">
                        <h5 class="text-danger fw-bold"><i class="bi bi-bag-dash-fill"></i> Lịch Sử Mua Hàng</h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row p-2 justify-content-center">
            <div class="col-md-10 bg-white p-3 border border-dark-subtle">
                <table class="table mt-1">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Đơn Hàng</th>
                        <th scope="col">Ngày Đặt Hàng</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Thao Tác</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach items="${my_list_oder}" var="item" varStatus="status">
                        <tr>
                            <th scope="row">${status.index + 1}</th>
                            <th class="fw-semibold">${item.code_oder}</th>
                            <th class="fw-semibold">${item.createTime} / ${item.createDate}</th>
                            <th class="fw-semibold ${item.status == "CHUA_XAC_NHAN" ? "text-danger":
                                                    (item.status == "DA_XAC_NHAN" ? "text-warning":
                                                    (item.status == "DANG_GIAO_HANG" ? "text-primary" :
                                                    (item.status == "DA_GIAO_HANG" ? "text-success":
                                                    (item.status == "DA_HUY" ?"text-secondary":"")))) }">
                                    ${item.status.description}</th>
                            <th>
                                <!-- Nút mở Modal -->
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#modal${status.index}">
                                    Chi Tiết
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="modal${status.index}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <!-- Tiêu đề Modal -->
                                            <div class="modal-header">
                                                <h5 class="modal-title fw-bold text-danger" id="exampleModalLabel">Chi
                                                    Tiết Đơn Hàng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <!-- Nội dung Modal -->
                                            <div class="modal-body" style="font-weight: normal">
                                                <div class="row">
                                                    <p><span class="fw-bold">Mã Đơn Hàng: </span> ${item.code_oder}</p>
                                                    <p><span class="fw-bold">Ngày Đặt Hàng: </span> ${item.createDate}
                                                    </p>
                                                    <p><span class="fw-bold">Vào Lúc: </span> ${item.createTime}</p>
                                                    <p><span class="fw-bold">Trạng Thái: </span>
                                                        <span class="text-primary">${item.status.description}</span>
                                                    </p>
                                                    <p><span
                                                            class="fw-bold">Tên Khách Hàng: </span> ${item.receiver_name}
                                                    </p>
                                                    <p><span class="fw-bold">Email: </span> ${item.receiver_email}</p>
                                                    <p><span
                                                            class="fw-bold">Số Điện Thoại: </span> ${item.receiver_phone}
                                                    </p>
                                                    <p><span class="fw-bold">Ghi Chú: </span> ${item.receiver_note}</p>
                                                </div>
                                                <div class="row">
                                                    <h5 class="text-center text-danger">Giỏ Hàng</h5>
                                                    <table class="table mt-1">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">STT</th>
                                                            <th scope="col">Ảnh</th>
                                                            <th scope="col">Tên</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Số Lượng</th>
                                                            <th scope="col">Thành Tiền</th>
                                                            <th scope="col" class="text-center">Đánh Giá</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody class="align-middle">
                                                        <c:forEach items="${item.oderDetails}" var="detail"
                                                                   varStatus="detailStatus">
                                                            <tr>
                                                                <th scope="row">${detailStatus.index + 1}</th>
                                                                <td><img src="/images/${detail.book.pictureMain}"
                                                                         style="width: 50px;height: 50px"></td>
                                                                <td>${detail.book.title}</td>
                                                                <td><fmt:formatNumber
                                                                        value="${detail.book.selling_price}"
                                                                        pattern="#,##0 'đ'"/></td>
                                                                <td>${detail.quantity}</td>
                                                                <td><fmt:formatNumber
                                                                        value="${detail.book.selling_price * detail.quantity}"
                                                                        pattern="#,##0 'đ'"/></td>
                                                                <td class="text-center">
                                                                    <a class="btn btn-danger"
                                                                       href="/reviewById/${detail.book.id}"
                                                                       role="button">Đánh
                                                                        Giá</a>
                                                                    <c:choose>
                                                                        <c:when test="${detail.book.checkreview(detail.oder.user.id)}">
                                                                            <p class="text-warning">Đánh giá ngay và
                                                                                nhận 200
                                                                                xu</p>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <h4>Tổng Tiền: <b><fmt:formatNumber value="${item.priceTotal}"
                                                                                        pattern="#,##0 'đ'"/></b></h4>
                                                </div>
                                            </div>
                                            <!-- Chân Modal -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
