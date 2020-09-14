package com.tuncerergin.toki.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.FutureOrPresent;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "izin")
public class Izin implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "izinBaslangicTarihi"/*, nullable = false*/)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @FutureOrPresent(message = "Geçmiş tarihli izin alamazsınız")
    private LocalDate izinBaslangicTarihi;

    @Column(name = "izinBitisTarihi"/*, nullable = false*/)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @FutureOrPresent(message = "Geçmiş tarihli izin alamazsınız")
    private LocalDate izinBitisTarihi;

    @Column(name = "gerekce" /*nullable = false, */)
    private String gerekce;

    @Column(name = "onay" /*nullable = false, */)
    private String onay;

    @Column(name = "onaylanmaTarihi")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate onaylanmaTarihi;

    @ToString.Exclude
    @ManyToOne(/*optional = false*/)
    private Personel personel;

    @ToString.Exclude
    @OneToOne(/*optional = false*/)
    private Personel onaylayanAmir;
}
