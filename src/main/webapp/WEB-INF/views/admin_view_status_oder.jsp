<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/29/2024
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <h3 class="border border-0 my-5">Quản Lí Đơn Hàng</h3>
</div>
<div class="row p-3 border border-dark-subtle">
    <div class="row">
        <div class="d-flex justify-content-between">
            <p class="fw-bold">
            <h4>Thông tin đơn hàng</h4> </p>
            <p class="text-end">
            <p class="mt-1"> ${status_oder_id.code_oder}</p>
            <br>
            <p class="p-1 ${status_oder_id.status == "CHUA_XAC_NHAN" ? "bg-danger":
                (status_oder_id.status == "DA_XAC_NHAN" ? "bg-warning":
                (status_oder_id.status == "DANG_GIAO_HANG" ? "bg-primary" :
                (status_oder_id.status == "DA_GIAO_HANG" ? "bg-success":
                (status_oder_id.status == "DA_HUY" ?"bg-secondary":"")))) } text-white fw-bold"
               style="border-radius: 15px">${status_oder_id.status.description}</p>
            </p>
        </div>
        <hr>
    </div>
    <div class="row">
        <div class="d-flex justify-content-between">
            <p>
                <b>Thông Tin Khách Hàng</b>
                <br>
                <b>Tên: </b> ${status_oder_id.receiver_name}
                <br>
                <b>Địa Chỉ: </b>${status_oder_id.receiver_address}
                <br>
                <b>Email: </b>${status_oder_id.receiver_email}
            </p>
            <p class="text-end">
                <b>Phương Thức Thanh Toán</b>
                <br>
                ${status_oder_id.payment_methods}
                <br>
                <b>Phương Thức Vận Chuyển</b>
                <br>
                ${status_oder_id.shipping_method}
                <br>
                <b>Ngày Đặt Hàng</b>
                <br>
                ${status_oder_id.createTime} ${status_oder_id.createDate}
            </p>
        </div>
    </div>
    <div class="row">
        <h4>Thay Đổi Trạng Thái Đơn Hàng</h4>
        <form action="/update_status_oder/${status_oder_id.id}" method="post">
            <select class="form-select" name="status_oderById" onchange="this.form.submit()"
                    aria-label="Default select example">
                <option ${status_oder_id.status == "CHUA_XAC_NHAN" ? "selected" : ""} value="1">Chưa xác nhận</option>
                <option ${status_oder_id.status == "DA_XAC_NHAN" ? "selected" : ""} value="2">Đã xác nhận, Đang chờ vận
                    chuyển
                </option>
                <option ${status_oder_id.status == "DANG_GIAO_HANG" ? "selected" : ""} value="3">Đang giao hàng</option>
                <option ${status_oder_id.status == "DA_GIAO_HANG" ? "selected" : ""} value="4">Đã giao hàng</option>
                <option ${status_oder_id.status == "DA_HUY" ? "selected" : ""} value="5">Đã hủy</option>
            </select>
        </form>

    </div>
    <div class="row my-5">
        <table class="table mt-1">
            <thead>
            <tr>
                <th scope="col">Ảnh</th>
                <th scope="col">Tên</th>
                <th scope="col">Giá</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Thành Tiền</th>
            </tr>
            </thead>
            <tbody class="align-middle">
            <c:forEach items="${status_oder_id.oderDetails}" var="detail_oder"
                       varStatus="detailStatus">
                <tr>
                    <td><img src="/images/${detail_oder.book.pictureMain}"
                             style="width: 50px;height: 50px"></td>
                    <td>${detail_oder.book.title}</td>
                    <td class="text-danger"><fmt:formatNumber
                            value="${detail_oder.book.selling_price}"
                            pattern="#,##0 'đ'"/></td>
                    <td>${detail_oder.quantity}</td>
                    <td><fmt:formatNumber
                            value="${detail_oder.book.selling_price * detail_oder.quantity}"
                            pattern="#,##0 'đ'"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

