<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row" style="background-image: -webkit-linear-gradient(90deg, #f45622 0%, #f53e54 100%);">
    <div class="col-md-6 align-self-center">
        <div class="row justify-content-center">
            <div class="col-md-9 text-white">
                <h1 class="fw-bold">Biểu mẫu Trang đích đến Hoàn hảo để Trình bày Sách điện tử của Bạn</h1>
                <h5 class="mt-4">Thường xuyên, không có gì! Thậm chí còn giải thích rõ ràng những gì cần được ưa chuộng,
                    từ mọi nơi làm việc lao động tốt nhất, mọi người ở đâu đều phải làm những điều đó để làm cho cuộc
                    sống tốt nhất có thể.</h5>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <img style="max-height: 80%; margin-top: 10%;" src="/images/header-img.png" alt="">
    </div>
</div>
<div class="row">
    <h1 class="text-center my-2">Sản Phẩm Mới</h1>
</div>
<div class="row justify-content-center mb-5">
    <div class="col-md-10">
        <div class="row">
            <form action="/index" method="get">
                <select name="valuefilter" class="form-select w-auto" aria-label="Default select example"
                        onchange="this.form.submit()">
                    <option selected value="1">A-Z</option>
                    <option value="2">Giá (Tăng Dần)</option>
                    <option value="3">Giá (Giảm Dần)</option>
                    <option value="4">Lượt Bán</option>
                    <option value="5">Lượt Xem Sản Phẩm</option>
                    <option value="6">Lượt Đánh Giá</option>
                </select>
            </form>
        </div>
        <div class="row">
            <c:forEach items="${listcard}" var="item" varStatus="status">
                <div class="col-md-2 d-flex flex-column mt-2">
                    <div class="card h-100">
                        <a href="/view_product_detail/${item.id}">
                            <img src="/images/${item.pictureMain}" class="card-img-top image-hover" alt="..."
                                 style="height: 150px; object-fit: cover;">
                        </a>
                        <div class="card-body d-flex flex-column">
                            <h6 class="card-title" data-title="${item.title}"></h6>
                            <p>
                                <c:choose>
                                    <c:when test="${item.getAvgStar() != 0}">
                                        <c:set var="starAvg" value="${item.getAvgStar()}"/>
                                        <b>${starAvg} / 5 <i class="bi bi-star-fill text-warning"></i></b>
                                    </c:when>
                                    <c:otherwise>
                                        <b class="text-primary">Chưa Có</b>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <div>
                                <p class="card-text mb-1 fw-bold"><fmt:formatNumber value="${item.selling_price}"
                                                                                    pattern="#,##0 'đ'"/>
                                </p>
                                <p class="card-text mb-1"><s class="card-text mb-1">
                                    <fmt:formatNumber value="${item.list_price}" pattern="#,##0 'đ'"/>
                                </s>
                                </p>
                            </div>
                            <div class="discount-percentage mb-3">-${item.discount.intValue()}%</div>
                            <div class="mt-auto d-flex justify-content-center">
                                <a href="/addcart/${item.id}/product" class="btn btn-primary icon-hover mx-1">
                                    <i class="bi bi-bag"></i>
                                </a>
                                <a href="/add_heart/${item.id}/product" class="btn btn-primary icon-hover mx-1">
                                    <i class="bi bi-suit-heart"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row my-4">
            <div class="col-12 d-flex justify-content-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="btn btn-danger me-1" href="/index?page=${currentPage - 1}">Back</a>
                            </li>
                        </c:if>
                        <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${pageNumber eq currentPage}">
                                    <li class="page-item active">
                                        <a class="btn btn-secondary me-1">${pageNumber}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="btn btn-gray me-1" href="/index?page=${pageNumber}">${pageNumber}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="btn btn-danger" href="/index?page=${currentPage + 1}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>


    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll('.card-title').forEach(function (element) {
            let title = element.getAttribute('data-title');
            if (title.length > 10) {
                element.textContent = title.substring(0, 10) + '...';
            } else {
                element.textContent = title;
            }
        });
    });
</script>
