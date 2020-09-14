package com.tuncerergin.toki.controller;

import com.tuncerergin.toki.entity.Departman;
import com.tuncerergin.toki.entity.Izin;
import com.tuncerergin.toki.entity.Personel;
import com.tuncerergin.toki.repositories.DepartmanRepository;
import com.tuncerergin.toki.repositories.IzinRepository;
import com.tuncerergin.toki.repositories.PersonelRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;

/**
 * Amir yetkisi ile yapılabileceklerin kontrol edildiği controller sınıf.
 * Amir bağlı olduğu departmanda personel tarafından talep edilen izinlerin onaylanması veya reddedilmesinden sorumludur.
 * yetki alanlar => ".../amir/**"
 *
 * @author Tuncer ERGİN
 * @version 1.0
 * @link /amir
 * @since 2020-09-13
 */

@Controller
@RequestMapping("/amir")
public class AmirController {
    private final DepartmanRepository departmanRepository;
    private final PersonelRepository personelRepository;
    private final IzinRepository izinRepository;

    public AmirController(DepartmanRepository departmanRepository, PersonelRepository personelRepository, IzinRepository izinRepository) {
        this.departmanRepository = departmanRepository;
        this.personelRepository = personelRepository;
        this.izinRepository = izinRepository;
    }

    Personel kullanici;

    /**
     * Amirin bağlı olduğu departmandaki personellerin izin teleplerinin görüntülendiği ekran.
     * Daha detaylı(yıl,ay, onaylanan, reddedilen, onay bekleyen veya kullanıcı bazında filtreleme) bir arayüz geliştirilebilir.
     * Kullanıcıları yılın, ayın veya haftanın hangi günlerinde daha çok rapor aldığı,
     * ortalama kaç gün raporaldığı gibi detaylı bir rapor alma mekanizması eklenebilir.
     *
     * @param model     arayüze gönderilecek olan bilgilerin tutulduğu yapı.
     * @param principal aktif kullanıcı bilgilerin tutulduğu nesne.
     * @return gösterilecek ekran.
     * @Link /izinler
     */
    @GetMapping("/izinler")
    public String izinList(Model model, Principal principal) {
        kullanici = personelRepository.findByEmail(principal.getName());

        Optional<Departman> departman = departmanRepository.findById(kullanici.getDepartman().getId());
        Collection<Izin> izin = izinRepository.findAllIzinByDepartmanId(kullanici.getDepartman().getId());

        model.addAttribute("amir", kullanici);
        model.addAttribute("personel", departman.get().getPersonel());
        model.addAttribute("izinler", izin);
        return "amir/izinList";
    }

    /**
     * amirin izinleri onaylaması veya reddetmesini veritabanına kaydeden metod.
     *
     * @param id    üzerinde işlem yapılan izin id'si.
     * @param sonuc amirin zin üzerinde yaptığı değişiklik(Onaylama="e", Reddetme="h").
     * @return yönlendirilen ekran bilgisi.
     * @Link /izinOnay
     */
    @GetMapping("/izinOnay")
    public String izinOnay(@RequestParam("izinId") Integer id,
                           @RequestParam("sonuc") String sonuc) {

        Optional<Izin> izin = izinRepository.findById(id);
        izin.get().setOnay(sonuc);
        izin.get().setOnaylayanAmir(kullanici);

        izin.get().setOnaylanmaTarihi(LocalDate.now());
        izinRepository.save(izin.get());
        return "redirect:/amir/izinler?departmanId=" + izin.get().getPersonel().getDepartman().getId();
    }
}
