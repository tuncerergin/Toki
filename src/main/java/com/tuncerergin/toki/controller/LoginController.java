package com.tuncerergin.toki.controller;

import com.tuncerergin.toki.repositories.PersonelRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

/**
 * Auth kontrol
 * Kullanıcı giriş bilgilerinin kontrol edildiği ve yetkiye göre yönlendiröe işleminin yapıldığı sınıf.
 *
 * @author Tuncer ERGİN
 * @version 1.0
 * @since 2020-09-11
 */
@Controller
public class LoginController {
    private final PersonelRepository personelRepository;

    public LoginController(PersonelRepository personelRepository) {
        this.personelRepository = personelRepository;
    }

    /**
     * root dizinitemsil eder, kullanıcı giriş yapmamışsa login ekranına,
     * giriş yapmışsa yetkili olduğu alana yönlendirilir.
     *
     * @param principal aktif kullanıcı
     * @return String yönlendirilecek sayfa ismi
     */
    @GetMapping("/")
    public String redirect(Principal principal) {


        if (principal == null) {
            return "loginPage";
        }

        String role = personelRepository.findByEmail(principal.getName()).getRole().get(0).getName();
        switch (role) {
            case "ADMIN":
                return "redirect:/admin/departman";
            case "AMIR":
                return "redirect:/amir/izinler";
            case "PERSONEL":
                return "redirect:/personel/person";
            default:
                return "login";
        }
    }

    /**
     * login ekranını aç
     *
     * @return String yönlendirilecek sayfa ismi
     */
    @GetMapping("/login")
    public String showMyLoginPage() {
        return "loginPage";
    }

    /**
     * yetkilendirme ihlal edilirse access-denied sayfasını açar.
     * Spring Security özelliği
     *
     * @return String yönlendirilecek sayfa ismi
     */
    @GetMapping("/access-denied")
    public String showAccessDenied() {
        return "access-denied";
    }

    /**
     * hata ile karşılaşılırsa error sayfası görüntülenir
     *
     * @return String yönlendirilecek sayfa ismi
     */
    @GetMapping("/error")
    public String showErrorPage() {
        return "error";
    }
}
