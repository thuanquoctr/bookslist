<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/17/2024
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row justify-content-center">
    <div class="col-sm-8">
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
                        <h5 class="text-danger fw-bold"><i class="bi bi-file-earmark-person"></i> Hồ Sơ Cá Nhân</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4 col-xs-12 text-center">
                <p class="fw-bold">Thông tin cá nhân</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="bg-white border border-dark-subtle py-4" style="max-width: 100%; overflow: hidden;">
                            <img style="max-width: 70%; max-height: 200px; border-radius: 50%;"
                                 src="/images/${us.avatar != null ? us.avatar : 'avtnull.png'}">
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <form action="/upload" method="post" enctype="multipart/form-data">
                            <input type="file" id="fileInput" name="file" style="display: none;"
                                   onchange="handleFileSelect()">
                            <button type="button" class="btn btn-danger mt-2" id="selectButton"
                                    onclick="document.getElementById('fileInput').click();">
                                Chọn ảnh
                            </button>
                            <button type="submit" class="btn btn-danger mt-2" id="uploadButton" style="display: none;">
                                Hoàn Tất
                            </button>
                        </form>
                    </div>

                </div>

            </div>
            <div class="col-sm-8 col-xs-12">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Họ và Tên</label>
                        <input type="text" value="${us.fullname}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" value="${us.email}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tài khoản</label>
                        <input type="text" value="${us.username}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa Chỉ</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <input type="submit" class="form-control bg-danger text-white" value="Lưu Thay Đổi">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

