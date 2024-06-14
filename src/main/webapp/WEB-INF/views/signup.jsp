<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row justify-content-center">
    <div class="col-sm-5 col-xs-12">
        <h2 class="text-center">Đăng Ký</h2>
        <form:form action="/createUser" method="post" modelAttribute="newuser">
            <div class="mb-3">
                <label class="form-label">Họ và Tên</label>
                <form:input path="fullname" type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <form:input path="email" type="email" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Tài khoản</label>
                <form:input path="username" type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <form:password path="password" id="password-input" class="form-control"/>
                    <button class="btn btn-outline-secondary" type="button" id="toggle-password">
                        <i class="far fa-eye" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
<%--            <div class="mb-3">--%>
<%--                <label class="form-label">Nhập lại mật khẩu</label>--%>
<%--                <div class="input-group">--%>
<%--                    <form:password path="confirmPassword" id="password-input1" class="form-control"/>--%>
<%--                    <button class="btn btn-outline-secondary" type="button" id="toggle-password1">--%>
<%--                        <i class="far fa-eye" aria-hidden="true"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="mb-3">
                <input type="submit" class="form-control bg-danger text-white" value="Đăng Ký"/>
            </div>
            <div class="mb-3">
                <span>Bạn đã có tài khoản ?</span><a class="text-danger" style="text-decoration: none;" href="/login">
                Đăng Nhập Ngay</a>
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
                <button style="width: 100%" type="button" class="btn btn-outline-secondary text-black fw-bold">
                    <i class="fa-brands fa-google"></i> Đăng Nhập Với Google
                </button>
            </div>
        </form:form>

    </div>
</div>