<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/16/2024
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/16/2024
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row justify-content-center">
    <div class="col-md-10">
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
                        <h5 class="text-danger fw-bold"><i class="bi bi-bag-dash-fill"></i> Danh Sách Yêu Thích</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <c:choose>
                <c:when test="${sizeheart > 0}">
                    <c:forEach items="${listheart}" var="item" varStatus="status">
                        <div class="col-md-2 d-flex flex-column mt-2">
                            <div class="card h-100">
                                <a href="/view_product_detail/${item.id}">
                                    <img src="/images/${item.pictureMain}" class="card-img-top image-hover" alt="..."
                                         style="height: 150px; object-fit: cover;">
                                </a>
                                <div class="card-body d-flex flex-column">
                                    <h6 class="card-title fixed-height-title">${item.title}</h6>
                                    <div class="mb-2">
                                        <p class="card-text mb-1 fw-bold"><fmt:formatNumber value="${item.list_price}"
                                                                                            pattern="#,##0 'đ'"/>
                                        </p>
                                        <p class="card-text mb-1"><s class="card-text mb-1">
                                            <fmt:formatNumber value="${item.selling_price}" pattern="#,##0 'đ'"/>
                                        </s>
                                        </p>

                                    </div>
                                    <div class="discount-percentage mb-3">10%</div>
                                    <div class="mt-auto d-flex justify-content-center">
                                        <a href="/addcart/${item.id}/heart" class="btn btn-primary icon-hover mx-1"><i
                                                class="bi bi-bag"></i></a>
                                        <a href="/remove_heart/${item.id}" class="btn btn-primary icon-hover mx-1"><i
                                                class="bi bi-trash"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="mb-3">
                        <h4 class="text-center my-4">Yêu Thích Trống <i class="bi bi-info-square text-danger"></i>
                        </h4>
                    </div>
                </c:otherwise>
            </c:choose>


        </div>
    </div>
</div>
