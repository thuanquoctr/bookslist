<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-2">
    <img style="max-width: 90%;"
         src="https://i0.wp.com/therumzzline.com/wp-content/uploads/2022/11/Asset-1.png?resize=1328%2C700&ssl=1" alt="">
</div>
<div class="col-sm-9 mt-4">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-5">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/index">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/category">Thể Loại</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/blog">Cá Nhân</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/contact">Liên Hệ</a>
                    </li>

                </ul>
                <ul class="navbar-nav fs-5">
                    <li class="nav-item me-3">
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                <% if (session.getAttribute("us") == null) { %>
                                <span><i class="bi bi-person fs-5"></i> Tài khoản</span>
                                <%} else {%>
                                <span><i><img style="width: 20px;height: 20px; border-radius: 50%"
                                              src="/images/${us.avatar != null?us.avatar:"avtnull.png"}"></i> ${us.fullname}</span>
                                <%}%>

                            </button>
                            <ul class="dropdown-menu">
                                <% if (session.getAttribute("us") == null) { %>
                                <li><a class="dropdown-item" href="/login">Đăng Nhập</a></li>
                                <li><a class="dropdown-item" href="/signup">Đăng Ký</a></li>
                                <%} else {%>
                                <li><a class="dropdown-item" href="/myinfoperson">Hồ Sơ Cá Nhân</a></li>
                                <li><a class="dropdown-item" href="/history_oder">Lịch Sử Mua Hàng</a></li>
                                <li><a class="dropdown-item" href="/logoutuser">Đăng Xuất</a></li>
                                <%}%>
                            </ul>
                        </div>
                    </li>
                    <% if (session.getAttribute("us") != null) { %>
                    <li class="nav-item me-3">
                        <div>
                            <a href="/heart">
                                <button type="button" class="btn btn-light position-relative bg-white"
                                >
                                    <i class="bi bi-suit-heart fs-5"></i>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${sizeheart}</span>
                                </button>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item me-3">
                        <div>
                            <a href="/cart">
                                <button type="button" class="btn btn-light position-relative bg-white"
                                >
                                    <i class="bi bi-bag fs-5"></i>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${count_cart}</span>
                                </button>
                            </a>
                        </div>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</div>