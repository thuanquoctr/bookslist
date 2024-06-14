<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/17/2024
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row justify-content-center">
    <div class="col-sm-10">
        <div class="row">
            <div class="col-sm-4 col-xs-12 text-center">
                <p class="fw-bold">Chỉnh Sữa Thông Tin</p>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="bg-white border border-dark-subtle py-4" style="max-width:100%">
                            <img style="max-width: 70%; border-radius: 50%"
                                 src="/images/${useredit.avatar != null?useredit.avatar:"avtnull.png"}">
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
                        </form>
                    </div>

                </div>

            </div>
            <div class="col-sm-8 col-xs-12">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Họ và Tên</label>
                        <input type="text" value="${useredit.fullname}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" value="${useredit.email}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tài khoản</label>
                        <input type="text" value="${useredit.username}" class="form-control">
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

