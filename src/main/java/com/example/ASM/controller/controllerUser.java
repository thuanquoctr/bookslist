package com.example.ASM.controller;

import com.example.ASM.entity.*;
import com.example.ASM.repository.userRepository;
import com.example.ASM.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.ASM.repository.userRepository;

import java.io.File;
import java.util.*;

@Controller
public class controllerUser {
    @Autowired
    private userRepository userRepository;
    private userService userService;
    private sessionService sessionService;
    private paramService paramService;
    private bookService bookService;
    private cartService cartService;
    private oderService oderService;
    private addressService addressService;
    private heartService heartService;
    private emailService emailService;

    @Autowired
    public controllerUser(
            userService userService,
            sessionService sessionService,
            paramService paramService,
            bookService bookService,
            cartService cartService,
            oderService oderService,
            addressService addressService,
            heartService heartService,
            emailService emailService, userRepository userRepository) {
        this.userService = userService;
        this.sessionService = sessionService;
        this.paramService = paramService;
        this.bookService = bookService;
        this.cartService = cartService;
        this.oderService = oderService;
        this.addressService = addressService;
        this.heartService = heartService;
        this.emailService = emailService;
        this.userRepository = userRepository;
    }


    @PostMapping("/createUser")
    public String createUser(@ModelAttribute("newuser") user user, RedirectAttributes redirectAttributes) {
        user usernew = new user();
        cart cartnew = new cart();
        heart heartnew = new heart();
        usernew.setFullname(user.getFullname());
        usernew.setEmail(user.getEmail());
        usernew.setUsername(user.getUsername());
        usernew.setPassword(user.getPassword());
        usernew.setEnabled(true);
        usernew.setAdmin(false);
        usernew.setAvatar(null);
        usernew.setCart(cartnew);
        usernew.setHeart(heartnew);
        userService.insert(usernew);
        redirectAttributes.addFlashAttribute("icon", "success");
        redirectAttributes.addFlashAttribute("title", "Thành công !");
        redirectAttributes.addFlashAttribute("message", "Bạn có thể đăng nhập ngay bây giờ");
        return "redirect:/login";
    }

    @PostMapping("/loginuser")
    public String loginuser(@RequestParam("myusername") String us, @RequestParam("mypassword") String pw, RedirectAttributes redirectAttributes) {
        if (us.equals("") || pw.equals("")) {
            redirectAttributes.addFlashAttribute("messagenullusernameandpassword", "Vui lòng điền đầy đủ thông tin ");
            return "redirect:/login";
        } else {
            user userlogin = (user) userService.getByNameAndPassword(us, pw);
            if (userlogin != null) {
                if (!userlogin.isEnabled()) {
                    redirectAttributes.addFlashAttribute("icon", "error");
                    redirectAttributes.addFlashAttribute("title", "Thất bại !");
                    redirectAttributes.addFlashAttribute("message", "Tài khoản của bạn đã bị khóa vui lòng liên hệ ADMIN để biết thêm chi tiết");
                    return "redirect:/contact";
                }
                sessionService.set("us", userlogin);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Đăng nhập thành công");
                return "redirect:/index";
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Vui lòng kiểm tra lại thông tin");
                return "redirect:/login";
            }
        }
    }


    @GetMapping("/logoutuser")
    public String logoutuser(RedirectAttributes redirectAttributes) {
        user userlogout = sessionService.get("us");
        if (userlogout != null) {
            sessionService.remove("us");
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Đăng xuất thành công");
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Đăng xuất thất bại");
        }
        return "redirect:/index";
    }

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes, Model model) {

        if (!file.isEmpty()) {
            try {
                String uploadPath = "E:\\JAVA5_SOURCE\\ASM\\src\\main\\resources\\static\\images";
                File savedFile = paramService.save(file, uploadPath);
                if (savedFile != null) {
                    user selectId = sessionService.get("us");
                    selectId.setAvatar(savedFile.getName());
                    userService.update(selectId);
                    sessionService.set("us", selectId);
                }
            } catch (Exception e) {
                System.out.println("uploa error");
            }
        }
        return "redirect:/myinfoperson";
    }

    @GetMapping("/addcart/{id}/{page}")
    public String addcart(@PathVariable("id") int id_book, @PathVariable("page") String page, RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            if (id_book > 0) {
                book bookcheckqty = bookService.getBookById(id_book);
                if (bookcheckqty != null) {
                    if (bookcheckqty.getQuantity() <= 0) {
                        redirectAttributes.addFlashAttribute("icon", "error");
                        redirectAttributes.addFlashAttribute("title", "Thất bại !");
                        redirectAttributes.addFlashAttribute("message", "Sản phẩm hiện tại hết hàng");
                        if (page.equals("product")) {
                            return "redirect:/index";
                        } else if (page.equals("heart")) {
                            return "redirect:/heart";
                        } else {
                            return "redirect:/product_detail";
                        }

                    }
                }
                cartService.addItem(us.getId(), id_book);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Thêm vào giỏ thành công");
                if (page.equals("product")) {
                    return "redirect:/index";
                } else if (page.equals("heart")) {
                    return "redirect:/heart";
                } else {
                    return "redirect:/product_detail";
                }
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Thêm không thành công");
                if (page.equals("product")) {
                    return "redirect:/index";
                } else if (page.equals("heart")) {
                    return "redirect:/heart";
                } else {
                    return "redirect:/product_detail";
                }
            }
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Trước tiên bạn phải đăng nhập");
            if (page.equals("product")) {
                return "redirect:/index";
            } else if (page.equals("heart")) {
                return "redirect:/heart";
            } else {
                return "redirect:/product_detail";
            }
        }

    }

    @PostMapping("/update_quantity/{id}")
    public String update_quantity(@PathVariable("id") int id_book, @RequestParam(defaultValue = "0") int qty, RedirectAttributes redirectAttributes) {
        if (qty == 0) {
            return "redirect:/cart";
        }
        book checkqty = bookService.getBookById(id_book);
        if (checkqty != null) {
            if (checkqty.getQuantity() < qty) {
                return "redirect:/cart";
            }
        }
        user us = sessionService.get("us");
        if (us != null) {
            if (id_book > 0) {
                cartService.updateItem(us.getId(), id_book, qty);
            }
        }
        return "redirect:/cart";
    }


    @GetMapping("/remove_cart/{id}")
    public String remove_cart(@PathVariable("id") int id_book, RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            if (id_book > 0) {
                cartService.removeItem(us.getId(), id_book);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Xóa khỏi giỏ hàng thành công");
                return "redirect:/cart";
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/clear_cart")
    public String clear_cart(RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            cartService.clear(us.getId());
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Xóa toàn bộ giỏ hàng thành công");
            return "redirect:/cart";
        }
        return "redirect:/cart";
    }

    @GetMapping("/check_oder_completed")
    public String check_oder_completed(RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            if (cartService.getCount(us.getId()) > 0) {
                return "redirect:/oder_completed";
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Không Thể Thanh Toán Khi Giỏ Hàng Trống");
            }
        }
        return "redirect:/cart";
    }

    @PostMapping("/createAddress")
    public String createAddress(@ModelAttribute("newAddress") address address, RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            user user = userService.getById(us.getId());
            List<address> addressList = new ArrayList<>(user.getAddresses());
            address.setUser(user);
            addressList.add(address);
            user.setAddresses(addressList);
            userService.insert(user);
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Thêm Địa Chỉ Thành Công");
            return "redirect:/oder_completed";
        }
        return "redirect:/cart";
    }


    @PostMapping("/save_oder")
    public String save_oder(@ModelAttribute oder oder, @RequestParam("address_id") String id_address, RedirectAttributes redirectAttributes, Model model) {
        user us = sessionService.get("us");
        if (us != null) {
            user user = userService.getById(us.getId());
            if (id_address.equals("") || oder.getPayment_methods().equals("") || oder.getShipping_method().equals("")) {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Vui lòng điền đầy đủ thông tin đơn hàng");
                return "redirect:/oder_completed";
            } else {
                oder odernew = new oder();
                address address = addressService.findById(Integer.parseInt(id_address));
                try {
                    odernew.setCode_oder(UUID.randomUUID().toString());
                } catch (DataIntegrityViolationException e) {
                    odernew.setCode_oder(UUID.randomUUID().toString());
                }
                odernew.setReceiver_name(address.getName());
                odernew.setReceiver_note(oder.getReceiver_note());
                odernew.setReceiver_phone(address.getPhone());
                odernew.setReceiver_email(user.getEmail());
                odernew.setReceiver_address(address.getStreet() + " , " + address.getCity());
                odernew.setPayment_methods((oder.getPayment_methods().equals("TTKNH")) ? "Thanh Toán Khi Nhận Hàng" : "Phương Thức Khác");
                String shippingMethod = oder.getShipping_method();
                String newShippingMethod;
                if (shippingMethod.equals("GHN")) {
                    newShippingMethod = "Giao Hàng Nhanh";
                } else if (shippingMethod.equals("GHTK")) {
                    newShippingMethod = "Giao Hàng Tiết Kiệm";
                } else {
                    newShippingMethod = "Phương Thức Khác";
                }
                odernew.setShipping_method(newShippingMethod);
                odernew.setPriceTotal(oder.getPriceTotal());
                odernew.setStatus(oder_status.CHUA_XAC_NHAN);
                odernew.setPriceTotal(cartService.getAmount(user.getId()));
                odernew.setUser(user);
                List<oderDetail> orderDetails = new ArrayList<>();
                for (cartItem item : cartService.getItems(user.getId())) {
                    book bookupdateqty = bookService.getBookById(item.getBook().getId());
                    bookupdateqty.setQuantity(bookupdateqty.getQuantity() - item.getQuantity());
                    bookupdateqty.setQuantitySold(bookupdateqty.getQuantitySold() + item.getQuantity());
                    oderDetail orderDetail = new oderDetail();
                    orderDetail.setOder(odernew);
                    orderDetail.setBook(item.getBook());
                    orderDetail.setQuantity(item.getQuantity());
                    orderDetails.add(orderDetail);
                }
                odernew.setOderDetails(orderDetails);
                oder oderstatus = oderService.save(odernew);
                if (oderstatus != null) {
                    emailService.sendMail(
                            oderstatus.getReceiver_email(),
                            "Đặt hàng thành công",
                            "<h4>Đơn hàng của bạn đã được đặt thành công</h4>" +
                                    "<p>Xin chào " + oderstatus.getReceiver_name() + "</p>" +
                                    "<p>Chúng tôi đã tiếp nhận và xử lý đơn hàng: <b>" + oderstatus.getCode_oder() + "</b></p>" +
                                    "<h2>Thông tin khách hàng</h2>" +
                                    "<p><b>Tên: </b>" + oderstatus.getReceiver_name() + "</p>" +
                                    "<p><b>Email: </b>" + oderstatus.getReceiver_email() + "</p>" +
                                    "<p><b>Số điện thoại: </b>" + oderstatus.getReceiver_phone() + "</p>" +
                                    "<p><b>Địa chỉ giao hàng: </b>" + oderstatus.getReceiver_address() + "</p>" +
                                    "<h2>Thông tin đơn hàng</h2>" +
                                    "<p><b>Phương thức thanh toán: </b>" + oderstatus.getPayment_methods() + "</p>" +
                                    "<p><b>Phương thức vận chuyển: </b>" + oderstatus.getShipping_method() + "</p>" +
                                    "<p><b>Ghi chú: </b>" + oderstatus.getReceiver_note() + "</p>" +
                                    "<p><b>Trạng thái: </b>" + oderstatus.getStatus().getDescription() + "</p>" +
                                    "<h2>Cảm ơn đã mua hàng</h2>"
                    );
                    cartService.clear(user.getId());
                    redirectAttributes.addFlashAttribute("icon", "success");
                    redirectAttributes.addFlashAttribute("title", "Thành công !");
                    redirectAttributes.addFlashAttribute("message", "Đặt Hàng Thành Công Vui Lòng Kiểm Tra EMAIL");
                    return "redirect:/history_oder";
                } else {
                    redirectAttributes.addFlashAttribute("icon", "error");
                    redirectAttributes.addFlashAttribute("title", "Thất bại !");
                    redirectAttributes.addFlashAttribute("message", "Đặt Hàng Thất Bại Vui Lòng Kiểm Tra Lại Thông Tin");
                    return "redirect:/oder_completed";
                }
            }
        }
        return "redirect:/oder_completed";
    }


    @GetMapping("/add_heart/{id}/{page}")
    public String add_heart(@PathVariable("id") int id, @PathVariable("page") String page, RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            user user = userService.getById(us.getId());
            heart heart = user.getHeart();
            if (heart != null) {
                book book = bookService.getBookById(id);
                if (book != null) {
                    for (book item : heart.getBooks()) {
                        if (item.getId() == book.getId()) {
                            redirectAttributes.addFlashAttribute("icon", "error");
                            redirectAttributes.addFlashAttribute("title", "Thất bại !");
                            redirectAttributes.addFlashAttribute("message", "Sản Phẩm Đã Thêm Vào Yêu Thích Trước Đó");
                            if (page.equals("product")) {
                                return "redirect:/index";
                            } else {
                                return "redirect:/product_detail";
                            }
                        }
                    }
                    heart.addBook(book);
                    heartService.addHeart(heart);
                    redirectAttributes.addFlashAttribute("icon", "success");
                    redirectAttributes.addFlashAttribute("title", "Thành công !");
                    redirectAttributes.addFlashAttribute("message", "Thêm Vào Yêu Thích Thành Công");
                }
            }
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Trước tiên bạn phải đăng nhập");
            if (page.equals("product")) {
                return "redirect:/index";
            } else {
                return "redirect:/product_detail";
            }
        }
        if (page.equals("product")) {
            return "redirect:/index";
        } else {
            return "redirect:/product_detail";
        }
    }

    @GetMapping("/remove_heart/{id}")
    public String remove_heart(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        user us = sessionService.get("us");
        if (us != null) {
            user user = userService.getById(us.getId());
            heart heart = user.getHeart();
            if (heart != null) {
                List<book> books = heart.getBooks();
                for (book item : books) {
                    if (item.getId() == id) {
                        books.remove(item);
                        heart.setBooks(books);
                        heartService.addHeart(heart);
                        redirectAttributes.addFlashAttribute("icon", "success");
                        redirectAttributes.addFlashAttribute("title", "Thành công !");
                        redirectAttributes.addFlashAttribute("message", "Xóa Yêu Thích Thành Công");
                        return "redirect:/heart";
                    }
                }
            }
        }
        return "redirect:/heart";
    }

    @GetMapping("/view_product_detail/{id}")
    public String view_product_detail(@PathVariable Integer id, HttpSession session) {
        if (id != null) {
            book b = bookService.getBookById(id);
            b.setView(b.getView() + 1);
            book bookcheck = bookService.updateBook(b);
            session.setAttribute("productDetailById", bookcheck);
        }
        return "redirect:/product_detail";
    }

    @GetMapping("/reviewById/{id}")
    public String reviewById(@PathVariable Integer id) {
        if (id != null) {
            sessionService.set("reviewById", bookService.getBookById(id));
            return "redirect:/review_detail";
        }
        return "redirect:/history_oder";
    }

    @PostMapping("/insertReview/{id}")
    public String insertReview(@PathVariable("id") Integer id, @RequestParam("star") int star, @RequestParam("content") String content, RedirectAttributes redirectAttributes) {
        user user = sessionService.get("us");
        if (user != null) {
            user = userService.getById(user.getId());
            if (id != null) {
                book book = bookService.getBookById(id);
                if (book != null) {
                    List<review_book> review_books = book.getReview_books();
                    if (review_books == null) {
                        review_books = new ArrayList<>();
                    }
                    review_book reviewBook = new review_book();
                    reviewBook.setStar(star);
                    reviewBook.setBook(book);
                    reviewBook.setUser(user);
                    reviewBook.setContent(content);
                    if (book.checkreview(user.getId())) {
                        user.setCoin(user.getCoin() + 0.2);
                    }
                    review_books.add(reviewBook);
                    book.setReview_books(review_books);
                    bookService.updateBook(book);
                    redirectAttributes.addFlashAttribute("icon", "success");
                    redirectAttributes.addFlashAttribute("title", "Thành công !");
                    redirectAttributes.addFlashAttribute("message", "Đánh giá thành công");
                    return "redirect:/history_oder";
                }
            }

        }
        return "redirect:/history_oder";
    }

    @GetMapping("/onCoin")
    public String onCoin() {
        user us = sessionService.get("us");
        if (us != null) {
            user user = userService.getById(us.getId());
            if (user != null) {
                sessionService.set("useCoin", true);
                double total = sessionService.get("total");
                sessionService.set("total_cart", total - user.getCoin());
                System.out.println("ok");
                return "redirect:/oder_completed";
            }
        }
        return "redirect:/oder_completed";
    }


}
