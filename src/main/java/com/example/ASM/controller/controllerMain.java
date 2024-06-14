package com.example.ASM.controller;


import com.example.ASM.entity.address;
import com.example.ASM.entity.author;
import com.example.ASM.entity.book;
import com.example.ASM.entity.user;
import com.example.ASM.service.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Comparator;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class controllerMain {

    private HttpServletRequest request;
    private userService userService;
    private categoryService catService;
    private authorService authService;
    private bookService bookService;
    private sessionService sessionService;
    private cartService cartService;
    private addressService addrService;
    private oderService oderService;

    @Autowired
    public controllerMain(
            HttpServletRequest request,
            userService userService,
            categoryService catService,
            authorService authService,
            bookService bookService,
            sessionService sessionService,
            cartService cartService,
            addressService addrService,
            oderService oderService) {
        this.request = request;
        this.userService = userService;
        this.catService = catService;
        this.authService = authService;
        this.bookService = bookService;
        this.sessionService = sessionService;
        this.cartService = cartService;
        this.addrService = addrService;
        this.oderService = oderService;
    }

    @GetMapping({"/index", "/login", "/signup", "/heart", "/cart", "/category", "/blog", "/contact", "/forgotpassword", "/myinfoperson", "/oder_completed", "/add_address", "/history_oder", "/product_detail", "/review_detail"})
    public String indexUser(Model model, RedirectAttributes redirectAttributes, @RequestParam(name = "page", defaultValue = "1") int pageNumber, @RequestParam(name = "valuefilter", defaultValue = "1") int valuefilter) {
        sessionService.set("valuefilter", valuefilter);
        String uri = request.getRequestURI();
        user user_checklogin = sessionService.get("us");
        if (user_checklogin != null) {
            model.addAttribute("count_cart", cartService.getCount(user_checklogin.getId()));
            model.addAttribute("sizeheart", userService.getById(user_checklogin.getId()).getHeart().getBooks().size());
        }
        if (uri.equals("/login")) {
            model.addAttribute("page", "login.jsp");
            return "home";
        } else if (uri.equals("/signup")) {
            user usernew = new user();
            model.addAttribute("newuser", usernew);
            model.addAttribute("page", "signup.jsp");

            return "home";
        } else if (uri.equals("/heart")) {
            if (user_checklogin != null) {
                model.addAttribute("listheart", userService.getById(user_checklogin.getId()).getHeart().getBooks());
            } else {
                return "redirect:/login";
            }
            model.addAttribute("page", "heart.jsp");
            return "home";
        } else if (uri.equals("/cart")) {
            if (user_checklogin != null) {
                model.addAttribute("my_cart", cartService.getItems(user_checklogin.getId()));
                model.addAttribute("total_cart", cartService.getAmount(user_checklogin.getId()));
            } else {
                return "redirect:/login";
            }
            model.addAttribute("page", "cart.jsp");
            return "home";
        } else if (uri.equals("/category")) {
            model.addAttribute("page", "category.jsp");
            return "home";
        } else if (uri.equals("/blog")) {
            model.addAttribute("page", "blog.jsp");
            return "home";
        } else if (uri.equals("/contact")) {
            model.addAttribute("page", "contact.jsp");
            return "home";
        } else if (uri.equals("/forgotpassword")) {
            if (user_checklogin == null) {
                return "redirect:/login";
            }
            model.addAttribute("page", "forgotPassword.jsp");
            return "home";
        } else if (uri.equals("/myinfoperson")) {
            if (user_checklogin == null) {
                return "redirect:/login";
            }
            model.addAttribute("page", "infoperson.jsp");
            return "home";
        } else if (uri.equals("/oder_completed")) {
            if (user_checklogin != null) {
                model.addAttribute("coin", (userService.getById(user_checklogin.getId()).getCoin()));
                model.addAttribute("listaddress", addrService.findByUserId(user_checklogin.getId()));
                model.addAttribute("my_cart", cartService.getItems(user_checklogin.getId()));
                sessionService.set("useCoin", false);
                sessionService.set("total", cartService.getAmount(user_checklogin.getId()));
                sessionService.set("total_cart", cartService.getAmount(user_checklogin.getId()));
            } else {
                return "redirect:/login";
            }
            model.addAttribute("page", "oder.jsp");
            return "home";
        } else if (uri.equals("/add_address")) {
            model.addAttribute("newAddress", new address());
            model.addAttribute("page", "create_address.jsp");
            return "home";
        } else if (uri.equals("/history_oder")) {
            if (user_checklogin != null) {
                model.addAttribute("my_list_oder", oderService.findByUserId(user_checklogin.getId()));
            } else {
                return "redirect:/login";
            }
            model.addAttribute("page", "oder_history.jsp");
            return "home";
        } else if (uri.equals("/product_detail")) {
            model.addAttribute("page", "product_detail.jsp");
            return "home";
        } else if (uri.equals("/review_detail")) {
            if (user_checklogin == null) {
                return "redirect:/login";
            }
            model.addAttribute("page", "review_detailById.jsp");
            return "home";
        }
        int pageSize = 12;
        valuefilter = sessionService.get("valuefilter");
        System.out.println("kakaakaka:" + valuefilter);
        if (valuefilter == 1) {
            Page<book> bookPage = bookService.getBooksByPageAtoZ(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        } else if (valuefilter == 2) {
            Page<book> bookPage = bookService.getBooksByPagePriceUp(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        } else if (valuefilter == 3) {
            Page<book> bookPage = bookService.getBooksByPagePriceDown(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        } else if (valuefilter == 4) {
            Page<book> bookPage = bookService.getBooksByPageQuantitySold(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        } else if (valuefilter == 5) {
            Page<book> bookPage = bookService.getBooksByPageView(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        } else if (valuefilter == 6) {
            Page<book> bookPage = bookService.getBooksByPageReview(pageNumber, pageSize);
            model.addAttribute("listcard", bookPage.getContent());
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", bookPage.getTotalPages());
        }


        model.addAttribute("page", "product.jsp");
        return "home";
    }

    @GetMapping({"/admin_index", "/login_admin", "/index_admin", "/manager_user", "/edituser", "/manager_category", "/manager_product", "/addproduct", "/manager_author", "/manager_order", "/manager_discount", "/manager_statistic", "/status_oder"})
    public String indexAdmin(Model model) {
        String uri = request.getRequestURI();
        user admin_checklogin = sessionService.get("adm");
        if (uri.equals("/login_admin")) {
            return "admin_view_login";
        } else if (uri.equals("/index_admin")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("page_admin", "admin_view_index.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_user")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("listusers", userService.getAllAdminFalse());
            model.addAttribute("page_admin", "admin_view_manager_user.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/edituser")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("page_admin", "admin_view_infoperson.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_category")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("listcategory", catService.getAllcategory());
            model.addAttribute("page_admin", "admin_view_manager_category.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_product")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("listproduct", bookService.getAllBooks());
            model.addAttribute("page_admin", "admin_view_manager_product.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/addproduct")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("newBook", new book());
            model.addAttribute("categories", catService.getAllcategory());
            model.addAttribute("authors", authService.findAll());
            model.addAttribute("page_admin", "admin_view_create_product.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_author")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("newauthor", new author());
            model.addAttribute("listauthor", authService.findAll());
            model.addAttribute("page_admin", "admin_view_manager_author.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_order")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("list_oder", oderService.findAll());
            model.addAttribute("page_admin", "admin_view_manager_oder.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_discount")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("page_admin", "admin_view_manager_discount.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/manager_statistic")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("page_admin", "admin_view_manager_statistic.jsp");
            return "admin_view_home_admin";
        } else if (uri.equals("/status_oder")) {
            if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
                return "admin_view_login";
            }
            model.addAttribute("page_admin", "admin_view_status_oder.jsp");
            return "admin_view_home_admin";
        }
        if (admin_checklogin == null || !admin_checklogin.isAdmin()) {
            return "admin_view_login";
        }
        model.addAttribute("sumoder", oderService.getcount());
        model.addAttribute("sumTotle", oderService.getSum());
        model.addAttribute("sumproduct", bookService.getCountBook());
        model.addAttribute("top3oder", oderService.findTop3ByOrderByCreateDateDesc());
        model.addAttribute("page_admin", "admin_view_index.jsp");
        return "admin_view_home_admin";
    }
}
