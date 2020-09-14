package com.tuncerergin.toki.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {

    @Id
    private String name;

    @ToString.Exclude
    @ManyToMany()
    @JoinColumn(name = "email", referencedColumnName = "email")
    private List<Personel> personel;

    public Role(String name) {
        this.name = name;
    }
}
