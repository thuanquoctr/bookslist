<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/04/2024
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row mb-5">
    <h4 class="text-center text-danger">Đánh giá sản phẩm</h4>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <c:if test="${not empty reviewById}">
                <table class="table mt-1">
                    <thead>
                    <tr>
                        <th scope="col">Ảnh</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Giá</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <tr>
                        <td>
                            <img src="/images/${reviewById.pictureMain}" style="width: 50px;height: 50px">
                        </td>
                        <td>${reviewById.title}</td>
                        <td><fmt:formatNumber value="${reviewById.selling_price}" pattern="#,##0 'đ'"/></td>
                    </tr>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h5 class="text-center text-primary">Viết Đánh Giá</h5>
            <form action="/insertReview/${reviewById.id}" method="post">
                <div class="mb-3">
                    <label class="form-label">Đánh giá <i class="bi bi-star-fill text-warning"></i></label>
                    <select class="form-select" name="star" required>
                        <option value="1">1 - Rất tệ</option>
                        <option value="2">2 - Tệ</option>
                        <option value="3">3 - Trung bình</option>
                        <option value="4">4 - Tốt</option>
                        <option selected value="5">5 - Rất tốt</option>
                    </select>
                </div>
                <div class="form-floating">
                    <textarea name="content" class="form-control" placeholder="Leave a comment here"
                              id="floatingTextarea"></textarea>
                    <label for="floatingTextarea">Nội Dung Đánh Giá</label>
                </div>
                <button type="submit" class="btn btn-primary mt-2">Đánh Giá</button>
            </form>
        </div>

    </div>
</div>

