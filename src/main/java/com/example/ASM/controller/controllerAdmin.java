package com.example.ASM.controller;

import com.example.ASM.entity.*;
import com.example.ASM.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;

@Controller
public class controllerAdmin {
    private userService userService;
    private categoryService catService;
    private authorService authService;
    private bookService bookService;
    private paramService paramService;
    private oderService orderService;
    private sessionService sessionService;

    @Autowired
    public controllerAdmin(
            userService userService,
            categoryService catService,
            authorService authService,
            bookService bookService,
            paramService paramService,
            oderService orderService,
            sessionService sessionService) {
        this.userService = userService;
        this.catService = catService;
        this.authService = authService;
        this.bookService = bookService;
        this.paramService = paramService;
        this.orderService = orderService;
        this.sessionService = sessionService;
    }

    @GetMapping("/updateenabled/{id}")
    public String updateEnabled(@PathVariable int id, RedirectAttributes redirectAttributes) {
        user userupdate = userService.getById(id);
        if (userupdate != null) {
            userupdate.setEnabled(!userupdate.isEnabled());
            userService.update(userupdate);
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Cập nhật trạng thái thành công");
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Cập nhật trạng thái thất bại");
        }
        return "redirect:/manager_user";
    }

    @GetMapping("/edit_user/{id}")
    public String user_edit(@PathVariable int id, RedirectAttributes redirectAttributes) {
        user userupdate = userService.getById(id);
        System.out.println(userupdate);
        if (userupdate != null) {
            redirectAttributes.addFlashAttribute("useredit", userupdate);
        }
        return "redirect:/edituser";
    }

    //    @PostMapping("/saveinfo")
//    public String user_save(user user, RedirectAttributes redirectAttributes) {
//
//    }
    @PostMapping("/add_category")
    public String add_category(@RequestParam("mycategory") String name, RedirectAttributes redirectAttributes) {
        if (!name.trim().equals("")) {
            category category = catService.findByName(name.trim());
            if (category == null) {
                category categorynew = new category();
                categorynew.setName(name.trim());
                catService.insert(categorynew);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Thêm Danh Mục Mới Thành Công");
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Danh Mục Đã Tồn Tại");
            }
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Vui Lòng Điền Tên Danh Mục");
        }

        return "redirect:/manager_category";
    }

    @PostMapping("/addAuthor")
    public String addAuthor(@ModelAttribute("newauthor") author author, RedirectAttributes redirectAttributes) {
        if (!author.getName().trim().equals("")) {
            author check_author = authService.findByName(author.getName().trim());
            if (check_author == null) {
                author authornew = new author();
                authornew.setName(author.getName().trim());
                authService.insert(authornew);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Thêm Tác Giả Mới Thành Công");
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Tác Giả Đã Tồn Tại");
            }
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Vui Lòng Điền Tên Tác Giả");
        }

        return "redirect:/manager_author";
    }

    @PostMapping("/createBook")
    public String createProduct(@RequestParam("fileproduct") MultipartFile file, @ModelAttribute("newBook") book book, RedirectAttributes redirectAttributes) {
        if (book != null) {
            book booknew = new book();
            booknew.setTitle(book.getTitle());
            booknew.setPictureMain(book.getPictureMain());
            booknew.setDescription(book.getDescription());
            booknew.setList_price(book.getList_price());
            booknew.setDiscount(book.getDiscount());
            booknew.setEnable_discount(true);
            booknew.setSelling_price(book.getList_price() - (book.getList_price() * book.getDiscount() / 100));
            booknew.setPublishing_company(book.getPublishing_company());
            booknew.setPublisher(book.getPublisher());
            booknew.setQuantity((book.getQuantity()));
            booknew.setCategory(book.getCategory());
            booknew.setAuthor(book.getAuthor());
            if (!file.isEmpty()) {
                try {
                    String uploadPath = "E:\\JAVA5_SOURCE\\ASM\\src\\main\\resources\\static\\images";
                    File savedFile = paramService.save(file, uploadPath);
                    if (savedFile != null) {
                        booknew.setPictureMain(savedFile.getName());
                    }
                } catch (Exception e) {
                    System.out.println("uploa error");
                }
            }
            bookService.insertBook(booknew);
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Thêm Sản Phẩm Mới Thành Công");
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Thêm Sản Phẩm Mới Thất Bại");
            return "redirect:/addproduct";
        }
        return "redirect:/manager_product";
    }

    @GetMapping("/status_oder/{id}")
    public String status_oder(@PathVariable int id, RedirectAttributes redirectAttributes) {
        if (id > 0) {
            redirectAttributes.addFlashAttribute("status_oder_id", orderService.findById(id));
        }
        return "redirect:/status_oder";
    }

    @PostMapping("/update_status_oder/{id}")
    public String update_status_oder(@PathVariable("id") int id, @RequestParam("status_oderById") int value, RedirectAttributes redirectAttributes) {
        if (id > 0) {
            oder od = orderService.findById(id);
            if (od != null) {
                if (value == 1) {
                    od.setStatus(oder_status.CHUA_XAC_NHAN);
                } else if (value == 2) {
                    od.setStatus(oder_status.DA_XAC_NHAN);
                } else if (value == 3) {
                    od.setStatus(oder_status.DANG_GIAO_HANG);
                } else if (value == 4) {
                    od.setStatus(oder_status.DA_GIAO_HANG);
                } else if (value == 5) {
                    od.setStatus(oder_status.DA_HUY);
                }
                orderService.update(od);
                redirectAttributes.addFlashAttribute("icon", "success");
                redirectAttributes.addFlashAttribute("title", "Thành công !");
                redirectAttributes.addFlashAttribute("message", "Cập nhật trạng thái đơn hàng thành công");
                redirectAttributes.addFlashAttribute("status_oder_id", orderService.findById(id));
            }
        }
        return "redirect:/status_oder";
    }

    @PostMapping("/loginadmin")
    public String loginuser(@RequestParam("username_admin") String us, @RequestParam("spassword_admin") String pw, RedirectAttributes redirectAttributes) {
        if (us.equals("") || pw.equals("")) {
            redirectAttributes.addFlashAttribute("messagenullusernameandpassword_admin", "Vui lòng điền đầy đủ thông tin ");
            return "redirect:/login_admin";
        } else {
            user userlogin = (user) userService.getByNameAndPassword(us, pw);
            if (userlogin != null) {
                if (userlogin.isAdmin()) {
                    sessionService.set("adm", userlogin);
                    redirectAttributes.addFlashAttribute("icon", "success");
                    redirectAttributes.addFlashAttribute("title", "Thành công !");
                    redirectAttributes.addFlashAttribute("message", "Đăng nhập thành công");
                    return "redirect:/admin_index";
                } else {
                    redirectAttributes.addFlashAttribute("icon", "error");
                    redirectAttributes.addFlashAttribute("title", "Thất bại !");
                    redirectAttributes.addFlashAttribute("message", "Bạn không có quyền hạng admin");
                    return "redirect:/login_admin";
                }
            } else {
                redirectAttributes.addFlashAttribute("icon", "error");
                redirectAttributes.addFlashAttribute("title", "Thất bại !");
                redirectAttributes.addFlashAttribute("message", "Vui lòng kiểm tra lại thông tin");
                return "redirect:/login_admin";
            }
        }
    }

    @GetMapping("/logoutadmin")
    public String logoutuser(RedirectAttributes redirectAttributes) {
        user userlogout = sessionService.get("adm");
        if (userlogout != null) {
            sessionService.remove("adm");
            redirectAttributes.addFlashAttribute("icon", "success");
            redirectAttributes.addFlashAttribute("title", "Thành công !");
            redirectAttributes.addFlashAttribute("message", "Đăng xuất thành công");
        } else {
            redirectAttributes.addFlashAttribute("icon", "error");
            redirectAttributes.addFlashAttribute("title", "Thất bại !");
            redirectAttributes.addFlashAttribute("message", "Đăng xuất thất bại");
        }
        return "redirect:/login_admin";
    }
}
