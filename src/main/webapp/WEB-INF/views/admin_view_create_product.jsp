<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/22/2024
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
    <h3 class="border border-0 my-4">Thêm Sản Phẩm Mới</h3>
</div>
<form:form action="/createBook" method="post" modelAttribute="newBook" enctype="multipart/form-data">
    <div class="row">
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Tên Sản Phẩm</label>
            <form:input path="title" type="text" class="form-control"/>
        </div>
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Loại Sản Phẩm</label>
            <form:select path="category" class="form-select">
                <form:option value="">Chọn Loại Sản Phẩm</form:option>
                <form:options items="${categories}" itemValue="id" itemLabel="name"/>
            </form:select>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Giá</label>
            <form:input path="list_price" type="number" class="form-control"/>
        </div>
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Giảm Giá (%)</label>
            <form:input path="discount" type="number" class="form-control"/>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4 col-xs-12 mb-3">
            <label class="form-label">Nhà Xuất Bản</label>
            <form:input path="publishing_company" type="text" class="form-control"/>
        </div>
        <div class="col-sm-4 col-xs-12 mb-3">
            <label class="form-label">Nhà Phát Hành</label>
            <form:input path="publisher" type="text" class="form-control"/>
        </div>
        <div class="col-sm-4 col-xs-12 mb-3">
            <label class="form-label">Ảnh Đại Diện</label>
            <br>
            <input type="file" id="fileInput" name="fileproduct" style="display: none;"
                   onchange="handleFileSelect()">
            <p type="button" class="btn btn-light text-danger border-danger" id="selectButton"
               onclick="document.getElementById('fileInput').click();">
                Tải ảnh lên
            </p>
            <button type="button" class="btn btn-light text-success pt-0 border-success"
                    onclick="document.getElementById('fileInput').click();"
                    id="uploadButton" style="display: none;">
                Đã thêm một ảnh<i class="bi bi-check2-all fs-3 text-success"></i>
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Số Lượng</label>
            <form:input path="quantity" type="number" class="form-control"/>
        </div>
        <div class="col-sm-6 col-xs-12 mb-3">
            <label class="form-label">Tác Giả</label>
            <form:select path="author" class="form-select">
                <form:option value="">Chọn Loại Sản Phẩm</form:option>
                <form:options items="${authors}" itemValue="id" itemLabel="name"/>
            </form:select>
        </div>
    </div>
    <div class="row">
        <label class="form-label">Mô Tả Sản Phẩm</label>
        <form:textarea path="description" class="form-control mb-2" rows="2"/>
    </div>
    <div class="row">
        <div class="col-sm-3 col-xs-12 mb-3">
            <input type="submit" class="form-control bg-danger text-white" value="Thêm"/>
        </div>
        <div class="col-sm-2 col-xs-12 mb-3">
            <a href="/manager_product">
                <button type="button" class="btn btn-secondary">Hủy</button>
            </a>
        </div>
    </div>
</form:form>

