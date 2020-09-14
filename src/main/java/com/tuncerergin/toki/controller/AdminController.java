package com.tuncerergin.toki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tuncerergin.toki.entity.Departman;
import com.tuncerergin.toki.entity.Personel;
import com.tuncerergin.toki.entity.Role;
import com.tuncerergin.toki.repositories.DepartmanRepository;
import com.tuncerergin.toki.repositories.PersonelRepository;
import com.tuncerergin.toki.repositories.RoleRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Admin yetkisi ile yapılabileceklerin kontrol edildiği controller sınıf.
 * Admin departmanları görüntüleme, ekleme, güncelleme, amir atama, deparmanlara kullanıcı eklemei silme, güncelleme işelmlerini yapabilir.
 * yetki alanlar => ".../admin/**"
 *
 * @author Tuncer ERGİN
 * @version 1.0
 * @link /admin
 * @since 2020-09-12
 */

@Controller
@AllArgsConstructor
@RequestMapping("/admin")
public class AdminController {
    private final DepartmanRepository departmanRepository;
    private final PersonelRepository personelRepository;
    private final RoleRepository roleRepository;

    /**
     * @return String yönlendirilecek sayfa ismi
     * @link / admin sayfası açılına deparmanların görüntülenmesini sağlar
     */
    @GetMapping("/")
    public String adminIndex() {
        return "departman";
    }

    /**
     * Harici bir apiden sisteme kullanıcıları almak için yazılan metod.
     * Geliştirme aşamasında.
     *
     * @throws IOException
     */
    @GetMapping("/getData")
    private static void getEmployees() throws IOException {
        final String uri = "http://my-json-server.typicode.com/tuncerergin/Toki/personel";

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
        // ResponseEntity<Personel> personeller = restTemplate.getForEntity(uri, Personel.class);

        ObjectMapper objectMapper = new ObjectMapper();

        Object[] personeller = objectMapper.readValue(result, Object[].class);

    }

    /**
     * departmanları görüntülemeye yarayan metod
     *
     * @param model ekrana gönderilen bilgiler
     * @return gösterilecek ekran ismi
     * @Link /departman
     */
    @GetMapping("/departman")
    public String anasayfa(Model model) {
        List<Departman> departman = departmanRepository.findAll();
        model.addAttribute("departments", departman);
        return "admin";
    }

    /**
     * Herhangi bir deparman seçilince o departmana ait bilgileri ve kilişleri görüntülemeye yarayan metod
     *
     * @param id    seçilen departmanın idsi
     * @param model ekrana gönderilen bilgiler
     * @return gösterilecek ekran ismi
     * @Link /listPersons
     */
    @GetMapping("/listPersons")
    public String personList(@RequestParam("departmanId") Integer id, Model model) {

        List<Personel> persons = personelRepository.findByDepartman_Id(id);
        Optional<Departman> departman = departmanRepository.findById(id);
        model.addAttribute("persons", persons);
        model.addAttribute("departman", departman.get());
        return "personelList";

    }

    /**
     * Deparman güncelleme
     *
     * @param id    güncellenecek departman id
     * @param model arayüze göndelilen bilgiler
     * @return gösterilecek ekran ismi
     * @Link /updateDepartman
     */
    @GetMapping("/updateDepartman")
    public String updateDepartman(@RequestParam("departmanId") Integer id, Model model) {

        Departman departman = departmanRepository.getOne(id);
        List<Personel> depPerList = personelRepository.findByDepartmanAmir(id);
        if (departman.getAmir() != null) {
            //Departman yeni oluşturulduğunda eski amir olamayacağından eski amirin rolü güncellenemez.
            Personel amir = departman.getAmir();
            List<Role> roles = new ArrayList<>();
            roles.add(roleRepository.getOne("PERSONEL"));
            amir.setRole(roles);
            personelRepository.save(amir);
        }
        model.addAttribute("amirList", depPerList);
        model.addAttribute("departman", departman);
        return "departman";
    }

    /**
     * Yeni departman ekleme
     *
     * @param model ekrana gönderilen bilgiler
     * @return gösterilecek ekran ismi
     * @Link /addDepartman
     */
    @RequestMapping("/addDepartman")
    public String addDepartman(Model model) {
        Departman departman = new Departman();
        model.addAttribute("departman", departman);
        return "departman";
    }

    /**
     * departman güncelleme veya yeni departman ekleme işlemi sonucunda departmanın veritabanına kaydedilmesini sağlayan metod
     * yeni bir departman eklendiğinde o departmana bağlı bir personel olmadığından amir ataması yaplmaz.
     * departman güncelleme işleminde yeni amir seçilince eski amirin rolü "PERSONEL" olarak değiştirilir.
     *
     * @param departman güncellenen veya yeni eklenen departman bilgileri
     * @return departman sayfasına yönlendir.
     * @Link /saveDepartman
     */
    @PostMapping("/saveDepartman")
    public String saveDepartman(@ModelAttribute("departman") Departman departman) {
        departmanRepository.save(departman);
        if (departman.getAmir() != null) {
            Personel amir = departman.getAmir();
            List<Role> roles = new ArrayList<>();
            roles.add(roleRepository.getOne("AMIR"));
            amir.setRole(roles);
            personelRepository.save(amir);
        }
        return "redirect:/admin/departman";
    }

    /**
     * Departmana ait bir personlin güncellenmesi ekranını açan metod
     *
     * @param id    güncellenecek olan personele ait id
     * @param model güncelleme ekranına gönderilecek olan ve personel bilgilerini tutan yapı
     * @return gösterilecek ekran adı
     * @Link /personelupdate
     */
    @GetMapping("/personelupdate")
    public String personelupdate(@RequestParam("personelId") Integer id, Model model) {
        model.addAttribute("now", java.time.LocalDate.now());
        model.addAttribute("personel", personelRepository.findById(id).get());
        return "personel";
    }

    /**
     * personel güncelleme ekranında yapılan değişiklikleri vereitabanına kaydetmeye yarayan metod
     * <p>
     * Issue => Personel güncellendiğinde yetkilendirmesi null olarak güncelleniyordu, bunu çözmek için yeni Rol (PERSONEL) ataması yapıldı
     * eğer personel amir rolünde birisi ise o departmanın amiri olarak görülüyor fakat yetkisi PERSONEL statüsünde.
     * Bu sorun veritabanı ilşkilendirmesinin düzeltilmesi ile çözülecek.
     *
     * @param personel güncellenmiş personel bilgilerini tutan nesne
     * @return yönlendirilecek ekran ismi
     * @Link /savePersonel
     */
    @PostMapping("/savePersonel")
    public String savePersonel(@ModelAttribute("personel") Personel personel) {

        Optional<Departman> departman = departmanRepository.findById(personel.getDepartman().getId());

        personel.setDepartman(departman.get());
        List<Role> roles = new ArrayList<>();
        roles.add(roleRepository.getOne("PERSONEL"));
        personel.setRole(roles);
        personelRepository.save(personel);
        return "redirect:/admin/listPersons?departmanId=" + personel.getDepartman().getId();
    }

    /**
     * Personelin veritabanından silinmesini sağlayan metod.
     *
     * @param id          silinecek personele ait id değişkeni
     * @param departmanId silme işleminden sonra departman arayüzüne yönlendirmek için kullanılan değişken
     * @return yönlendirilecek ekran
     * @Link /personeldelete
     */
    @GetMapping("/personeldelete")
    public String personeldelete(@RequestParam("personelId") Integer id,
                                 @RequestParam("departmanId") Integer departmanId) {
        personelRepository.deleteById(id);
        return "redirect:/admin/listPersons?departmanId=" + departmanId;
    }

    /**
     * Personel kaydetme formunu gösteren metod.
     *
     * @param model       arayüze gönderilecek verileri tutan yapı.
     * @param departmanId personelin kaydedileceği departman id
     * @return gösterilecek form
     * @Link /personelKayit
     */
    @GetMapping("/personelKayit")
    public String registerForm(Model model, @RequestParam("departmanId") Integer departmanId) {
        Personel personel = new Personel();

        model.addAttribute("now", java.time.LocalDate.now());
        model.addAttribute("departmanId", departmanId);
        model.addAttribute("personel", personel);

        return "registerForm";
    }

    /**
     * Personel kayıt formundan gelen verileri veritabanına kaydetmeye yarayan metod.
     * sisteme giriş için kullanılan personel email bilgisini kontrol eder, eğer aynı email adresi sistemde kayıtlı ise hata döndürür.
     *
     * @param personel formdan gelen personel bilgilerinin bulunduğu nesne
     * @param model    ekrana gönderilecek bilgileri tutan yapı.
     * @param id       personelin kaydedileceği departman id'si
     * @return gösterilecek ekran ismi. (kayıt işleminin başarılı olması durumunda otomatik yönlendirme yapar.)
     * @Link /personelKayit
     */
    @PostMapping("/personelKayit")
    public String registerMember(@Valid Personel personel, Model model,
                                 @RequestParam(value = "departmanId", required = false) Integer id) {
        String email = personel.getEmail();
        if (personelRepository.findByEmail(email) != null) {
            model.addAttribute("exist", true);
            return "registerForm";
        }

        personel.setDepartman(departmanRepository.getOne(id));
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        personel.setPassword(encoder.encode(personel.getPassword()));
        List<Role> roles = new ArrayList<>();
        roles.add(roleRepository.getOne("PERSONEL"));

        personel.setRole(roles);
        personelRepository.save(personel);
        model.addAttribute("success", true);
        return "registerForm";
    }
}
