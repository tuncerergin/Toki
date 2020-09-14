package com.tuncerergin.toki.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "departman")
public class Departman implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "adi"/*, nullable = false*/)
    private String adi;

    @ToString.Exclude
    @OneToOne(/*optional = false*/)
    private Personel amir;

    @ToString.Exclude
    @OneToMany(mappedBy = "departman")
    private Collection<Personel> personel;

}
