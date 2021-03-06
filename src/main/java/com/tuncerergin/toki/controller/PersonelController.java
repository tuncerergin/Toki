package com.tuncerergin.toki.controller;

import com.tuncerergin.toki.entity.Izin;
import com.tuncerergin.toki.entity.IzinTuru;
import com.tuncerergin.toki.entity.Personel;
import com.tuncerergin.toki.repositories.IzinRepository;
import com.tuncerergin.toki.repositories.IzinTuruRepository;
import com.tuncerergin.toki.repositories.PersonelRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

/**
 * <h3>Personel yetkisi ile yapılabileceklerin kontrol edildiği controller sınıf.</h3>
 * Personel izinlerini, istatistiklerini görüleyebilir, yeni izin talebinde bulunabilir,
 * onaylanmayan iznini güncelleyebilir, silebilir veya raporunu albilir.<br>
 * amir arafından onaylanmış raporlarda değişiklik(güncelleme, silme, rapor alma) yapamaz.<br>
 * yetki alanları => ".../personel/**"
 *
 * @author Tuncer ERGİN
 * @version 1.0
 * @link /personel
 * @since 2020-09-12 -- 2020-09-14
 */
@Controller
@RequestMapping("/personel")
public class PersonelController {
    private final PersonelRepository personelRepository;
    private final IzinRepository izinRepository;
    private final IzinTuruRepository izinTuruRepository;
    Personel kullanici;
    int kullanilanYillikIzin = 0;
    int kullanilanRaporIzin = 0;
    int kullanilanMazeretIzin = 0;
    int toplamIzin = 0;

    public PersonelController(PersonelRepository personelRepository, IzinRepository izinRepository, IzinTuruRepository izinTuruRepository) {
        this.personelRepository = personelRepository;
        this.izinRepository = izinRepository;
        this.izinTuruRepository = izinTuruRepository;
    }

    /**
     * Personelin izin istatistiklerini, izinlerini ve yeni izin talebinde bulunacağı arayüzü göstereye yarayan metod.
     *
     * @param model     arayüze gönderilen bilgileri tutan yapı.
     * @param principal aktif kullanıcı bilgileri.
     * @return gösterilecek arayüz adı.
     * @Link /person
     */
    @GetMapping("/person")
    public String personList(Model model, Principal principal) {

        kullanici = personelRepository.findByEmail(principal.getName());
        LocalDate now = java.time.LocalDate.now();

        kullanilanYillikIzin = 0;
        kullanilanRaporIzin = 0;
        kullanilanMazeretIzin = 0;
        Optional<Personel> personel = personelRepository.findById(kullanici.getId());
        Collection<Izin> izinler = personel.get().getIzin();

        for (Izin izin : izinler) {
            //içinde bulunduğumuz yılda onaylanan toplam gün.
            if (izin.getIzinTuru().getId() == 1) {
                kullanilanYillikIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
            } else if (izin.getIzinTuru().getId() == 2) {
                kullanilanRaporIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
            } else if (izin.getIzinTuru().getId() == 3) {
                kullanilanMazeretIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
            }

        }

        List<IzinTuru> izinTuruList = izinTuruRepository.findAll();
        if (ChronoUnit.DAYS.between(personel.get().getIseBaslamaTarihi(), java.time.LocalDate.now()) > 365) {// İşe başlayalı 1 sene oldu. izin kullanabilir
            for (IzinTuru izinTuru : izinTuruList) {
                toplamIzin += izinTuru.getIzinMiktari();
            }
            if (toplamIzin > (kullanilanYillikIzin + kullanilanMazeretIzin + kullanilanRaporIzin)) {
                model.addAttribute("izinKullanabilir", true);
            } else {
                model.addAttribute("izinKullanabilir", false);
            }
        } else {
            model.addAttribute("izinKullanabilir", false);
        }

        model.addAttribute("personel", personel.get());
        model.addAttribute("izinler", personel.get().getIzin());
        return "personel/personel";

    }

    @PreAuthorize("hasRole('ROLE_PERSONEL')")
    @GetMapping("/istatistik")
    public String istatistik(Model model) {

        kullanilanYillikIzin = 0;
        kullanilanRaporIzin = 0;
        kullanilanMazeretIzin = 0;
        Optional<Personel> personel = personelRepository.findById(kullanici.getId());
        Collection<Izin> izinler = personel.get().getIzin();
        StringBuilder json = new StringBuilder();
        StringBuilder jsonOnayBekleyen = new StringBuilder();
        StringBuilder jsonOnaylanmis = new StringBuilder();
        StringBuilder jsonReddedilmis = new StringBuilder();
        jsonOnayBekleyen.append("{ name: '")
                .append("Onay Bekleyen")
                .append("', data: [ ");
        jsonOnaylanmis.append("{ name: '")
                .append("Onaylanmış")
                .append("', data: [ ");
        jsonReddedilmis.append("{ name: '")
                .append("Reddedilmiş")
                .append("', data: [ ");
        for (Izin izin : izinler) {
            //içinde bulunduğumuz yılda onaylanan toplam gün.
            if (izin.getOnay().equals("e") && izin.getIzinBaslangicTarihi().getYear() == java.time.LocalDate.now().getYear()) {
                if (izin.getIzinTuru().getId() == 1) {
                    kullanilanYillikIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
                } else if (izin.getIzinTuru().getId() == 2) {
                    kullanilanRaporIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
                } else if (izin.getIzinTuru().getId() == 3) {
                    kullanilanMazeretIzin += ChronoUnit.DAYS.between(izin.getIzinBaslangicTarihi(), izin.getIzinBitisTarihi());
                }

                jsonOnaylanmis.append("{ x: '")
                        .append(izin.getIzinTuru().getIzinTur())
                        .append("',").append("y: [ ")
                        .append("new Date('")
                        .append(izin.getIzinBaslangicTarihi())
                        .append("').getTime(),")
                        .append("new Date('")
                        .append(izin.getIzinBitisTarihi())
                        .append("').getTime()")
                        .append("] ")
                        .append("},");


            } else if (izin.getOnay().equals("h") && izin.getIzinBaslangicTarihi().getYear() == java.time.LocalDate.now().getYear()) {
                jsonReddedilmis.append("{ x: '")
                        .append(izin.getIzinTuru().getIzinTur())
                        .append("',").append("y: [ ")
                        .append("new Date('")
                        .append(izin.getIzinBaslangicTarihi())
                        .append("').getTime(),")
                        .append("new Date('")
                        .append(izin.getIzinBitisTarihi())
                        .append("').getTime()")
                        .append("]")
                        .append("},");
            } else if (izin.getOnay().equals("b") && izin.getIzinBaslangicTarihi().getYear() == java.time.LocalDate.now().getYear()) {
                jsonOnayBekleyen.append("{ x: '")
                        .append(izin.getIzinTuru().getIzinTur())
                        .append("',").append("y: [")
                        .append("new Date('")
                        .append(izin.getIzinBaslangicTarihi())
                        .append("').getTime(),")
                        .append("new Date('")
                        .append(izin.getIzinBitisTarihi())
                        .append("').getTime()")
                        .append("]")
                        .append("},");
            }


        }
        jsonOnayBekleyen.deleteCharAt(jsonOnayBekleyen.length() - 1).append("]},");//son virgülü sil
        jsonOnaylanmis.deleteCharAt(jsonOnaylanmis.length() - 1).append("]},");//son virgülü sil
        jsonReddedilmis.deleteCharAt(jsonReddedilmis.length() - 1).append("]},");//son virgülü sil
        json.append(jsonOnayBekleyen).append(jsonOnaylanmis).append(jsonReddedilmis);

        List<IzinTuru> izinTuruList = izinTuruRepository.findAll();

        if (ChronoUnit.DAYS.between(personel.get().getIseBaslamaTarihi(), java.time.LocalDate.now()) > 365) {// İşe başlayalı 1 sene oldu. izin kullanabilir
            toplamIzin = 0;
            for (IzinTuru izinTuru : izinTuruList) {
                toplamIzin += izinTuru.getIzinMiktari();
            }
            if (toplamIzin > (kullanilanYillikIzin + kullanilanMazeretIzin + kullanilanRaporIzin)) {
                model.addAttribute("izinKullanabilir", true);
            } else {
                model.addAttribute("izinKullanabilir", false);
            }
        } else {
            model.addAttribute("izinKullanabilir", false);
        }
        model.addAttribute("izinTuruList", izinTuruList);
        model.addAttribute("jsonData", json);
        model.addAttribute("personel", personel.get());
        model.addAttribute("kullanilanYillikIzin", kullanilanYillikIzin);
        model.addAttribute("kullanilanMazeretIzin", kullanilanMazeretIzin);

        model.addAttribute("kullanilanRaporIzin", kullanilanRaporIzin);
        model.addAttribute("izinler", personel.get().getIzin());
        return "personel/istatistik";

    }

    /**
     * Henüz onaylanmamış izin bilgilerini amire yazılı olarak onaylatmak için alınan raporu görüntüleyen metod.
     * (raporun onaylanıp onaylanmadığı arayüzde kontrol edilmektedir.)
     *
     * @param id    raporu alınacak rapor id'si
     * @param model rapora gönderilecek izin ve personel bilgilerinin tutulduğu yapı.
     * @return raporun görünüleneceği ekran adı.
     * @Link /yazdir
     */
    @GetMapping("/yazdir")
    public String yazdir(@RequestParam("izinId") Integer id, Model model) {
        Optional<Izin> izin = izinRepository.findById(id);
        model.addAttribute("personel", kullanici);
        model.addAttribute("izin", izin.get());
        return "personel/izinTalepDilekce";
    }

    /**
     * personelin şartları sağlaması(işe başlayalı 1 yıl olması, izin hakkını doldurmamış olması) halinde izin talep edebilmesini sağlayan metod.
     *
     * @param model ekrana gönderilecek bilgilerin yeraldığı yapı.<br>
     *              personel: izin alacak personel.<br>
     *              minIzinBaslangic: personel sadece bu günden sonrası için izin talebinde bulunabilir. geçmişe yönelik izin talep edemez.<br>
     *              maxIzinBaslangic: personel izinlerini bu sene icersinde kullanmalı.<br>
     *              kullanilanIzin: personelin daha önce kaç gün izin kullandığı bilgisi.<br>
     *              kalanIzin: kalan izin miktarı. (arayüzde js ile izin baslangic tarihinden sonra max bu kadar izin kullanmasına izin veriliyor.)
     * @return izin alma ekranın ismi.
     * @Link /izinTalep
     */
    @GetMapping("/izinTalep")
    public String izinTalep(Model model) {
        LocalDate now = java.time.LocalDate.now();
        Izin izin = new Izin();
        List<IzinTuru> izinTuruList = izinTuruRepository.findAll();
        model.addAttribute("izinTuruList", izinTuruList);


        model.addAttribute("personel", kullanici);
        model.addAttribute("minIzinBaslangic", now);
        model.addAttribute("maxIzinBaslangic", now.getYear() + "-12-31");
        model.addAttribute("kullanilanYillikIzin", kullanilanYillikIzin);
        model.addAttribute("kullanilanMazeretIzin", kullanilanMazeretIzin);
        model.addAttribute("kullanilanRaporIzin", kullanilanRaporIzin);
        model.addAttribute("izin", izin);
        return "personel/izin";

    }

    /**
     * Henüz onaylanmamış izin üzerinde güncelleme yapılması sağlanan arayüzün gösterilmesini sağlayan metod.
     *
     * @param id    güncellenmek istenen izin id'si
     * @param model izin talep formu üzerinden güncelleme yapılacağı için aynı arayüzü çağıran izinTalep() metodunda aynı yapının gönderildiği nesne
     * @return izin güncelleme ekranı adı
     */
    @GetMapping("/izinUpdate")
    public String izinUpdate(@RequestParam(value = "izinId") Integer id, Model model) {
        LocalDate now = java.time.LocalDate.now();
        Optional<Izin> izin = izinRepository.findById(id);
        model.addAttribute("minIzınBaslangic", now);
        model.addAttribute("maxIzinBaslangic", now.getYear() + "-12-31");
        model.addAttribute("personel", izin.get().getPersonel());
        model.addAttribute("kullanilanIzin", kullanilanYillikIzin);
        model.addAttribute("kalanIzin", 21 - kullanilanYillikIzin);
        model.addAttribute("izin", izin.get());
        return "personel/izin";

    }

    /**
     * Henüz onaylanmamış olan izin bilgisinin silinebilmesini saylayan metod.
     * (iznin onaylı olup olmadığı arayüzde kontrol ediliyor)
     *
     * @param id silinecek izin id.
     * @return izin bilgisi silindikten sonra izinlerin olduğu arayüze yönelndir.
     * @Link /izinDelete
     */
    @GetMapping("/izinDelete")
    public String izinDelete(@RequestParam(value = "izinId") Integer id) {
        izinRepository.deleteById(id);
        return "redirect:/personel/person";

    }

    /**
     * Yeni izin talebi veya güncellenen izin bilgilerinin veritabanına kaydedilmesini sağlayan metod.
     *
     * @param izin veritabanına kayydedilecek izin bilgileri
     * @return izin bilgisi kaydettikten sonra izinlerin olduğu arayüze yönelndir.
     * @Link /izinKaydet
     */
    @PostMapping("/izinKaydet")
    public String izinKaydet(@ModelAttribute("izin") Izin izin) {
        System.out.println(izin.getIzinTuru());
        izin.setOnaylayanAmir(kullanici.getDepartman().getAmir());
        izin.setPersonel(kullanici);
        izin.setOnay("b");
        LocalDate now = java.time.LocalDate.now();
        izin.setIzinTalepTarihi(now);
        izinRepository.save(izin);
        return "redirect:/personel/person";
    }
}
