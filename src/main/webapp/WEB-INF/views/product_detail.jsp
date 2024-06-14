<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/03/2024
  Time: 6:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row justify-content-center pb-5">
    <div class="col-md-8">
        <div class="row justify-content-center my-4">
            <div class="col-md-8">
                <div class="row text-center">
                    <div class="col-md-5">
                        <h5><i class="bi bi-house-add-fill"></i> Trang Chủ</h5>
                    </div>
                    <div class="col-md-2">
                        <h5><i class="bi bi-arrow-right"></i></h5>
                    </div>
                    <div class="col-md-5">
                        <h5 class="text-danger fw-bold"><i class="bi bi-bag-check-fill"></i> Chi Tiết Đơn Hàng</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-5">
            <div class="col-md-6 text-danger">
                <img src="/images/${productDetailById.pictureMain}" class="card-img-top" alt="..."
                     style="height: 320px; object-fit: cover;"
                >
            </div>
            <div class="col-md-6">
                <h4 class="my-3">${productDetailById.title}</h4>
                <hr>
                <p>Đánh giá:
                    <c:choose>
                        <c:when test="${productDetailById.getAvgStar() == 0}">
                            <b>Chưa có đánh giá</b>
                        </c:when>
                        <c:otherwise>
                            <c:set var="starAvg" value="${productDetailById.getAvgStar()}"/>
                            <c:set var="starfull" value="${starAvg.intValue()}"/>
                            <c:set var="starrounding" value="${starAvg - starAvg.intValue() >= 0.5 ? 1 : 0}"/>
                            <c:set var="starnull" value="${5 - starfull - starrounding}"/>

                            <c:forEach var="i" begin="1" end="${starfull}">
                                <i class="bi bi-star-fill text-warning"></i>
                            </c:forEach>

                            <c:if test="${starrounding == 1}">
                                <i class="bi bi-star-half text-warning"></i>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${starnull}">
                                <i class="bi bi-star text-warning"></i>
                            </c:forEach>
                            <b>${starAvg} / 5</b>
                        </c:otherwise>
                    </c:choose>
                </p>
                <p>Đã Bán : <b>${productDetailById.quantitySold}</b></p>
                <p class="card-text mb-1 fw-bold">Giá hiện tại : <fmt:formatNumber
                        value="${productDetailById.selling_price}"
                        pattern="#,##0 'đ'"/>
                </p>
                <p class="card-text mb-1">Giá gốc : <s><fmt:formatNumber value="${productDetailById.list_price}"
                                                                         pattern="#,##0 'đ'"/></s>
                </p>
                <hr>
                <c:choose>
                    <c:when test="${productDetailById.quantity > 0}">
                        <p>Còn Hàng <i class="bi bi-check-circle-fill text-success"></i></p>
                    </c:when>
                    <c:otherwise>
                        <p>Hết Hàng <i class="bi bi-dash-circle-fill text-danger"></i></p>
                    </c:otherwise>
                </c:choose>
                <p>Số Lượt Xem Qua : ${productDetailById.view}</p>
                <a class="btn btn-outline-danger" href="/add_heart/${productDetailById.id}/product_detail">
                    <i class="bi bi-suit-heart fs-5"></i>
                    Yêu
                    Thích
                </a>
                <a class="btn btn-outline-danger bg-danger text-white"
                   href="/addcart/${productDetailById.id}/product_detail">
                    <i class="bi bi-bag fs-5"></i> Thêm Vào Giỏ Hàng
                </a>
                <p class="my-3">
                    <a class="text-primary fw-bold" style="text-decoration: none ; color: black;font-weight: normal"
                       href="/index"><i class="bi bi-arrow-left"></i> Quay Lại Trang Chủ ?</a></p>
            </div>
        </div>
        <div class="row">
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button text-danger fw-bold" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Mô Tả Sản Phẩm
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>${productDetailById.description}</p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed text-danger fw-bold" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Đánh Giá Từ Khách Hàng
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="row">
                                <table class="table mt-1">
                                    <thead>
                                    <c:choose>
                                        <c:when test="${productDetailById.review_books.size() != 0}">
                                            <tr>
                                                <th scope="col">Người Đánh Giá</th>
                                                <th scope="col">Đánh Giá</th>
                                                <th scope="col">Nội Dung</th>
                                                <th scope="col">Vào Lúc</th>
                                            </tr>
                                        </c:when>
                                    </c:choose>
                                    </thead>
                                    <tbody class="align-middle">
                                    <c:choose>
                                        <c:when test="${productDetailById.review_books.size() != 0}">
                                            <c:forEach items="${productDetailById.review_books}" var="it">
                                                <tr>
                                                    <td>${it.user.fullname}</td>
                                                    <td>${it.star==1?"<i class='bi bi-star-fill text-warning'></i>":
                                                            (it.star==2?
                                                                    "<i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i>":
                                                                    (it.star==3?"<i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i>":
                                                                            (it.star==4?"<i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i>":
                                                                                    "<i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i><i class='bi bi-star-fill text-warning'></i>")))}
                                                    </td>
                                                    <td>${it.content == "" ? "Không viết gì" : it.content}</td>
                                                    <td>${it.createTime} / ${it.createDate}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Không có lượt đánh giá nào</p>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>