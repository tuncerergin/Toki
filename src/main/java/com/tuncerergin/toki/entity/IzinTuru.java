package com.tuncerergin.toki.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "izin_turu", schema = "public", catalog = "toki")
public class IzinTuru implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "izin_tur", nullable = false, length = 255)
    private String izinTur;

    @Basic
    @Column(name = "izin_miktari", nullable = false)
    private int izinMiktari;
}
