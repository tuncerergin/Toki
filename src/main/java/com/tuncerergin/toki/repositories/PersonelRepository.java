package com.tuncerergin.toki.repositories;

import com.tuncerergin.toki.entity.Personel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PersonelRepository extends JpaRepository<Personel, Integer> {

    Personel findByEmail(String email);

    List<Personel> findByDepartman_Id(Integer departmanId);

    @Query("Select per from Personel per " +
            "INNER JOIN Departman dep on per.departman=dep " +
            "WHERE dep.id=?1")
    List<Personel> findPersonelByDepartman(Integer departmanId);

    @Query("Select per from Personel per " +
            "INNER JOIN Departman dep on per=dep.amir " +
            "WHERE dep.id=?1")
    Personel findByAmirByDepartman(Integer departmanId);
}
