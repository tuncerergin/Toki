package com.tuncerergin.toki.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "personel")
public class Personel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "ad"/*, nullable = false*/)
    private String ad;

    @Column(name = "soyad"/*, nullable = false*/)
    private String soyad;

    @Column(name = "tcKimlikNo"/*, nullable = false*/)
    private long tcKimlikNo;

    @Email
    @NotEmpty
    @Column(name = "email")
    private String email;

    @NotEmpty
    @Column(name = "password")
    private String password;

    @Column(name = "dogumTarihi")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past(message = "Doğum tarihini yanlış girdiniz.")
    private LocalDate dogumTarihi;

    @Column(name = "iseBaslamaTarihi"/*, nullable = false*/)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate iseBaslamaTarihi;

    @Column(name = "gorevi"/*, nullable = false*/)
    private String gorevi;

    @ToString.Exclude
    @ManyToOne(/*optional = false*/)
    private Departman departman;

    @ToString.Exclude
    @OneToMany(mappedBy = "personel")
    private Collection<Izin> izin;

    @ToString.Exclude
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "PERSON_ROLES", joinColumns = {
            @JoinColumn(name = "PERSONEL_EMAIL", referencedColumnName = "email")}, inverseJoinColumns = {
            @JoinColumn(name = "ROLE_NAME", referencedColumnName = "name")})
    private List<Role> role;
}
