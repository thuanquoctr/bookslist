<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/16/2024
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row justify-content-center">
    <div class="col-sm-5 col-xs-12">
        <h2 class="text-center">Đăng Nhập</h2>
        <p class="text-center text-danger">${messagenullusernameandpassword}</p>
        <form action="/loginuser" method="post">
            <div class="mb-3">
                <label class="form-label">Tài khoản</label>
                <input name="myusername" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input id="password-input" name="mypassword" type="password" class="form-control">
                    <button class="btn btn-outline-secondary" type="button" id="toggle-password">
                        <i class="far fa-eye" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="mb-3">
                <input type="submit" class="form-control bg-danger text-white" value="Đăng Nhập">
            </div>
            <div class="mb-3">
                <span>Bạn chưa có tài khoản ?</span><a class="text-danger" style="text-decoration: none;"
                                                       href="/signup">
                Đăng
                Ký
                Ngay</a>
            </div>
            <div class="mb-3">
                <a class="text-danger" style="text-decoration: none;" href="/forgotpassword">Quên Mật Khẩu</a>
            </div>
            <div class="mb-3">
                <p class="text-center fw-bold">Hoặc</p>
            </div>
            <div class="mb-3">
                <button style="width: 100%" type="button" class="btn btn-outline-primary bg-primary text-white fw-bold">
                    <i class="fa-brands fa-facebook"></i> Đăng Nhập Với FaceBook
                </button>
            </div>
            <div class="mb-3">
                <button style="width: 100%" type="button" class="btn btn-outline-secondary text-black fw-bold"><i
                        class="fa-brands fa-google"></i>
                    Đăng Nhập Với Google
                </button>
            </div>
        </form>
    </div>
</div>